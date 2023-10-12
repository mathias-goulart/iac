# Datadog agent installer

## Python Script
First we tried a python script that is compiled with PyInstaller, in order to have a single binary file with all python dependencies.

The configuration files in the `/etc/datadog-agent/conf.d` folder will be host in GitHub and downloaded by the script at runtime.

## Docker Container
Second approach is to use the Datadog Agent container.
It wrapps the dependencies and no installation of the agent is need, simplifing the update and configuration process.
All the configuration of the agent can be done during the `docker build` phase.

See the [Dockerfile](./Dockerfile) for more details.

### Open Questions
Should we distribute the docker image in a public or private repository?
Shoud it contain the API Key, mandatory to run the agent?
