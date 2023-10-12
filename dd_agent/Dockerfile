FROM public.ecr.aws/datadog/agent

COPY --chown=dd-agent:dd-agent datadog.yaml /etc/datadog-agent/datadog.yaml
COPY --chown=dd-agent:dd-agent config.d/* /etc/datadog-agent/config.d/

