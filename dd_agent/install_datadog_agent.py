import subprocess
import argparse
import yaml
import os

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
            'service': 'myservice'
        },
        {
            'type': 'file',
            'path': '/var/log/httpd/error_log',
            'source': 'apache',
            'sourcecategory': 'http_web_access',
            'service': 'myservice'
        }
    ]

    config = {'logs': logs_config}

    # Dump the updated configuration to the file
    with open(apache_conf_yaml_path, 'w') as file:
        yaml.safe_dump(config, file)

    print('INFO: Apache configuration updated.')

def restart_datadog_agent():
    print('INFO: Restarting Datadog agent...')
    # Restart Datadog agent
    subprocess.run(['sudo', 'systemctl', 'restart', 'datadog-agent'])
    print('INFO: Datadog agent restarted.')

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Install Datadog agent and update configuration')
    parser.add_argument('api_key', type=str, help='Datadog API key')

    args = parser.parse_args()

    # Check if Datadog agent is installed and running
    if is_datadog_agent_installed_and_running():
        print('INFO: Datadog agent is already installed and running.')
    else:
        # Install Datadog agent if not already installed
        install_datadog_agent(args.api_key)

    # Update Datadog configuration
    update_datadog_config()

    # Restart Datadog agent
    restart_datadog_agent()

    # Update Apache configuration
    update_apache_config()