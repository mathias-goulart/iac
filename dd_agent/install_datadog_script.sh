#!/bin/bash

# GitHub repository URL
repo_url="https://raw.githubusercontent.com/mathias-goulart/iac/main/dd_agent"
script_file="install_datadog_agent.py"

cd "/root"

# Download the Python script using curl
curl -O "$repo_url/$script_file"

# Execute the Python script
python3 "$script_file" "$DD_API_KEY" > install_datadog_agent.log

# Add a cron job to execute the script daily
if command -v crontab &> /dev/null; then
    # Use crontab command to add a cron job
    (crontab -l ; echo "0 1 * * * cd /root && python3 $script_file $DD_API_KEY > install_datadog_agent.log") | crontab -
else
    # Use echo to append a cron job to the crontab file
    echo "0 1 * * * cd /root && python3 $script_file $DD_API_KEY > install_datadog_agent.log" | sudo tee -a /etc/crontab
fi
