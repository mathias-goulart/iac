FROM datadog/agent

COPY --chown=dd-agent:dd-agent datadog.yaml /etc/datadog-agent/datadog.yaml
COPY --chown=dd-agent:dd-agent conf.d /etc/datadog-agent/conf.d
COPY --chown=dd-agent:dd-agent check.d /etc/datadog-agent/check.d

COPY --chown=dd-agent:dd-agent scripts /tmp/scripts

RUN pip install -r /tmp/scripts/dependencies.txt

# For more details, please refer to datadog official Dockerfile:
# https://github.com/DataDog/datadog-agent/tree/main/Dockerfiles

# Docker Hub official repo:
# https://hub.docker.com/r/datadog/agent