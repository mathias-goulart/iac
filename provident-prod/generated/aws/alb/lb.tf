resource "aws_lb" "tfer--PRD-AWS-LB01" {
  access_logs {
    bucket  = "prd-aws-lb01"
    enabled = "true"
  }

  desync_mitigation_mode                      = "monitor"
  drop_invalid_header_fields                  = "false"
  enable_cross_zone_load_balancing            = "true"
  enable_deletion_protection                  = "true"
  enable_http2                                = "true"
  enable_tls_version_and_cipher_suite_headers = "false"
  enable_waf_fail_open                        = "false"
  enable_xff_client_port                      = "false"
  idle_timeout                                = "1800"
  internal                                    = "false"
  ip_address_type                             = "ipv4"
  load_balancer_type                          = "application"
  name                                        = "PRD-AWS-LB01"
  preserve_host_header                        = "false"
  security_groups                             = ["sg-8ca35ff7"]

  subnet_mapping {
    subnet_id = "subnet-4cf02029"
  }

  subnet_mapping {
    subnet_id = "subnet-e77865a1"
  }

  subnet_mapping {
    subnet_id = "subnet-fdc23d8a"
  }

  subnets                    = ["subnet-4cf02029", "subnet-e77865a1", "subnet-fdc23d8a"]
  xff_header_processing_mode = "append"
}

resource "aws_lb" "tfer--PRD-ELB-VPC02" {
  access_logs {
    bucket  = "prd-elb-vpc02"
    enabled = "true"
  }

  desync_mitigation_mode                      = "monitor"
  drop_invalid_header_fields                  = "false"
  enable_cross_zone_load_balancing            = "true"
  enable_deletion_protection                  = "true"
  enable_http2                                = "true"
  enable_tls_version_and_cipher_suite_headers = "false"
  enable_waf_fail_open                        = "false"
  enable_xff_client_port                      = "false"
  idle_timeout                                = "4000"
  internal                                    = "false"
  ip_address_type                             = "ipv4"
  load_balancer_type                          = "application"
  name                                        = "PRD-ELB-VPC02"
  preserve_host_header                        = "false"
  security_groups                             = ["sg-8ca35ff7"]

  subnet_mapping {
    subnet_id = "subnet-4cf02029"
  }

  subnet_mapping {
    subnet_id = "subnet-e77865a1"
  }

  subnet_mapping {
    subnet_id = "subnet-fdc23d8a"
  }

  subnets                    = ["subnet-4cf02029", "subnet-e77865a1", "subnet-fdc23d8a"]
  xff_header_processing_mode = "append"
}

resource "aws_lb" "tfer--TST-ALB-VPC01" {
  desync_mitigation_mode                      = "defensive"
  drop_invalid_header_fields                  = "false"
  enable_cross_zone_load_balancing            = "true"
  enable_deletion_protection                  = "false"
  enable_http2                                = "true"
  enable_tls_version_and_cipher_suite_headers = "false"
  enable_waf_fail_open                        = "false"
  enable_xff_client_port                      = "false"
  idle_timeout                                = "60"
  internal                                    = "false"
  ip_address_type                             = "ipv4"
  load_balancer_type                          = "application"
  name                                        = "TST-ALB-VPC01"
  preserve_host_header                        = "false"
  security_groups                             = ["sg-0de369eddbcb900a3"]

  subnet_mapping {
    subnet_id = "subnet-4cf02029"
  }

  subnet_mapping {
    subnet_id = "subnet-e77865a1"
  }

  subnet_mapping {
    subnet_id = "subnet-fdc23d8a"
  }

  subnets                    = ["subnet-4cf02029", "subnet-e77865a1", "subnet-fdc23d8a"]
  xff_header_processing_mode = "append"
}

resource "aws_lb" "tfer--datadogmgtest-lb-tf" {
  desync_mitigation_mode                      = "defensive"
  drop_invalid_header_fields                  = "false"
  enable_cross_zone_load_balancing            = "true"
  enable_deletion_protection                  = "false"
  enable_http2                                = "true"
  enable_tls_version_and_cipher_suite_headers = "false"
  enable_waf_fail_open                        = "false"
  enable_xff_client_port                      = "false"
  idle_timeout                                = "60"
  internal                                    = "false"
  ip_address_type                             = "ipv4"
  load_balancer_type                          = "application"
  name                                        = "datadogmgtest-lb-tf"
  preserve_host_header                        = "false"
  security_groups                             = ["sg-09be14f76916fffc3"]

  subnet_mapping {
    subnet_id = "subnet-0670f078a721cc5e4"
  }

  subnet_mapping {
    subnet_id = "subnet-0de027d64403ed8ed"
  }

  subnets = ["subnet-0670f078a721cc5e4", "subnet-0de027d64403ed8ed"]

  tags = {
    Environment = "Test"
    Terraform   = "True"
  }

  tags_all = {
    Environment = "Test"
    Terraform   = "True"
  }

  xff_header_processing_mode = "append"
}
