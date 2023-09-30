data "aws_ami" "amzn-linux-2023-ami" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

resource "null_resource" "generate_ssh_key" {
  provisioner "local-exec" {
    command = "ssh-keygen -t rsa -b 2048 -f ${lower(var.customer_name)} -N ${var.key_pwd}"
  }
}

data "local_file" "ssh_key" {
  depends_on = [null_resource.generate_ssh_key]
  filename   = "${path.module}/${lower(var.customer_name)}.pub"
}

resource "aws_key_pair" "datadog_keypair" {
  key_name   = "${lower(var.customer_name)}-kp"
  public_key = data.local_file.ssh_key.content
}

resource "aws_iam_role" "ec2_instances_role" {
  name               = "${title(var.customer_name)}Ec2Role"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "ec2_instances_role_attachment" {
  role       = aws_iam_role.ec2_instances_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedEC2InstanceDefaultPolicy"
}

resource "aws_iam_instance_profile" "ssm_instance_profile" {
  name = "${lower(var.customer_name)}-ssm-instance-profile"
  role = aws_iam_role.ec2_instances_role.name
}

resource "aws_instance" "datadog_instances" {
  for_each               = local.private_sub_names
  ami                    = "ami-0648880541a3156f7" # fixed to not recreate the instance
  instance_type          = "t3.micro"
  key_name               = aws_key_pair.datadog_keypair.key_name
  subnet_id              = aws_subnet.private_subnets[each.key].id
  iam_instance_profile   = aws_iam_instance_profile.ssm_instance_profile.name
  vpc_security_group_ids = [aws_security_group.private_default_sg.id]
  user_data              = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo amazon-linux-extras install -y amazon-ssm-agent
              sudo systemctl start amazon-ssm-agent
              sudo systemctl enable amazon-ssm-agent
              sudo yum install httpd -y
              sudo systemctl start httpd
              sudo systemctl enable httpd
              sudo echo "<h1>Hello from ${lower(var.customer_name)}-${each.value.az_name}. Subnet ${lower(each.key)}</h1>" > /var/www/html/index.html
              DD_API_KEY=${datadog_api_key.dd_aws_agent_key.key} DD_REMOTE_CONFIGURATION_ENABLED=true DD_SITE="datadoghq.eu" bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script_agent7.sh)"
              EOF
  tags = {
    Name = "${lower(var.customer_name)}-${each.value.az_name}"
  }
}