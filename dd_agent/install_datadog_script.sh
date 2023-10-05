#!/bin/bash

# GitHub repository URL
repo_url="https://raw.githubusercontent.com/mathias-goulart/iac/main/dd_agent"
script_file="install_datadog_agent.py"

cd "/root"

execute_cmd="curl -fsSL $repo_url/$script_file | python3 - $DD_API_KEY"

# Execute the Python script
# python3 "$script_file" "$DD_API_KEY" > install_datadog_agent.log
bash -c $execute_cmd

# Add a cron job to execute the script daily
if command -v crontab &> /dev/null; then
    # Use crontab command to add a cron job
    (crontab -l ; echo "0 1 * * * cd /root && $execute_cmd > install_datadog_agent.log") | crontab -
else
    # Use echo to append a cron job to the crontab file
    echo "0 1 * * * cd /root && $execute_cmd > install_datadog_agent.log" | sudo tee -a /etc/crontab
fi
