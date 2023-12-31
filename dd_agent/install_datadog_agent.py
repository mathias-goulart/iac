import argparse
import boto3
import grp
import os
import pwd
import subprocess
import yaml
from botocore.exceptions import ClientError
import requests

DEFAULT_SITE = "datadoghq.eu"

def is_datadog_agent_installed_and_running():
    print('INFO: Checking if Datadog agent is installed and running...')
    try:
        # Check if the Datadog agent is installed and running using systemctl
        result = subprocess.run(['systemctl', 'is-active', 'datadog-agent'], stdout=subprocess.PIPE)
        return result.returncode == 0
    except FileNotFoundError:
        return False

def install_datadog_agent(api_key):
    print('INFO: Installing Datadog agent...')
    install_command = f'DD_API_KEY={api_key} DD_SITE="{DEFAULT_SITE}" bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script_agent7.sh)"'
    subprocess.run(install_command, shell=True)
    print('INFO: Datadog agent installation completed.')

def update_datadog_config():
    print('INFO: Updating Datadog configuration...')
    # Update process_config in the datadog.yaml file
    datadog_yaml_path = '/etc/datadog-agent/datadog.yaml'

    with open(datadog_yaml_path, 'r') as file:
        config = yaml.safe_load(file)
        config["site"] = DEFAULT_SITE
        config['process_config'] = {
            'process_collection': {
                'enabled': 'true'
            }
        }
        config["logs_enabled"] = True
        

    with open(datadog_yaml_path, 'w') as file:
        yaml.safe_dump(config, file)

    print('INFO: Datadog configuration updated.')

def change_owner_and_group(file_path, owner, group):
    print(f'INFO: Changing owner and group of {file_path}...')
    # Change owner and group of the conf.yaml file to dd-agent
    uid = pwd.getpwnam(owner).pw_uid
    gid = grp.getgrnam(group).gr_gid

    os.chown(file_path, uid, gid)

    print(f'INFO: Owner and group of {file_path} changed to {owner}:{group}.')

def set_permissions(file_path, permissions):
    print(f'INFO: Setting permissions for {file_path}...')
    # Set the permissions for the file/folder
    os.chmod(file_path, permissions)

    print(f'INFO: Permissions set for {file_path}.')

def update_apache_config():
    # Update logs configuration in apache.d/conf.yaml
    apache_conf_yaml_path = '/etc/datadog-agent/conf.d/apache.d/conf.yaml'

    if not os.path.exists(os.path.dirname(apache_conf_yaml_path)):
        os.makedirs(os.path.dirname(apache_conf_yaml_path))

    logs_config = [
        {
            'type': 'file',
            'path': '/var/log/httpd/access_log',
            'source': 'apache',
            'sourcecategory': 'http_web_access',
            'service': 'httpd'
        },
        {
            'type': 'file',
            'path': '/var/log/httpd/error_log',
            'source': 'apache',
            'sourcecategory': 'http_web_access',
            'service': 'httpd'
        }
    ]

    config = {'logs': logs_config}

    # Dump the updated configuration to the file
    with open(apache_conf_yaml_path, 'w') as file:
        yaml.safe_dump(config, file)

    print('INFO: Apache configuration updated.')

    change_owner_and_group(apache_conf_yaml_path, 'dd_agent', 'dd_agent')
    set_permissions('/var/log/httpd', 0o744)

def restart_datadog_agent():
    print('INFO: Restarting Datadog agent...')
    # Restart Datadog agent
    subprocess.run(['sudo', 'systemctl', 'restart', 'datadog-agent'])
    print('INFO: Datadog agent restarted.')

def get_secret():

    print("INFO: Trying to retrieve secret from Secrets Manager. Please wait")
    secret_name = "/datadogmgtest/dd/agent"
    region_name = "eu-west-1"

    # Create a Secrets Manager client
    session = boto3.session.Session()
    client = session.client(
        service_name='secretsmanager',
        region_name=region_name
    )

    try:
        get_secret_value_response = client.get_secret_value(
            SecretId=secret_name
        )
    except ClientError as e:
        # For a list of exceptions thrown, see
        # https://docs.aws.amazon.com/secretsmanager/latest/apireference/API_GetSecretValue.html
        print(f"ERROR: Could not retrieve agent key from {secret_name}")
        print(e)
        return ""

    print(f"INFO: Got agent key from secret {secret_name}")
    # Decrypts secret using the associated KMS key.
    return get_secret_value_response['SecretString']

def download_and_copy_github_content(repo_owner, repo_name, source_path, destination_path):
    # GitHub repository API URL
    github_api_url = f"https://api.github.com/repos/{repo_owner}/{repo_name}/contents/{source_path}"

    try:
        # Fetch the contents of the repository using the GitHub API
        response = requests.get(github_api_url)
        response.raise_for_status()
        content = response.json()

        # Create destination directory if it doesn't exist
        if not os.path.exists(destination_path):
            os.makedirs(destination_path)

        for item in content:
            # Check if it's a file
            if item['type'] == 'file':
                file_url = item['download_url']
                file_name = os.path.basename(file_url)

                # Download the file
                file_response = requests.get(file_url)
                file_response.raise_for_status()

                # Write the file to the destination directory
                with open(os.path.join(destination_path, file_name), 'wb') as f:
                    f.write(file_response.content)

                # Change the owner and group of the file
                os.chown(os.path.join(destination_path, file_name), os.geteuid(), os.getegid())

            # Recursively process subdirectories
            elif item['type'] == 'dir':
                subdirectory_source_path = item['path']
                subdirectory_destination_path = os.path.join(destination_path, os.path.basename(subdirectory_source_path))
                download_and_copy_github_content(repo_owner, repo_name, subdirectory_source_path, subdirectory_destination_path)

        # Change the owner and group of the destination directory
        os.chown(destination_path, os.geteuid(), os.getegid())

        print("Download, copy, and ownership change completed successfully.")
    except requests.exceptions.RequestException as e:
        print("Error: Failed to fetch or copy GitHub content.")
        print(e)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Install Datadog agent and update configuration')
    parser.add_argument('--key', type=str, help='Datadog API key',default="",required=False)

    args = parser.parse_args()

    api_key = args.key
    if api_key == "":
        api_key = get_secret()
    
    if api_key == "":
        print("ERROR: There is no agent key defined. Either use env vars (DD_API_KEY) or pass through argument")
        exit(1)

    # Check if Datadog agent is installed and running
    if is_datadog_agent_installed_and_running():
        print('INFO: Datadog agent is already installed and running.')
    else:
        # Install Datadog agent if not already installed
        install_datadog_agent(args.api_key)

    repo_owner = "mathias-goulart"
    repo_name = "iac"
    source_path = "conf.d"
    destination_path = "/etc/datadog-agent/conf.d"

    download_and_copy_github_content(repo_owner, repo_name, source_path, destination_path)

    restart_datadog_agent()

    # # Update Datadog configuration
    # update_datadog_config()

    # # Restart Datadog agent
    # 

    # # Update Apache configuration
    # update_apache_config()