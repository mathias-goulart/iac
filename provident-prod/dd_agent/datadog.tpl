#########################
## Basic Configuration ##
#########################

## @param api_key - string - required
## @env DD_API_KEY - string - required
## The Datadog API key to associate your Agent's data with your organization.
## Create a new API key here: https://app.datadoghq.com/account/settings

# IMPORTANT: DO NOT REMOVE THE PLACEHOLDER DD_AGENT_API_KEY
api_key: ${dd_agent_api_key}

## @param site - string - optional - default: datadoghq.com
## @env DD_SITE - string - optional - default: datadoghq.com
## The site of the Datadog intake to send Agent data to.
## Set to 'datadoghq.eu' to send data to the EU site.
## Set to 'us3.datadoghq.com' to send data to the US3 site.
## Set to 'us5.datadoghq.com' to send data to the US5 site.
## Set to 'ap1.datadoghq.com' to send data to the AP1 site.
## Set to 'ddog-gov.com' to send data to the US1-FED site.

# IMPORTANT: DO NOT REMOVE THE PLACEHOLDER DD_AGENT_API_SITE
site: ${dd_agent_api_site}

## @param dd_url - string - optional - default: https://app.datadoghq.com
## @env DD_DD_URL - string - optional - default: https://app.datadoghq.com
## @env DD_URL - string - optional - default: https://app.datadoghq.com
## The host of the Datadog intake server to send metrics to, only set this option
## if you need the Agent to send metrics to a custom URL, it overrides the site
## setting defined in "site". It does not affect APM, Logs or Live Process intake which have their
## own "*_dd_url" settings.
## If DD_DD_URL and DD_URL are both set, DD_DD_URL is used in priority.
#
# dd_url: https://app.datadoghq.com

## @param proxy - custom object - optional
## @env DD_PROXY_HTTP - string - optional
## @env DD_PROXY_HTTPS - string - optional
## @env DD_PROXY_NO_PROXY - space separated list of strings - optional
## If you need a proxy to connect to the Internet, provide it here (default:
## disabled). Refer to https://docs.datadoghq.com/agent/proxy/ to understand how to use these settings.
## For Logs proxy information, refer to https://docs.datadoghq.com/agent/proxy/#proxy-for-logs
#
# proxy:
#   https: http://<USERNAME>:<PASSWORD>@<PROXY_SERVER_FOR_HTTPS>:<PORT>
#   http: http://<USERNAME>:<PASSWORD>@<PROXY_SERVER_FOR_HTTP>:<PORT>
#   no_proxy:
#     - <HOSTNAME-1>
#     - <HOSTNAME-2>

## @param skip_ssl_validation - boolean - optional - default: false
## @env DD_SKIP_SSL_VALIDATION - boolean - optional - default: false
## Setting this option to "true" tells the Agent to skip validation of SSL/TLS certificates.
#
# skip_ssl_validation: false

## @param sslkeylogfile - string - optional - default: ""
## @env DD_SSLKEYLOGFILE - string - optional - default: ""
## sslkeylogfile specifies a destination for TLS master secrets
## in NSS key log format to allow external programs
## such as Wireshark to decrypt TLS connections.
## For more details, see https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/Key_Log_Format.
## Use of sslkeylogfile compromises security and should only be
## used for debugging.
# sslkeylogfile: ""


## @param min_tls_version - string - optional - default: "tlsv1.0"
## @env DD_MIN_TLS_VERSION - string - optional - default: "tlsv1.0"
## This option defines the minimum TLS version that will be used when
## submitting data to the Datadog intake specified in "site" or "dd_url".
## This parameter defaults to "tlsv1.2".
## Possible values are: tlsv1.0, tlsv1.1, tlsv1.2, tlsv1.3; values are case-
## insensitive.
#
# min_tls_version: "tlsv1.2"

## @param hostname - string - optional - default: auto-detected
## @env DD_HOSTNAME - string - optional - default: auto-detected
## Force the hostname name.
#
# hostname: <HOSTNAME_NAME>

## @param hostname_file - string - optional
## @env DD_HOSTNAME_FILE - string - optional
## In some environments, auto-detection of the hostname is not adequate and
## environment variables cannot be used to set the value. In such cases, the
## file on the host can also be used provide an appropriate value. If
## 'hostname' value has been set to a non-empty value, this option is ignored.
#
# hostname_file: /var/lib/cloud/data/instance-id

## @param hostname_fqdn - boolean - optional - default: false
## @env DD_HOSTNAME_FQDN - boolean - optional - default: false
## When the Agent relies on the OS to determine the hostname, make it use the
## FQDN instead of the short hostname. Recommended value: true
## More information at https://dtdg.co/flag-hostname-fqdn
#
hostname_fqdn: false

## @param hostname_trust_uts_namespace - boolean - optional - default: false
## @env DD_HOSTNAME_TRUST_UTS_NAMESPACE - boolean - optional - default: false
## By default the Agent does not trust the hostname value retrieved from non-root UTS namespace,
## as it's usually a generated name, unrelated to the host (e.g. when running in a container).
## When enabled, the Agent will trust the value retrieved from non-root UTS namespace instead of failing
## hostname resolution.
## (Linux only)
#
# hostname_trust_uts_namespace: false

## @param host_aliases - list of strings - optional
## @env DD_HOST_ALIASES - space separated list of strings - optional
## List of host aliases to report in addition to any aliases collected
## automatically from cloud providers.
## More information at
## https://docs.datadoghq.com/agent/faq/how-datadog-agent-determines-the-hostname/?tab=agentv6v7#host-aliases
#
# host_aliases:
#   - <ALIAS-1>
#   - <ALIAS-2>

## @param tags  - list of key:value elements - optional
## @env DD_TAGS - space separated list of strings - optional
## List of host tags. Attached in-app to every metric, event, log, trace, and service check emitted by this Agent.
##
## This configuration value merges with `DD_EXTRA_TAGS`, allowing some
## tags to be set in a configuration file (`tags`), and additional tags to be added
## with an environment variable (`DD_EXTRA_TAGS`).
##
## Learn more about tagging: https://docs.datadoghq.com/tagging/
#
tags:
  - host:${server_name}

## @param extra_tags  - list of key:value elements - optional
## @env DD_EXTRA_TAGS - space separated list of strings - optional
## List of host tags. Attached in-app to every metric, event, log, trace, and service check emitted by this Agent.
##
## This configuration value merges with `tags`, allowing some
## tags to be set in a configuration file (`tags`), and additional tags to be added
## with an environment variable (`DD_EXTRA_TAGS`).
##
## Learn more about tagging: https://docs.datadoghq.com/tagging/
#
# extra_tags:
#   - region:northerly
#   - <TAG_KEY>:<TAG_VALUE>

## @param env - string - optional
## @env DD_ENV - string - optional
## The environment name where the agent is running. Attached in-app to every
## metric, event, log, trace, and service check emitted by this Agent.
#
# env: <environment name>

## @param tag_value_split_separator - map - optional
## @env DD_TAG_VALUE_SPLIT_SEPARATOR - list of key:value strings - optional
## Split tag values according to a given separator. Only applies to host tags,
## and tags coming from container integrations. It does not apply to tags on dogstatsd metrics,
## and tags collected by other integrations.
##
## Example use-case:
##
##  With a raw collected tag "foo:1;2;3", using the following configuration:
##
##  tag_value_split_separator:
##    foo: ;
##
##  results in the raw tag being transformed into "foo:1", "foo:2", "foo:3" tags
#
# tag_value_split_separator:
#   <TAG_KEY>: <SEPARATOR>

## @param checks_tag_cardinality - string - optional - default: low
## @env DD_CHECKS_TAG_CARDINALITY - string - optional - default: low
## Configure the level of granularity of tags to send for checks metrics and events. Choices are:
##   * low: add tags about low-cardinality objects (clusters, hosts, deployments, container images, ...)
##   * orchestrator: add tags about pod, (in Kubernetes), or task (in ECS or Mesos) -level of cardinality
##   * high: add tags about high-cardinality objects (individual containers, user IDs in requests, ...)
## WARNING: sending container tags for checks metrics may create more metrics
## (one per container instead of one per host). This may impact your custom metrics billing.
#
# checks_tag_cardinality: low

## @param dogstatsd_tag_cardinality - string - optional - default: low
## @env DD_DOGSTATSD_TAG_CARDINALITY - string - optional - default: low
## Configure the level of granularity of tags to send for DogStatsD metrics and events. Choices are:
##   * low: add tags about low-cardinality objects (clusters, hosts, deployments, container images, ...)
##   * orchestrator: add tags about pod, (in Kubernetes), or task (in ECS or Mesos) -level of cardinality
##   * high: add tags about high-cardinality objects (individual containers, user IDs in requests, ...)
##
## WARNING: sending container tags for dogstatsd metrics may create more metrics
## (one per container instead of one per host). This may impact your custom metrics billing.
#
# dogstatsd_tag_cardinality: low

## @param histogram_aggregates - list of strings - optional - default: ["max", "median", "avg", "count"]
## @env DD_HISTOGRAM_AGGREGATES - space separated list of strings - optional - default: max median avg count
## Configure which aggregated value to compute.
## Possible values are: min, max, median, avg, sum and count.
#
# histogram_aggregates:
#   - max
#   - median
#   - avg
#   - count

## @param histogram_percentiles - list of strings - optional - default: ["0.95"]
## @env DD_HISTOGRAM_PERCENTILES - space separated list of strings - optional - default: 0.95
## Configure which percentiles are computed by the Agent. It must be a list of float between 0 and 1.
## Warning: percentiles must be specified as yaml strings
#
# histogram_percentiles:
#   - "0.95"

## @param histogram_copy_to_distribution - boolean - optional - default: false
## @env DD_HISTOGRAM_COPY_TO_DISTRIBUTION - boolean - optional - default: false
## Copy histogram values to distributions for true global distributions (in beta)
## Note: This increases the number of custom metrics created.
#
# histogram_copy_to_distribution: false

## @param histogram_copy_to_distribution_prefix - string - optional
## @env DD_HISTOGRAM_COPY_TO_DISTRIBUTION_PREFIX - string - optional
## A prefix to add to distribution metrics created when histogram_copy_to_distributions is true
#
# histogram_copy_to_distribution_prefix: "<PREFIX>"

## @param aggregator_stop_timeout - integer - optional - default: 2
## @env DD_AGGREGATOR_STOP_TIMEOUT - integer - optional - default: 2
## When stopping the agent, the Aggregator will try to flush out data ready for
## aggregation (metrics, events, ...). Data are flushed to the Forwarder in order
## to be sent to Datadog, therefore the Agent might take at most
## 'aggregator_stop_timeout'+'forwarder_stop_timeout' seconds to exit.
##
## You can set the maximum amount of time, in seconds, allocated to the
## Aggregator to do so. You can disable this feature by setting
## 'aggregator_stop_timeout' to 0.
#
# aggregator_stop_timeout: 2

## @param aggregator_buffer_size - integer - optional - default: 100
## @env DD_AGGREGATOR_BUFFER_SIZE - integer - optional - default: 100
## The default buffer size for the aggregator use a sane value for most of the
## use cases, however, it could be useful to manually set it in order to trade
## RSS usage with better performances.
#
# aggregator_buffer_size: 100

## @param forwarder_timeout - integer - optional - default: 20
## @env DD_FORWARDER_TIMEOUT - integer - optional - default: 20
## Forwarder timeout in seconds
#
# forwarder_timeout: 20

## @param forwarder_retry_queue_payloads_max_size - integer - optional - default: 15728640 (15MB)
## @env DD_FORWARDER_RETRY_QUEUE_PAYLOADS_MAX_SIZE - integer - optional - default: 15728640 (15MB)
## It defines the maximum size in bytes of all the payloads in the forwarder's retry queue.
## The actual memory used is greater than the payloads size as there are extra fields like HTTP headers,
## but no more than 2.5 times the payload size.
#
# forwarder_retry_queue_payloads_max_size: 15728640

## @param forwarder_num_workers - integer - optional - default: 1
## @env DD_FORWARDER_NUM_WORKERS - integer - optional - default: 1
## The number of workers used by the forwarder.
#
# forwarder_num_workers: 1

## @param forwarder_stop_timeout - integer - optional - default: 2
## @env DD_FORWARDER_STOP_TIMEOUT - integer - optional - default: 2
## When stopping the agent, the Forwarder will try to flush all new
## transactions (not the ones in retry state).  New transactions will be created
## as the Aggregator flush it's internal data too, therefore the Agent might take
## at most 'aggregator_stop_timeout'+'forwarder_stop_timeout' seconds to exit.
##
## You can set the maximum amount of time, in seconds, allocated to the
## Forwarder to send those transactions.  You can disable this feature by setting
## 'forwarder_stop_timeout' to 0.
#
# forwarder_stop_timeout: 2

## @param forwarder_storage_max_size_in_bytes - integer - optional - default: 0
## @env DD_FORWARDER_STORAGE_MAX_SIZE_IN_BYTES - integer - optional - default: 0
## When the retry queue of the forwarder is full, `forwarder_storage_max_size_in_bytes`
## defines the amount of disk space the Agent can use to store transactions on the disk.
## When `forwarder_storage_max_size_in_bytes` is `0`, the transactions are never stored on the disk.
#
# forwarder_storage_max_size_in_bytes: 50000000

## @param forwarder_storage_max_disk_ratio - float - optional - default: 0.8
## @env DD_FORWARDER_STORAGE_MAX_DISK_RATIO - float - optional - default: 0.8
## `forwarder_storage_max_disk_ratio` defines the disk capacity limit for storing transactions.
## `0.8` means the Agent can store transactions on disk until `forwarder_storage_max_size_in_bytes`
## is reached or when the disk mount for `forwarder_storage_path` exceeds 80% of the disk capacity,
## whichever is lower.
#
# forwarder_storage_max_disk_ratio: 0.8

## @param forwarder_outdated_file_in_days - integer - optional - default: 10
## @env DD_FORWARDER_OUTDATED_FILE_IN_DAYS - integer - optional - default: 10
## This value specifies how many days the overflow transactions will remain valid before
## being discarded. During the Agent restart, if a retry file contains transactions that were
## created more than `forwarder_outdated_file_in_days` days ago, they are removed.
#
# forwarder_outdated_file_in_days: 10

## @param forwarder_high_prio_buffer_size - int - optional - default: 100
## Defines the size of the high prio buffer.
## Increasing the buffer size can help if payload drops occur due to high prio buffer being full.
#
# forwarder_high_prio_buffer_size: 100

## @param forwarder_low_prio_buffer_size - int - optional - default: 100
## Defines the size of the low prio buffer.
#
# forwarder_low_prio_buffer_size: 100

## @param forwarder_requeue_buffer_size - int - optional - default: 100
## Defines the size of the requeue prio buffer.
#
# forwarder_requeue_buffer_size: 100

## @param forwarder_backoff_base - int - optional - default: 2
## @env DD_FORWARDER_BACKOFF_BASE - integer - optional - default: 2
## Defines the rate of exponential growth, and the first retry interval range.
## Do not set a lower value than the default. You may increase it if you use a proxy that benefits from a
## higher rate of exponential growth.
# forwarder_backoff_base: 2

## @param forwarder_backoff_max - int - optional - default: 64
## @env DD_FORWARDER_BACKOFF_MAX - integer - optional - default: 64
## Defines the maximum number of seconds to wait for a retry.
## Do not set a lower value than the default. You may increase it if you use a proxy that benefits from a
## higher maximum backoff time.
# forwarder_backoff_max: 64

## @param cloud_provider_metadata - list of strings -  optional - default: ["aws", "gcp", "azure", "alibaba", "oracle", "ibm"]
## @env DD_CLOUD_PROVIDER_METADATA - space separated list of strings - optional - default: aws gcp azure alibaba oracle ibm
## This option restricts which cloud provider endpoint will be used by the
## agent to retrieve metadata. By default the agent will try # AWS, GCP, Azure
## and alibaba providers. Some cloud provider are not enabled by default to not
## trigger security alert when querying unknown IP (for example, when enabling
## Tencent on AWS).
## Setting an empty list will disable querying any cloud metadata endpoints
## (falling back on system metadata). Disabling metadata for the cloud provider in which an Agent runs may result in
## duplicated hosts in your Datadog account and missing Autodiscovery features
##
## Possible values are:
## "aws"     AWS EC2, ECS/Fargate
## "gcp"     Google Cloud Provider
## "azure"   Azure
## "alibaba" Alibaba
## "tencent" Tencent
## "oracle"  Oracle Cloud
## "ibm"     IBM Cloud
#
# cloud_provider_metadata:
#   - "aws"
#   - "gcp"
#   - "azure"
#   - "alibaba"
#   - "oracle"
#   - "ibm"

## @param collect_ec2_tags - boolean - optional - default: false
## @env DD_COLLECT_EC2_TAGS - boolean - optional - default: false
## Collect AWS EC2 custom tags as host tags.
## Requires one of:
##  - `collect_ec2_tags_use_imds: true` and configuration of the
##    EC2 instance to allow tags in instance metadata; or
##  - configuration of the EC2 instance to have an IAM role with
##    the `EC2:DescribeTags` permission.
## See docs for further details:
## https://docs.datadoghq.com/integrations/faq/how-do-i-pull-my-ec2-tags-without-using-the-aws-integration/
#
# collect_ec2_tags: false

## @param exclude_ec2_tags - list of strings - optional - default: []
## @env DD_EXCLUDE_EC2_TAGS - space separated list of strings - optional - default: []
## EC2 tags to exclude from being converted into host tags -- only applicable when collect_ec2_tags is true. This does
## not impact tags collected by the AWS Integration (see https://docs.datadoghq.com/integrations/amazon_web_services/
## for more information on the AWS integration).
#
# exclude_ec2_tags: []

## @param collect_ec2_tags_use_imds - boolean - optional - default: false
## @env DD_COLLECT_EC2_TAGS_USE_IMDS - boolean - optional - default: false
## Use instance metadata service (IMDS) instead of EC2 API to collect AWS EC2 custom tags.
## Requires `collect_ec2_tags`.
#
# collect_ec2_tags_use_imds: false

## @param ec2_metadata_timeout - integer - optional - default: 300
## @env DD_EC2_METADATA_TIMEOUT - integer - optional - default: 300
## Timeout in milliseconds on calls to the AWS EC2 metadata endpoints.
#
# ec2_metadata_timeout: 300

## @param ec2_prefer_imdsv2 - boolean - optional - default: false
## @env DD_EC2_PREFER_IMDSV2 - boolean - optional - default: false
## If this flag is true then the agent will request EC2 metadata using IMDS v2,
## which offers additional security for accessing metadata. However, in some
## situations (such as a containerized agent on a plain EC2 instance) it may
## require additional configuration on the AWS side. See the AWS guidelines
## for further details:
## https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/configuring-instance-metadata-service.html#instance-metadata-transition-to-version-2
#
# ec2_prefer_imdsv2: false

## @param collect_gce_tags - boolean - optional - default: true
## @env DD_COLLECT_GCE_TAGS - boolean - optional - default: true
## Collect Google Cloud Engine metadata as host tags
#
# collect_gce_tags: true

## @param exclude_gce_tags - list of strings - optional - default: ["kube-env", "kubelet-config", "containerd-configure-sh", "startup-script", "shutdown-script", "configure-sh", "sshKeys", "ssh-keys", "user-data", "cli-cert", "ipsec-cert", "ssl-cert", "google-container-manifest", "bosh_settings"]
## @env DD_EXCLUDE_GCE_TAGS - space separated list of strings - optional - default: kube-env kubelet-config containerd-configure-sh startup-script shutdown-script configure-sh sshKeys ssh-keys user-data cli-cert ipsec-cert ssl-cert google-container-manifest bosh_settings
## Google Cloud Engine metadata attribute to exclude from being converted into
## host tags -- only applicable when collect_gce_tags is true.
#
# exclude_gce_tags:
#   - "kube-env"
#   - "kubelet-config"
#   - "containerd-configure-sh"
#   - "startup-script"
#   - "shutdown-script"
#   - "configure-sh"
#   - "sshKeys"
#   - "ssh-keys"
#   - "user-data"
#   - "cli-cert"
#   - "ipsec-cert"
#   - "ssl-cert"
#   - "google-container-manifest"
#   - "bosh_settings"

## @param gce_send_project_id_tag - bool - optional - default: false
## @env DD_GCE_SEND_PROJECT_ID_TAG - bool - optional - default: false
## Send the project ID host tag with the `project_id:` tag key in addition to
## the `project:` tag key.
#
# gce_send_project_id_tag: false

## @param gce_metadata_timeout - integer - optional - default: 1000
## @env DD_GCE_METADATA_TIMEOUT - integer - optional - default: 1000
## Timeout in milliseconds on calls to the GCE metadata endpoints.
#
# gce_metadata_timeout: 1000

## @param azure_hostname_style - string - optional - default: "os"
## @env DD_AZURE_HOSTNAME_STYLE - string - optional - default: "os"
## Changes how agent hostname is set on Azure virtual machines.
##
## Possible values:
##   "os" - use the hostname reported by the operating system (default)
##   "name" - use the instance name
##   "name_and_resource_group" - use a combination of the instance name and resource group name
##   "full" - use a combination of the instance name, resource group name and subscription id
##   "vmid" - use the instance id
#
# azure_hostname_style: "os"

## @param flare_stripped_keys - list of strings - optional
## @env DD_FLARE_STRIPPED_KEYS - space separated list of strings - optional
## By default, the Agent removes known sensitive keys from Agent and Integrations yaml configs before
## including them in the flare.
## Use this parameter to define additional sensitive keys that the Agent should scrub from
## the yaml files included in the flare.
#
# flare_stripped_keys:
#   - "sensitive_key_1"
#   - "sensitive_key_2"

## @param no_proxy_nonexact_match - boolean - optional - default: false
## @env DD_NO_PROXY_NONEXACT_MATCH - boolean - optional - default: false
## Enable more flexible no_proxy matching. See https://godoc.org/golang.org/x/net/http/httpproxy#Config
## for more information on accepted matching criteria.
#
# no_proxy_nonexact_match: false

## @param use_proxy_for_cloud_metadata - boolean - optional - default: false
## @env DD_USE_PROXY_FOR_CLOUD_METADATA - boolean - optional - default: false
## By default cloud provider IP's are added to the transport's `no_proxy` list.
## Use this parameter to remove them from the `no_proxy` list.
#
# use_proxy_for_cloud_metadata: false

## @param inventories_configuration_enabled - boolean - optional - default: true
## @env DD_INVENTORIES_CONFIGURATION_ENABLED - boolean - optional - default: true
## By default the Agent sends its own configuration to Datadog to be displayed in the `Agent Configuration` section of the host
## detail panel. See https://docs.datadoghq.com/infrastructure/list/#agent-configuration for more information.
##
## The Agent configuration is scrubbed of any sensitive information.
#
# inventories_configuration_enabled: true

## @param auto_exit - custom object - optional
## Configuration for the automatic exit mechanism: the Agent stops when some conditions are met.
#
# auto_exit:

  ## @param noprocess - custom object - optional
  ## Configure the `noprocess` automatic exit method.
  ## Detect when no other processes (non-agent) are running to trigger automatic exit. `HOST_PROC` is taken into account when gathering processes.
  ## Feature is only supported on POSIX systems.
  #
  # noprocess:
    ## @param enabled - boolean - optional - default: false
    ## @env DD_AUTO_EXIT_NOPROCESS_ENABLED - boolean - optional - default: false
    ## Enable the `noprocess` method
    #
    # enabled: false

    ## @param excluded_processes - list of strings - optional
    ## @env DD_AUTO_EXIT_NOPROCESS_EXCLUDED_PROCESSES - space separated list of strings - optional
    ## List of regular expressions to exclude extra processes (on top of built-in list).
    #
    # excluded_processes: []

  ## @param validation_period - integer - optional - default: 60
  ## @env DD_AUTO_EXIT_VALIDATION_PERIOD - integer - optional - default: 60
  ## Time (in seconds) delay during which the auto exit validates that the selected method continuously detects an exit condition, before exiting.
  ## The value is verified every 30s. By default, three consecutive checks need to return true to trigger an automatic exit.
  #
  # validation_period: 60


## @param fips - custom object - optional
## [BETA] Enter specific configurations for using the FIPS proxy.
## Uncomment this parameter and the one below to enable them.
#
# fips:

  ## @param enabled - boolean - optional - default: false
  ## @env DD_FIPS_ENABLED - boolean - optional - default: false
  ## This feature is in BETA.
  ##
  ## Enable the use of the FIPS proxy to send data to the DataDog backend. Enabling this will force all outgoing traffic
  ## from the Agent to the local proxy.
  ## It's important to note that enabling this will not make the Datadog Agent FIPS compliant, but will force all outgoing
  ## traffic to a local FIPS compliant proxy. The FIPS proxy need to be installed locally in addition to the agent.
  ##
  ## When setting this to true the following settings would be overridden, ignoring the values from the
  ## configuration:
  ## - dd_url
  ## - apm_config.apm_dd_url
  ## - apm_config.profiling_dd_url
  ## - apm_config.telemetry.dd_url
  ## - process_config.process_dd_url
  ## - logs_config.use_http
  ## - logs_config.logs_no_ssl
  ## - logs_config.logs_dd_url
  ## - database_monitoring.metrics.dd_url
  ## - database_monitoring.activity.dd_url
  ## - database_monitoring.samples.dd_url
  ## - network_devices.metadata.dd_url
  #
  ## The agent will also ignore 'proxy.*' settings and environment variables related to proxy (HTTP_PROXY, HTTPS_PROXY,
  ## DD_PROXY_HTTP and DD_PROXY_HTTPS).
  #
  # enabled: false

  ## @param local_address - string - optional - default: localhost
  ## @env DD_FIPS_LOCAL_ADDRESS - string - optional - default: localhost
  ## The local address that the FIPS proxy will bind ports on.
  #
  # local_address: localhost

## @param observability_pipelines_worker - custom object - optional
## Configuration for forwarding telemetry to an Observability Pipelines Worker instead of Datadog.
## https://www.datadoghq.com/product/observability-pipelines/
## Note: This config is interchangeable with `vector`
#
# observability_pipelines_worker:

  ## @param  metrics - custom object - optional
  ## Specific configurations for metrics
  #
  # metrics:

    ## @param enabled - boolean - optional - default: false
    ## @env DD_OBSERVABILITY_PIPELINES_WORKER_METRICS_ENABLED - boolean - optional - default: false
    ## Enables forwarding of metrics to an Observability Pipelines Worker
    #
    # enabled: false

    ## @param url - string - optional - default: ""
    ## @env DD_OBSERVABILITY_PIPELINES_WORKER_METRICS_URL - string - optional - default: ""
    ## URL endpoint for the Observability Pipelines Worker to send metrics to
    #
    # url: "http//127.0.0.1:8080"

  ## @param  logs - custom object - optional
  ## Specific configurations for logs
  #
  # logs:

    ## @param enabled - boolean - optional - default: false
    ## @env DD_OBSERVABILITY_PIPELINES_WORKER_LOGS_ENABLED - boolean - optional - default: false
    ## Enables forwarding of logs to an Observability Pipelines Worker
    #
    # enabled: false

    ## @param url - string - optional - default: ""
    ## @env DD_OBSERVABILITY_PIPELINES_WORKER_LOGS_URL - string - optional - default: ""
    ## URL endpoint for the Observability Pipelines Worker to send logs to
    #
    # url: "http//127.0.0.1:8080"

  ## @param  traces - custom object - optional
  ## Specific configurations for traces
  #
  # traces:

    ## @param enabled - boolean - optional - default: false
    ## @env DD_OBSERVABILITY_PIPELINES_WORKER_TRACES_ENABLED - boolean - optional - default: false
    ## Enables forwarding of traces to an Observability Pipelines Worker
    #
    # enabled: false

    ## @param url - string - optional - default: ""
    ## @env DD_OBSERVABILITY_PIPELINES_WORKER_TRACES_URL - string - optional - default: ""
    ## URL endpoint for the Observability Pipelines Worker to send traces to
    #
    # url: "http//127.0.0.1:8080"



############################
## Advanced Configuration ##
############################

## @param confd_path - string - optional
## @env DD_CONFD_PATH - string - optional
## The path containing check configuration files. By default, uses the conf.d folder
## located in the Agent configuration folder.
#
# confd_path: ""

## @param additional_checksd - string - optional
## @env DD_ADDITIONAL_CHECKSD - string - optional
## Additional path indicating where to search for Python checks. By default, uses the checks.d folder
## located in the Agent configuration folder.
#
# additional_checksd: <CHECKD_FOLDER_PATH>

## @param expvar_port - integer - optional - default: 5000
## @env DD_EXPVAR_PORT - integer - optional - default: 5000
## The port for the go_expvar server.
#
# expvar_port: 5000

## @param cmd_port - integer - optional - default: 5001
## @env DD_CMD_PORT - integer - optional - default: 5001
## The port on which the IPC api listens.
#
# cmd_port: 5001

## @param GUI_port - integer - optional
## @env DD_GUI_PORT - integer - optional
## The port for the browser GUI to be served.
## Setting 'GUI_port: -1' turns off the GUI completely
## Default is:
##  * Windows & macOS : `5002`
##  * Linux: `-1`
##
#
# GUI_port: <GUI_PORT>

## @param health_port - integer - optional - default: 0
## @env DD_HEALTH_PORT - integer - optional - default: 0
## The Agent can expose its health check on a dedicated http port.
## This is useful for orchestrators that support http probes.
## Default is 0 (disabled), set a valid port number (eg. 5555) to enable.
#
# health_port: 0

## @param check_runners - integer - optional - default: 4
## @env DD_CHECK_RUNNERS - integer - optional - default: 4
## The `check_runners` refers to the number of concurrent check runners available for check instance execution.
## The scheduler attempts to spread the instances over the collection interval and will _at most_ be
## running the number of check runners instances concurrently.
## Setting the value to 1 would result in checks running sequentially.
##
## This is a sensitive setting, and we do NOT recommend changing the default number
## of check runners in the general case. The level of concurrency has effects on
## the Agent's: RSS memory, CPU load, resource contention overhead, etc.
#
# check_runners: 4

## @param enable_metadata_collection - boolean - optional - default: true
## @env DD_ENABLE_METADATA_COLLECTION - boolean - optional - default: true
## Metadata collection should always be enabled, except if you are running several
## agents/dsd instances per host. In that case, only one Agent should have it on.
## WARNING: disabling it on every Agent leads to display and billing issues.
#
# enable_metadata_collection: true

## @param enable_gohai - boolean - optional - default: true
## @env DD_ENABLE_GOHAI - boolean - optional - default: true
## Enable the gohai collection of systems data.
#
# enable_gohai: true

## @param server_timeout - integer - optional - default: 30
## @env DD_SERVER_TIMEOUT - integer - optional - default: 30
## IPC api server timeout in seconds.
#
# server_timeout: 30

## @param procfs_path - string - optional
## @env DD_PROCFS_PATH - string - optional
## Some environments may have the procfs file system mounted in a miscellaneous
## location. The procfs_path configuration parameter provides a mechanism to
## override the standard default location: '/proc' - this setting trickles down to
## integrations and affect their behavior if they rely on the psutil python package.
#
# procfs_path: <PROCFS_PATH>

## @param disable_py3_validation - boolean - optional - default: false
## @env DD_DISABLE_PY3_VALIDATION - boolean - optional - default: false
## Disable Python3 validation of python checks.
#
# disable_py3_validation: false
#
## @param python3_linter_timeout - integer - optional - default: 120
## @env DD_PYTHON3_LINTER_TIMEOUT - integer - optional - default: 120
## Timeout in seconds for validation of compatibility with python 3 when running python 2.
#
# python3_linter_timeout: 120

## @param memtrack_enabled - boolean - optional - default: true
## @env DD_MEMTRACK_ENABLED - boolean - optional - default: true
## Enables tracking of memory allocations made from the python runtime loader.
#
# memtrack_enabled: true

## @param tracemalloc_debug - boolean - optional - default: false
## @env DD_TRACEMALLOC_DEBUG - boolean - optional - default: false
## Enables debugging with tracemalloc for python checks.
## Please note that this option is only available when python_version is set to "3".
## Additionally when this option becomes effective the number of check runners is
## overridden to 1.
#
# tracemalloc_debug: false

## @param tracemalloc_include - string - optional
## @env DD_TRACEMALLOC_INCLUDE - string - optional
## Comma-separated list of Python checks to enable tracemalloc for when `tracemalloc_debug` is true.
## By default, all Python checks are enabled.
#
# tracemalloc_include: <TRACEMALLOC_EXCLUDE>

## @param tracemalloc_exclude - string - optional
## @env DD_TRACEMALLOC_EXCLUDE - string - optional
## Comma-separated list of Python checks to disable tracemalloc for when `tracemalloc_debug` is true.
## By default, all Python checks are enabled. This setting takes precedence over `tracemalloc_include`.
#
# tracemalloc_exclude: <TRACEMALLOC_INCLUDE>

## @param windows_use_pythonpath - boolean - optional
## @env DD_WINDOWS_USE_PYTHONPATH - boolean - optional
## Whether to honour the value of the PYTHONPATH env var when set on Windows.
## Disabled by default, so we only load Python libraries bundled with the Agent.
#
# windows_use_pythonpath: false

## @param secret_backend_command - string - optional
## @env DD_SECRET_BACKEND_COMMAND - string - optional
## `secret_backend_command` is the path to the script to execute to fetch secrets.
## The executable must have specific rights that differ on Windows and Linux.
##
## For more information see: https://github.com/DataDog/datadog-agent/blob/main/docs/agent/secrets.md
#
# secret_backend_command: <COMMAND_PATH>

## @param secret_backend_arguments - list of strings - optional
## @env DD_SECRET_BACKEND_ARGUMENTS - space separated list of strings - optional
## If secret_backend_command is set, specify here a list of arguments to give to the command at each run.
#
# secret_backend_arguments:
#   - <ARGUMENT_1>
#   - <ARGUMENT_2>

## @param secret_backend_output_max_size - integer - optional - default: 1048576
## @env DD_SECRET_BACKEND_OUTPUT_MAX_SIZE - integer - optional - default: 1048576
## The size in bytes of the buffer used to store the command answer (apply to both stdout and stderr)
#
# secret_backend_output_max_size: 1048576

## @param secret_backend_timeout - integer - optional - default: 30
## @env DD_SECRET_BACKEND_TIMEOUT - integer - optional - default: 30
## The timeout to execute the command in second
#
# secret_backend_timeout: 30

## @param secret_backend_skip_checks - boolean - optional - default: false
## @env DD_SECRET_BACKEND_SKIP_CHECKS - boolean - optional - default: false
## Disable fetching secrets for check configurations
#
# secret_backend_skip_checks: false
#

## @param secret_backend_remove_trailing_line_break - boolean - optional - default: false
## @env DD_SECRET_BACKEND_REMOVE_TRAILING_LINE_BREAK - boolean - optional - default: false
## Remove trailing line breaks from secrets returned by the secret_backend_command. Some secret management tools automatically
## add a line break when exporting secrets through files.
#
# secret_backend_remove_trailing_line_break: false

## @param snmp_listener - custom object - optional
## Creates and schedules a listener to automatically discover your SNMP devices.
## Discovered devices can then be monitored with the SNMP integration by using
## the auto_conf.yaml file provided by default.
#
# snmp_listener:

  ## @param workers - integer - optional - default: 2
  ## The number of concurrent tasks used to discover SNMP devices. Increasing this value
  ## discovers devices faster but at the cost of increased resource consumption.
  #
  # workers: 2

  ## @param discovery_interval - integer - optional - default: 3600
  ## How often to discover new SNMP devices, in seconds. Decreasing this value
  ## discovers devices faster (within the limit of the time taken to scan subnets)
  ## but at the cost of increased resource consumption.
  #
  # discovery_interval: 3600

  ## @param discovery_allowed_failures - integer - optional - default: 3
  ## The number of failed requests to a given SNMP device before removing it from the list of monitored
  ## devices.
  ## If a device shuts down, the Agent stops monitoring it after `discovery_interval * discovery_allowed_failures` seconds.
  #
  # discovery_allowed_failures: 3

  ## @param loader - string - optional - default: python
  ## Check loader to use. Available loaders:
  ## - core: (recommended) Uses new corecheck SNMP integration
  ## - python: Uses legacy python SNMP integration
  #
  # loader: core

  ## @param min_collection_interval - number - optional - default: 15
  ## This changes the collection interval for the check instances created
  ## from discovered SNMP devices.
  ## For more information, see:
  ## https://docs.datadoghq.com/developers/write_agent_check/#collection-interval
  #
  # min_collection_interval: 15

  ## @param use_device_id_as_hostname - boolean - optional - default: false
  ## Use `device:<DEVICE_ID>` (device_id is composed of `<NAMESPACE>:<DEVICE_IP_ADDRESS>`) as `hostname`
  ## for metrics and service checks (meaning that metrics and services checks will have
  ## `host:device:<DEVICE_ID>` as tag).
  ## This option is needed for custom tags.
  #
  # use_device_id_as_hostname: true

  ## @param configs - list - required
  ## The actual list of configurations used to discover SNMP devices in various subnets.
  ## Example:
  ## configs:
  ##  - network_address: 10.0.0.0/24
  ##    snmp_version: 1
  ##    community_string: public
  ##  - network_address: 10.0.1.0/28
  ##    community_string: public
  ##    ignored_ip_addresses:
  ##      - 10.0.1.0
  ##      - 10.0.1.1
  #
  # configs:
    ## @param network_address - string - required
    ## The subnet in CIDR format to scan for SNMP devices.
    ## All unignored IP addresses in the CIDR range are scanned.
    ## For optimal discovery time, be sure to use the smallest network mask
    ## possible as is appropriate for your network topology.
    ## Ex: 10.0.1.0/24
    #
    # - network_address: <NETWORK>

    ## @param ignored_ip_addresses - list of strings - optional
    ## A list of IP addresses to ignore when scanning the network.
    #
    # ignored_ip_addresses:
    #   - <IP_ADDRESS_1>
    #   - <IP_ADDRESS_2>

    ## @param port - integer - optional - default: 161
    ## The UDP port to use when connecting to SNMP devices.
    #
    # port: 161

    ## @param snmp_version - integer - optional - default: <BEST_GUESS>
    ## Set the version of the SNMP protocol. Available options are: `1`, `2` or `3`.
    ## If unset, the Agent tries to guess the correct version based on other configuration
    ## parameters, for example: if `user` is set, the Agent uses SNMP v3.
    #
    # snmp_version: <VERSION>

    ## @param timeout - integer - optional - default: 5
    ## The number of seconds before timing out.
    #
    # timeout: 5

    ## @param retries - integer - optional - default: 3
    ## The number of retries before failure.
    #
    # retries: 3

    ## @param community_string - string - optional
    ## Required for SNMP v1 & v2.
    ## Enclose the community string with single quote like below (to avoid special characters being interpreted).
    ## Ex: 'public'
    #
    # community_string: '<COMMUNITY>'

    ## @param user - string - optional
    ## The username to connect to your SNMP devices.
    ## SNMPv3 only.
    #
    # user: <USERNAME>

    ## @param authKey - string - optional
    ## The passphrase to use with your Authentication type.
    ## SNMPv3 only.
    #
    # authKey: <AUTHENTICATION_KEY>

    ## @param authProtocol - string - optional
    ## The authentication protocol to use when connecting to your SNMP devices.
    ## Available options are: MD5, SHA, SHA224, SHA256, SHA384, SHA512
    ## Defaults to MD5 when `authentication_key` is specified.
    ## SNMPv3 only.
    #
    # authProtocol: <AUTHENTICATION_PROTOCOL>

    ## @param privKey - string - optional
    ## The passphrase to use with your privacy protocol.
    ## SNMPv3 only.
    #
    # privKey: <PRIVACY_KEY>

    ## @param privProtocol - string - optional
    ## The privacy protocol to use when connecting to your SNMP devices.
    ## Available options are: DES, AES (128 bits), AES192, AES192C, AES256, AES256C
    ## Defaults to DES when `privacy_key` is specified.
    ## SNMPv3 only.
    #
    # privProtocol: <PRIVACY_PROTOCOL>

    ## @param context_name - string - optional
    ## The name of your context (optional SNMP v3-only parameter).
    #
    # context_name: <CONTEXT_NAME>

    ## @param tags - list of strings - optional
    ## A list of tags to attach to every metric and service check of all devices discovered in the subnet.
    ##
    ## Learn more about tagging at https://docs.datadoghq.com/tagging
    #
    # tags:
    #   - <KEY_1>:<VALUE_1>
    #   - <KEY_2>:<VALUE_2>

    ## @param ad_identifier - string - optional - default: snmp
    ## A unique identifier to attach to devices from that subnetwork.
    ## When configuring the SNMP integration in snmp.d/auto_conf.yaml,
    ## specify the corresponding ad_identifier at the top of the file.
    #
    # ad_identifier: snmp

    ## @param loader - string - optional - default: python
    ## Check loader to use. Available loaders:
    ## - core: will use corecheck SNMP integration
    ## - python: will use python SNMP integration
    #
    # loader: core

    ## @param min_collection_interval - number - optional - default: 15
    ## This changes the collection interval for the check instances created from
    ## discovered SNMP devices. It applies to each specific config from `snmp_listener.configs`
    ## and has precedence over `snmp_listener.min_collection_interval`.
    ## For more information, see:
    ## https://docs.datadoghq.com/developers/write_agent_check/#collection-interval
    #
    # min_collection_interval: 15

    ## @param use_device_id_as_hostname - boolean - optional - default: false
    ## Use `device:<DEVICE_ID>` (device_id is composed of `<NAMESPACE>:<DEVICE_IP_ADDRESS>`) as `hostname`
    ## for metrics and service checks (meaning that metrics and services checks will have
    ## `host:device:<DEVICE_ID>` as tag).
    ## This option is needed for custom tags.
    #
    # use_device_id_as_hostname: true

    ## @param oid_batch_size - integer - optional - default: 5
    ## The number of OIDs handled by each batch.
    #
    # oid_batch_size: 5

    ## @param interface_configs - map - optional
    ## This option is used to override interface inbound/outbound speed and add interface tags
    ## Example:
    ## interface_configs:
    ##   "10.0.0.1":              # target device IP address
    ##     - match_field: "name"  # (required) the field to match, can be `name` (interface name) or `index` (ifIndex)
    ##       match_value: "eth0"  # (required) the value to match
    ##       in_speed: 50         # (optional) inbound speed value in bits per sec, no value or 0 means no override
    ##       out_speed: 25        # (optional) outbound speed value in bits per sec, no value or 0 means no override
    ##       tags:                # (optional) interface level tags
    ##         - "testTagKey:testTagValue"
    ##         - "tagKey2:tagValue2"
    #
    # interface_config:
    #   "10.0.0.1":
    #     - match_field: name
    #       match_value: eth0
    #       in_speed: 50
    #       out_speed: 25
    #     - match_field: index
    #       match_value: '10'
    #       in_speed: 50
    #       out_speed: 25
    #   "10.0.0.2":
    #     - match_field: name
    #       match_value: eth3
    #       in_speed: 50
    #       out_speed: 25
    #   "10.0.0.3":
    #     - match_field: name
    #       match_value: eth4
    #       tags:
    #         - "monitored:true"
    #         - "customKey:customValue"


##################################
## Log collection Configuration ##
##################################

## @param logs_enabled - boolean - optional - default: false
## @env DD_LOGS_ENABLED - boolean - optional - default: false
## Enable Datadog Agent log collection by setting logs_enabled to true.
#
logs_enabled: true

## @param logs_config - custom object - optional
## Enter specific configurations for your Log collection.
## Uncomment this parameter and the one below to enable them.
## See https://docs.datadoghq.com/agent/logs/
#
# logs_config:

  ## @param container_collect_all - boolean - optional - default: false
  ## @env DD_LOGS_CONFIG_CONTAINER_COLLECT_ALL - boolean - optional - default: false
  ## Enable container log collection for all the containers (see ac_exclude to filter out containers)
  #
  # container_collect_all: false

  ## @param logs_dd_url - string - optional
  ## @env DD_LOGS_CONFIG_DD_URL - string - optional
  ## Define the endpoint and port to hit when using a proxy for logs. The logs are forwarded in TCP
  ## therefore the proxy must be able to handle TCP connections.
  #
  # logs_dd_url: <ENDPOINT>:<PORT>

  ## @param logs_no_ssl - boolean - optional - default: false
  ## @env DD_LOGS_CONFIG_LOGS_NO_SSL - optional - default: false
  ## Disable the SSL encryption. This parameter should only be used when logs are
  ## forwarded locally to a proxy. It is highly recommended to then handle the SSL encryption
  ## on the proxy side.
  #
  # logs_no_ssl: false

  ## @param processing_rules - list of custom objects - optional
  ## @env DD_LOGS_CONFIG_PROCESSING_RULES - list of custom objects - optional
  ## Global processing rules that are applied to all logs. The available rules are
  ## "exclude_at_match", "include_at_match" and "mask_sequences". More information in Datadog documentation:
  ## https://docs.datadoghq.com/agent/logs/advanced_log_collection/#global-processing-rules
  #
  # processing_rules:
  #   - type: <RULE_TYPE>
  #     name: <RULE_NAME>
  #     pattern: <RULE_PATTERN>

  ## @param force_use_http - boolean - optional - default: false
  ## @env DD_LOGS_CONFIG_FORCE_USE_HTTP - boolean - optional - default: false
  ## By default, the Agent sends logs in HTTPS batches to port 443 if HTTPS connectivity can
  ## be established at Agent startup, and falls back to TCP otherwise. Set this parameter to `true` to
  ## always send logs with HTTPS (recommended).
  #
  # force_use_http: true

  ## @param force_use_tcp - boolean - optional - default: false
  ## @env DD_LOGS_CONFIG_FORCE_USE_TCP - boolean - optional - default: false
  ## By default, logs are sent through HTTPS if possible, set this parameter
  ## to `true` to always send logs via TCP. If `use_http` is set to `true`, this parameter
  ## is ignored.
  #
  # force_use_tcp: true

  ## @param use_compression - boolean - optional - default: false
  ## @env DD_LOGS_CONFIG_USE_COMPRESSION - boolean - optional - default: false
  ## This parameter is available when sending logs with HTTPS. If enabled, the Agent
  ## compresses logs before sending them.
  #
  # use_compression: true

  ## @param compression_level - integer - optional - default: 6
  ## @env DD_LOGS_CONFIG_COMPRESSION_LEVEL - boolean - optional - default: false
  ## The compression_level parameter accepts values from 0 (no compression)
  ## to 9 (maximum compression but higher resource usage). Only takes effect if
  ## `use_compression` is set to `true`.
  #
  # compression_level: 6

  ## @param batch_wait - integer - optional - default: 5
  ## @env DD_LOGS_CONFIG_BATCH_WAIT - integer - optional - default: 5
  ## The maximum time the Datadog Agent waits to fill each batch of logs before sending.
  #
  # batch_wait: 5

  ## @param open_files_limit - integer - optional - default: 500
  ## @env DD_LOGS_CONFIG_OPEN_FILES_LIMIT - integer - optional - default: 500
  ## The maximum number of files that can be tailed in parallel.
  ## Note: the default for windows and Mac OS is 200. The default for
  ## all other systems is 500.
  #
  # open_files_limit: 500

  ## @param file_wildcard_selection_mode - string - optional - default: `by_name`
  ## @env DD_LOGS_CONFIG_FILE_WILDCARD_SELECTION_MODE - string - optional - default: `by_name`
  ## The strategy used to prioritize wildcard matches if they exceed the open file limit.
  ##
  ## Choices are `by_name` and `by_modification_time`.
  ##
  ## `by_name` means that each log source is considered and the matching files are ordered
  ## in reverse name order. While there are less than `logs_config.open_files_limit` files
  ## being tailed, this process repeats, collecting from each configured source.
  ##
  ## `by_modification_time` takes all log sources and first adds any log sources that
  ## point to a specific file. Next, it finds matches for all wildcard sources.
  ## This resulting list is ordered by which files have been most recently modified
  ## and the top `logs_config.open_files_limit` most recently modified files are
  ## chosen for tailing.
  ##
  ## WARNING: `by_modification_time` is less performant than `by_name` and will trigger
  ## more disk I/O at the configured wildcard log paths.
  #
  # file_wildcard_selection_mode: `by_name`



####################################
## Trace Collection Configuration ##
####################################

## @param apm_config - custom object - optional
## Enter specific configurations for your trace collection.
## Uncomment this parameter and the one below to enable them.
## See https://docs.datadoghq.com/agent/apm/
#
# apm_config:

  ## @param enabled - boolean - optional - default: true
  ## @env DD_APM_ENABLED - boolean - optional - default: true
  ## Set to true to enable the APM Agent.
  #
  # enabled: true

  ## @param env - string - optional - default: none
  ## @env DD_APM_ENV - string - optional - default: none
  ## The environment tag that Traces should be tagged with.
  ## If not set the value will be inherited, in order, from the top level
  ## "env" config option if set and then from the 'env:' tag if present in the
  ## 'tags' top level config option.
  #
  # env: none

  ## @param receiver_port - integer - optional - default: 8126
  ## @env DD_APM_RECEIVER_PORT - integer - optional - default: 8126
  ## The port that the trace receiver should listen on.
  ## Set to 0 to disable the HTTP receiver.
  #
  # receiver_port: 8126

  ## @param receiver_socket - string - optional
  ## @env DD_APM_RECEIVER_SOCKET - string - optional
  ## Accept traces through Unix Domain Sockets.
  ## It is off by default. When set, it must point to a valid socket file.
  #
  # receiver_socket: <UNIX_SOCKET_PATH>

  ## @param apm_non_local_traffic - boolean - optional - default: false
  ## @env DD_APM_NON_LOCAL_TRAFFIC - boolean - optional - default: false
  ## Set to true so the Trace Agent listens for non local traffic,
  ## i.e if Traces are being sent to this Agent from another host/container
  #
  # apm_non_local_traffic: false

  ## @param apm_dd_url - string - optional
  ## @env DD_APM_DD_URL - string - optional
  ## Define the endpoint and port to hit when using a proxy for APM. The traces are forwarded in TCP
  ## therefore the proxy must be able to handle TCP connections.
  #
  # apm_dd_url: <ENDPOINT>:<PORT>

  ## @param max_traces_per_second - integer - optional - default: 10
  ## @env DD_APM_MAX_TPS - integer - optional - default: 10
  ## The target traces per second to sample. Sampling rates to apply are adjusted given
  ## the received traffic and communicated to tracers. This configures head base sampling.
  ## As of 7.35.0 sampling cannot be disabled and setting 'max_traces_per_second' to 0 no longer
  ## disables sampling, but instead sends no traces to the intake. To avoid rate limiting, set this
  ## value sufficiently high for your traffic pattern.
  #
  # max_traces_per_second: 10

  ## @param errors_per_second - integer - optional - default: 10
  ## @env DD_APM_ERROR_TPS - integer - optional - default: 10
  ## The target error trace chunks to receive per second. The TPS is spread
  ## to catch all combinations of service, name, resource, http.status, and error.type.
  ## Set to 0 to disable the errors sampler.
  #
  # errors_per_second: 10

  ## @param max_events_per_second - integer - optional - default: 200
  ## @env DD_APM_MAX_EPS - integer - optional - default: 200
  ## Maximum number of APM events per second to sample.
  #
  # max_events_per_second: 200

  ## @param max_memory - integer - optional - default: 500000000
  ## @env DD_APM_MAX_MEMORY - integer - optional - default: 500000000
  ## This value is what the Agent aims to use in terms of memory. If surpassed, the API
  ## rate limits incoming requests to aim and stay below this value.
  ## Note: The Agent process is killed if it uses more than 150% of `max_memory`.
  ## Set the `max_memory` parameter to `0` to disable the memory limitation.
  #
  # max_memory: 500000000

  ## @param max_cpu_percent - integer - optional - default: 50
  ## @env DD_APM_MAX_CPU_PERCENT - integer - optional - default: 50
  ## The CPU percentage that the Agent aims to use. If surpassed, the API rate limits
  ## incoming requests to aim and stay below this value. Examples: 50 = half a core, 200 = two cores.
  ## Set `max_cpu_percent` to `0` to disable rate limiting based on CPU usage.
  #
  # max_cpu_percent: 50

  ## @param obfuscation - object - optional
  ## Defines obfuscation rules for sensitive data. Disabled by default.
  ## See https://docs.datadoghq.com/tracing/setup_overview/configure_data_security/#agent-trace-obfuscation
  #
  # obfuscation:
  #     credit_cards:
  ##        @param DD_APM_OBFUSCATION_CREDIT_CARDS_ENABLED - boolean - optional
  ##        Enables obfuscation rules for credit cards. Disabled by default.
  #         enabled: false
  ##        @param DD_APM_OBFUSCATION_CREDIT_CARDS_LUHN - boolean - optional
  ##        Enables a Luhn checksum check in order to eliminate false negatives. Disabled by default.
  #         luhn: false
  #
  #     elasticsearch:
  ##        @param DD_APM_OBFUSCATION_ELASTICSEARCH_ENABLED - boolean - optional
  ##        Enables obfuscation rules for spans of type "elasticsearch". Enabled by default.
  #         enabled: false
  ##        @param DD_APM_OBFUSCATION_ELASTICSEARCH_KEEP_VALUES - object - optional
  ##        List of keys that should not be obfuscated.
  #         keep_values:
  #             - client_id
  ##        @param DD_APM_OBFUSCATION_ELASTICSEARCH_OBFUSCATE_SQL_VALUES - boolean - optional
  ##        The set of keys for which their values will be passed through SQL obfuscation
  #         obfuscate_sql_values:
  #             - val1
  #
  #     http:
  ##        @param DD_APM_OBFUSCATION_HTTP_REMOVE_QUERY_STRING - boolean - optional
  ##        Enables obfuscation of query strings in URLs
  #         remove_query_string: false
  ##        @param DD_APM_OBFUSCATION_HTTP_REMOVE_PATHS_WITH_DIGITS - boolean - optional
  ##        If enabled, path segments in URLs containing digits are replaced by "?"
  #         remove_path_with_digits: false
  #
  #     memcached:
  ##        @param DD_APM_OBFUSCATION_MEMCACHED_ENABLED - boolean - optional
  ##        Enables obfuscation rules for spans of type "memcached". Enabled by default.
  #         enabled: false
  #
  #     mongodb:
  ##        @param DD_APM_OBFUSCATION_MONGODB_ENABLED - boolean - optional
  ##        Enables obfuscation rules for spans of type "mongodb". Enabled by default.
  #         enabled: false
  ##        @param DD_APM_OBFUSCATION_MONGODB_KEEP_VALUES - object - optional
  ##        List of keys that should not be obfuscated.
  #         keep_values:
  #             - document_id
  ##        @param DD_APM_OBFUSCATION_MONGODB_OBFUSCATE_SQL_VALUES - object - optional
  ##        The set of keys for which their values will be passed through SQL obfuscation
  #         obfuscate_sql_values:
  #             - val1
  #
  #     redis:
  ##        @param DD_APM_OBFUSCATION_REDIS_ENABLED - boolean - optional
  ##        Enables obfuscation rules for spans of type "redis". Enabled by default.
  #         enabled: false
  ##        @param DD_APM_OBFUSCATION_REDIS_REMOVE_ALL_ARGS - boolean - optional
  ##        When true, replaces all arguments of a redis command with a single "?". Disabled by default.
  #         remove_all_args: false
  #
  ##    @param DD_APM_OBFUSCATION_REMOVE_STACK_TRACES - boolean - optional
  ##    Enables removing stack traces to replace them with "?". Disabled by default.
  #     remove_stack_traces: false
  #
  #     sql_exec_plan:
  ##        @param DD_APM_SQL_EXEC_PLAN_ENABLED - boolean - optional
  ##        Enables obfuscation rules for JSON query execution plans. Disabled by default.
  #         enabled: false
  ##        @param DD_APM_SQL_EXEC_PLAN_KEEP_VALUES - object - optional
  ##        List of keys that should not be obfuscated.
  #         keep_values:
  #             - id1
  ##        @param DD_APM_SQL_EXEC_PLAN_OBFUSCATE_SQL_VALUES - boolean - optional
  ##        The set of keys for which their values will be passed through SQL obfuscation
  #         obfuscate_sql_values:
  #             - val1
  #
  #     sql_exec_plan_normalize:
  ##        @param DD_APM_SQL_EXEC_PLAN_NORMALIZE_ENABLED - boolean - optional
  ##        Enables obfuscation rules for JSON query execution plans, including cost and row estimates.
  ##        Produces a normalized execution plan. Disabled by default.
  #         enabled: false
  ##        @param DD_APM_SQL_EXEC_PLAN_NORMALIZE_KEEP_VALUES - object - optional
  ##        List of keys that should not be obfuscated.
  #         keep_values:
  #             - id1
  ##        @param DD_APM_SQL_EXEC_PLAN_NORMALIZE_OBFUSCATE_SQL_VALUES - boolean - optional
  ##        The set of keys for which their values will be passed through SQL obfuscation
  #         obfuscate_sql_values:
  #             - val1

  ## @param filter_tags - object - optional
  ## @env DD_APM_FILTER_TAG_REQUIRE - object - optional
  ## @env DD_APM_FILTER_TAG_REJECT - object - optional
  ## Defines rules by which to filter traces based on tags.
  ##  * require - list of key or key/value strings - traces must have those tags in order to be sent to Datadog
  ##  * reject - list of key or key/value strings - traces with these tags are dropped by the Agent
  ## Note: Rules take into account the intersection of tags defined.
  #
  # filter_tags:
  #     require: [<LIST_OF_KEY_VALUE_TAGS>]
  #     reject: [<LIST_OF_KEY_VALUE_TAGS>]

  ## @param replace_tags - list of objects - optional
  ## @env DD_APM_REPLACE_TAGS  - list of objects - optional
  ## Defines a set of rules to replace or remove certain resources, tags containing
  ## potentially sensitive information.
  ## Each rules has to contain:
  ##  * name - string - The tag name to replace, for resources use "resource.name".
  ##  * pattern - string - The pattern to match the desired content to replace
  ##  * repl - string - what to inline if the pattern is matched
  ##
  ## See https://docs.datadoghq.com/tracing/setup_overview/configure_data_security/#replace-rules-for-tag-filtering
  ##
  #
  # replace_tags:
  #   - name: "<TAG_NAME>"
  #     pattern: "<REGEX_PATTERN>"
  #     repl: "<PATTERN_TO_INLINE>"

  ## @param ignore_resources - list of strings - optional
  ## @env DD_APM_IGNORE_RESOURCES - comma separated list of strings - optional
  ## An exclusion list of regular expressions can be provided to disable certain traces based on their resource name
  ## all entries must be surrounded by double quotes and separated by commas.
  #
  # ignore_resources: ["(GET|POST) /healthcheck"]

  ## @param log_file - string - optional
  ## @env DD_APM_LOG_FILE - string - optional
  ## The full path to the file where APM-agent logs are written.
  #
  # log_file: <APM_LOG_FILE_PATH>

  ## @param log_throttling - boolean - default: true
  ## @env DD_APM_LOG_THROTTLING - boolean - default: true
  ## Limits the total number of warnings and errors to 10 for every 10 second interval.
  #
  # log_throttling: true

  ## @param connection_limit - integer - default: 2000
  ## @env DD_APM_CONNECTION_LIMIT - integer - default: 2000
  ## The APM connection limit for the Agent.
  ## See https://docs.datadoghq.com/tracing/troubleshooting/agent_rate_limits/#max-connection-limit
  #
  # connection_limit: 2000

  ## @param compute_stats_by_span_kind - bool - default: false
  ## @env DD_APM_COMPUTE_STATS_BY_SPAN_KIND - bool - default: false
  ## Enables an additional stats computation check on spans to see they have an eligible `span.kind` (server, consumer, client, producer).
  ## If enabled, a span with an eligible `span.kind` will have stats computed. If disabled, only top-level and measured spans will have stats computed.
  ## NOTE: For stats computed from OTel traces, only top-level spans are considered when this option is off.
  ## If you are sending OTel traces and want stats on non-top-level spans, this flag will need to be enabled.
  # compute_stats_by_span_kind: false

  ## @param peer_service_aggregation - bool - default: false
  ## @env DD_APM_PEER_SERVICE_AGGREGATION - bool - default: false
  ## Enables `peer.service` aggregation in the agent. If disabled, aggregated trace stats will not include `peer.service` as a dimension.
  ## For the best experience with `peer.service`, it is recommended to also enable `compute_stats_by_span_kind`.
  ## If enabling both causes the Agent to consume too many resources, try disabling `compute_stats_by_span_kind` first.
  ## If the overhead remains high, it will be due to a high cardinality of `peer.service` values from the traces. You may need to check your instrumentation.
  ## NOTE: If you are using an OTel tracer it's best to have both enabled because client/producer spans with a `peer.service` value
  ## may not be marked by the Agent as top-level spans.
  # peer_service_aggregation: false

  ## @param features - list of strings - optional
  ## @env DD_APM_FEATURES - comma separated list of strings - optional
  ## Configure additional beta APM features.
  ## The list of items available under apm_config.features is not guaranteed to persist across versions;
  ## a feature may eventually be promoted to its own configuration option on the agent, or dropped entirely.
  #
  # features: ["error_rare_sample_tracer_drop","table_names","component2name","sql_cache"]

  ## @param additional_endpoints - object - optional
  ## @env DD_APM_ADDITIONAL_ENDPOINTS - object - optional
  ## Enables sending data to multiple endpoints and/or with multiple API keys via dual shipping.
  ## See https://docs.datadoghq.com/agent/guide/dual-shipping
  #
  # additional_endpoints:
  #   "https://trace.agent.datadoghq.com":
  #   - apikey2
  #   - apikey3
  #   "https://trace.agent.datadoghq.eu":
  #   - apikey4

  ## @param debug - custom object - optional
  ## Specifies settings for the debug server of the trace agent.
  #
  # debug:

    ## @param port - integer - optional - default: 5012
    ## @env DD_APM_DEBUG_PORT - string - optional - default: 5012
    ## Port for the debug endpoints for the trace Agent. Set it to 0 to disable the server.
    #
    # port: 5012

######################################
## Process Collection Configuration ##
######################################

## @param process_config - custom object - optional
## Enter specific configurations for your Process data collection.
## Uncomment this parameter and the one below to enable them.
## See https://docs.datadoghq.com/graphing/infrastructure/process/
#
process_config:

  ## @param process_collection - custom object - optional
  ## Specifies settings for collecting processes.
  process_collection:
    ## @param enabled - boolean - optional - default: false
    ## Enables collection of information about running processes.
    enabled: true

  ## @param container_collection - custom object - optional
  ## Specifies settings for collecting containers.
  # container_collection:
    ## @param enabled - boolean - optional - default: true
    ## Enables collection of information about running containers.
    # enabled: true

  ## Deprecated - use `process_collection.enabled` and `container_collection.enabled` instead
  ## @param enabled - string - optional - default: "false"
  ## @env DD_PROCESS_CONFIG_ENABLED - string - optional - default: "false"
  ##  A string indicating the enabled state of the Process Agent:
  ##    * "false"    : The Agent collects only containers information.
  ##    * "true"     : The Agent collects containers and processes information.
  ##    * "disabled" : The Agent process collection is disabled.
  #
  # enabled: "true"

  ## @param expvar_port - string - optional - default: 6062
  ## @env DD_PROCESS_CONFIG_EXPVAR_PORT - string - optional - default: 6062
  ## Port for the debug endpoints for the process Agent.
  #
  # expvar_port: 6062

  ## @param cmd_port - string - optional - default: 6162
  ## Port for configuring runtime settings for the process Agent.
  #
  # cmd_port: 6162

  ## @param log_file - string - optional
  ## @env DD_PROCESS_CONFIG_LOG_FILE - string - optional
  ## The full path to the file where process Agent logs are written.
  #
  # log_file: <PROCESS_LOG_FILE_PATH>

  ## @param intervals - custom object - optional - default: 10s for normal checks and 2s for others.
  ## @env DD_PROCESS_CONFIG_INTERVALS_CONTAINER - integer - optional - default: 10
  ## @env DD_PROCESS_CONFIG_INTERVALS_CONTAINER_REALTIME - integer - optional - default: 2
  ## @env DD_PROCESS_CONFIG_INTERVALS_PROCESS - integer - optional - default: 10
  ## @env DD_PROCESS_CONFIG_INTERVALS_PROCESS_REALTIME - integer - optional - default: 2
  ## The interval, in seconds, at which the Agent runs each check. If you want consistent
  ## behavior between real-time, set the `container_realtime` and `process_realtime` intervals to 10.
  #
  # intervals:
  #   container: 10
  #   container_realtime: 2
  #   process: 10
  #   process_realtime: 2

  ## @param process_discovery - custom object - optional
  ## Specifies custom settings for the `process_discovery` object.
  # process_discovery:
      ## @param enabled - boolean - optional - default: true
      ## Toggles the `process_discovery` check. If enabled, this check gathers information about running integrations.
      # enabled: true

      ## @param interval - duration - optional - default: 4h - minimum: 10m
      ## An interval in hours that specifies how often the process discovery check should run.
      # interval: 4h


  ## @param blacklist_patterns - list of strings - optional
  ## @env DD_PROCESS_CONFIG_BLACKLIST_PATTERNS - space separated list of strings - optional
  ## A list of regex patterns that exclude processes if matched.
  #
  # blacklist_patterns:
  #   - <REGEX>

  ## @param queue_size - integer - optional - default: 256
  ## @env DD_PROCESS_CONFIG_QUEUE_SIZE - integer - optional - default: 256
  ## The number of check results to buffer in memory when a POST fails.
  #
  # queue_size: 256

  ## @param process_queue_bytes - integer - optional - default: 60000000
  ## @env DD_PROCESS_CONFIG_PROCESS_QUEUE_BYTES - integer - optional - default: 60000000
  ## The amount of data (in bytes) to buffer in memory when a POST fails.
  #
  # process_queue_bytes: 60000000

  ## @param rt_queue_size - integer - optional - default: 5
  ## @env DD_PROCESS_CONFIG_RT_QUEUE_SIZE - integer - optional - default: 5
  ## The number of realtime check results to buffer in memory when a POST fails.
  #
  # rt_queue_size: 5

  ## @param max_per_message - integer - optional - default: 100
  ## @env DD_PROCESS_CONFIG_MAX_PER_MESSAGE - integer - optional - default: 100
  ## The maximum number of processes or containers per message.
  #
  # max_per_message: 100

  ## @param dd_agent_bin - string - optional
  ## @env DD_PROCESS_CONFIG_DD_AGENT_BIN - string - optional
  ## Overrides the path to the Agent bin used for getting the hostname. Defaults are:
  ##   * Windows: <AGENT_DIRECTORY>\embedded\\agent.exe
  ##   * Unix: /opt/datadog-agent/bin/agent/agent
  #
  # dd_agent_bin: <AGENT_BIN_PATH>

  ## @param dd_agent_env - string - optional - default: ""
  ## @env DD_PROCESS_CONFIG_DD_AGENT_ENV - string - optional - default: ""
  ## Overrides of the environment we pass to fetch the hostname.
  #
  # dd_agent_env: ""

  ## @param scrub_args - boolean - optional - default: true
  ## @env DD_PROCESS_CONFIG_SCRUB_ARGS - boolean - optional - default: true
  ## Hide sensitive data on the Live Processes page.
  #
  # scrub_args: true

  ## @param custom_sensitive_words - list of strings - optional
  ## @env DD_PROCESS_CONFIG_CUSTOM_SENSITIVE_WORDS - space separated list of strings - optional
  ## Define your own list of sensitive data to be merged with the default one.
  ## Read more on Datadog documentation:
  ## https://docs.datadoghq.com/graphing/infrastructure/process/#process-arguments-scrubbing
  #
  # custom_sensitive_words:
  #   - 'personal_key'
  #   - '*token'
  #   - 'sql*'
  #   - '*pass*d*'

  ## @param disable_realtime_checks - boolean - optional - default: false
  ## @env DD_PROCESS_CONFIG_DISABLE_REALTIME - boolean - optional - default: false
  ## Disable realtime process and container checks
  #
  # disable_realtime_checks: false

#############################################
## Security Agent Compliance Configuration ##
#############################################

## @param compliance_config - custom object - optional
## Enter specific configuration for continuous compliance checks.
# compliance_config:

  ## @param enabled - boolean - optional - default: false
  ## @env DD_COMPLIANCE_CONFIG_ENABLED - boolean - optional - default: false
  ## Set to true to enable Cloud Security Posture Management (CSPM).
  #
  # enabled: false

  ## @param dir - string - optional - default: /etc/datadog-agent/compliance.d
  ## @env DD_COMPLIANCE_CONFIG_DIR - string - optional - default: /etc/datadog-agent/compliance.d
  ## Directory path for compliance checks configuration containing enabled benchmarks
  #
  # dir: /etc/datadog-agent/compliance.d

  ## @param check_interval - duration - optional - default: 20m
  ## @env DD_COMPLIANCE_CONFIG_CHECK_INTERVAL - duration - optional - default: 20m
  ## Check interval (see  https://golang.org/pkg/time/#ParseDuration for available options)
  # check_interval: 20m

  ## @param check_max_events_per_run - integer - optional - default: 100
  ## @env DD_COMPLIANCE_CONFIG_CHECK_MAX_EVENTS_PER_RUN - integer - optional - default: 100
  ##
  # check_max_events_per_run: 100


#############################
## DogStatsD Configuration ##
#############################

## @param use_dogstatsd - boolean - optional - default: true
## @env DD_USE_DOGSTATSD - boolean - optional - default: true
## Set this option to false to disable the Agent DogStatsD server.
#
# use_dogstatsd: true

## @param dogstatsd_port - integer - optional - default: 8125
## @env DD_DOGSTATSD_PORT - integer - optional - default: 8125
## Override the Agent DogStatsD port.
## Note: Make sure your client is sending to the same UDP port.
#
# dogstatsd_port: 8125

## @param bind_host - string - optional - default: localhost
## @env DD_BIND_HOST - string - optional - default: localhost
## The host to listen on for Dogstatsd and traces. This is ignored by APM when
## `apm_config.apm_non_local_traffic` is enabled and ignored by DogStatsD when `dogstatsd_non_local_traffic`
## is enabled. The trace-agent uses this host to send metrics to.
## The `localhost` default value is invalid in IPv6 environments where dogstatsd listens on "::1".
## To solve this problem, ensure Dogstatsd is listening on IPv4 by setting this value to "127.0.0.1".
#
# bind_host: localhost

## @param dogstatsd_socket - string - optional - default: ""
## @env DD_DOGSTATSD_SOCKET - string - optional - default: ""
## Listen for Dogstatsd metrics on a Unix Socket (*nix only). Set to a valid filesystem path to enable.
#
# dogstatsd_socket: ""

## @param dogstatsd_origin_detection - boolean - optional - default: false
## @env DD_DOGSTATSD_ORIGIN_DETECTION - boolean - optional - default: false
## When using Unix Socket, DogStatsD can tag metrics with container metadata.
## If running DogStatsD in a container, host PID mode (e.g. with --pid=host) is required.
#
# dogstatsd_origin_detection: false

## @param dogstatsd_origin_detection_client - boolean - optional - default: false
## @env DD_DOGSTATSD_ORIGIN_DETECTION_CLIENT - boolean - optional - default: false
## Whether the Agent should use a client-provided container ID to enrich the metrics, events and service checks with container tags.
## Note: This requires using a client compatible with DogStatsD protocol version 1.2.
#
# dogstatsd_origin_detection_client: false

## @param dogstatsd_buffer_size - integer - optional - default: 8192
## @env DD_DOGSTATSD_BUFFER_SIZE - integer - optional - default: 8192
## The buffer size use to receive statsd packets, in bytes.
#
# dogstatsd_buffer_size: 8192

## @param dogstatsd_non_local_traffic - boolean - optional - default: false
## @env DD_DOGSTATSD_NON_LOCAL_TRAFFIC - boolean - optional - default: false
## Set to true to make DogStatsD listen to non local UDP traffic.
#
# dogstatsd_non_local_traffic: false

## @param dogstatsd_stats_enable - boolean - optional - default: false
## @env DD_DOGSTATSD_STATS_ENABLE - boolean - optional - default: false
## Publish DogStatsD's internal stats as Go expvars.
#
# dogstatsd_stats_enable: false

## @param dogstatsd_logging_enabled - boolean - optional - default: true
## Set to true to write DogstatsD metrics received by the Agent to dogstats_stats log files.
## Requires `dogstatsd_stats_enable: true`.
#
# dogstatsd_logging_enabled: true

## @param dogstatsd_log_file_max_size - custom - optional - default: 10MB
## Maximum size of dogstatsd log file. Use either a size (for example, 10MB) or
## provide value in bytes (for example, 10485760.)
#
# dogstatsd_log_file_max_size: 10MB

## @param dogstatsd_queue_size - integer - optional - default: 1024
## @env DD_DOGSTATSD_QUEUE_SIZE - integer - optional - default: 1024
## Configure the internal queue size of the Dogstatsd server.
## Reducing the size of this queue will reduce the maximum memory usage of the
## Dogstatsd server but as a trade-off, it could increase the number of packet drops.
#
# dogstatsd_queue_size: 1024

## @param dogstatsd_stats_buffer - integer - optional - default: 10
## @env DD_DOGSTATSD_STATS_BUFFER - integer - optional - default: 10
## Set how many items should be in the DogStatsD's stats circular buffer.
#
# dogstatsd_stats_buffer: 10

## @param dogstatsd_stats_port - integer - optional - default: 5000
## @env DD_DOGSTATSD_STATS_PORT - integer - optional - default: 5000
## The port for the go_expvar server.
#
# dogstatsd_stats_port: 5000

## @param dogstatsd_so_rcvbuf - integer - optional - default: 0
## @env DD_DOGSTATSD_SO_RCVBUF - integer - optional - default: 0
## The number of bytes allocated to DogStatsD's socket receive buffer (POSIX system only).
## By default, the system sets this value. If you need to increase the size of this buffer
## but keep the OS default value the same, you can set DogStatsD's receive buffer size here.
## The maximum accepted value might change depending on the OS.
#
# dogstatsd_so_rcvbuf: 0

## @param dogstatsd_metrics_stats_enable - boolean - optional - default: false
## @env DD_DOGSTATSD_METRICS_STATS_ENABLE - boolean - optional - default: false
## Set this parameter to true to have DogStatsD collects basic statistics (count/last seen)
## about the metrics it processed. Use the Agent command "dogstatsd-stats" to visualize
## those statistics.
#
# dogstatsd_metrics_stats_enable: false

## @param dogstatsd_tags - list of key:value elements - optional
## @env DD_DOGSTATSD_TAGS - list of key:value elements - optional
## Additional tags to append to all metrics, events and service checks received by
## this DogStatsD server.
#
# dogstatsd_tags:
#   - <TAG_KEY>:<TAG_VALUE>
#
## @param dogstatsd_mapper_profiles - list of custom object - optional
## @env DD_DOGSTATSD_MAPPER_PROFILES - list of custom object - optional
## The profiles will be used to convert parts of metrics names into tags.
## If a profile prefix is matched, other profiles won't be tried even if that profile matching rules doesn't match.
## The profiles and matching rules are processed in the order defined in this configuration.
##
## For each profile, following fields are available:
##    name (required): profile name
##    prefix (required): mapping only applies to metrics with the prefix. If set to `*`, it will match everything.
##    mappings: mapping rules, see below.
## For each mapping, following fields are available:
##    match (required): pattern for matching the incoming metric name e.g. `test.job.duration.*`
##    match_type (optional): pattern type can be `wildcard` (default) or `regex` e.g. `test\.job\.(\w+)\.(.*)`
##    name (required): the metric name the metric should be mapped to e.g. `test.job.duration`
##    tags (optional): list of key:value pair of tag key and tag value
##      The value can use $1, $2, etc, that will be replaced by the corresponding element capture by `match` pattern
##      This alternative syntax can also be used: ${1}, ${2}, etc
#
# dogstatsd_mapper_profiles:
#   - name: <PROFILE_NAME>                        # e.g. "airflow", "consul", "some_database"
#     prefix: <PROFILE_PREFIX>                    # e.g. "airflow.", "consul.", "some_database."
#     mappings:
#       - match: <METRIC_TO_MATCH>                # e.g. `test.job.duration.*` to match `test.job.duration.my_job_name`
#         match_type: <MATCH_TYPE>                # e.g. `wildcard` or `regex`
#         name: <MAPPED_METRIC_NAME>              # e.g. `test.job.duration`
#         tags:
#           <TAG_KEY>: <TAG_VALUE_TO_EXPAND>      # e.g. `job_name: "$1"`, $1 is replaced by value capture by *
#       - match: 'test.worker.*.*.start_time'     # to match `test.worker.<worker_type>.<worker_name>.start_time`
#         name: 'test.worker.start_time'
#         tags:
#           worker_type: '$1'
#           worker_name: '$2'
#       - match: 'test\.task\.duration\.(\w+)\.(.*)'     # no need to escape in yaml context using single quote
#         match_type: regex
#         name: 'test.task'
#         tags:
#           task_type: '$1'
#           task_name: '$2'

## @param dogstatsd_mapper_cache_size - integer - optional - default: 1000
## @env DD_DOGSTATSD_MAPPER_CACHE_SIZE - integer - optional - default: 1000
## Size of the cache (max number of mapping results) used by Dogstatsd mapping feature.
#
# dogstatsd_mapper_cache_size: 1000

## @param dogstatsd_entity_id_precedence - boolean - optional - default: false
## @env DD_DOGSTATSD_ENTITY_ID_PRECEDENCE - boolean - optional - default: false
## Disable enriching Dogstatsd metrics with tags from "origin detection" when Entity-ID is set.
#
# dogstatsd_entity_id_precedence: false


## @param dogstatsd_no_aggregation_pipeline - boolean - optional - default: true
## @env DD_DOGSTATSD_NO_AGGREGATION_PIPELINE - boolean - optional - default: true
## Enable the no-aggregation pipeline in DogStatsD: a pipeline receiving metrics
## with timestamp and forwarding them to the intake without extra processing except
## for tagging.
#
# dogstatsd_no_aggregation_pipeline: true

## @param dogstatsd_no_aggregation_pipeline_batch_size - integer - optional - default: 256
## @env DD_DOGSTATSD_NO_AGGREGATION_PIPELINE_BATCH_SIZE - integer - optional - default: 256
## How many metrics maximum in payloads sent by the no-aggregation pipeline to the intake.
#
# dogstatsd_no_aggregation_pipeline_batch_size: 256

## @param statsd_forward_host - string - optional - default: ""
## @env DD_STATSD_FORWARD_HOST - string - optional - default: ""
## Forward every packet received by the DogStatsD server to another statsd server.
## WARNING: Make sure that forwarded packets are regular statsd packets and not "DogStatsD" packets,
## as your other statsd server might not be able to handle them.
#
# statsd_forward_host: ""

## @param statsd_forward_port - integer - optional - default: 0
## @env DD_STATSD_FORWARD_PORT - integer - optional - default: 0
## Port or the "statsd_forward_host" to forward StatsD packet to.
#
# statsd_forward_port: 0

## @param statsd_metric_namespace - string - optional - default: ""
## @env DD_STATSD_METRIC_NAMESPACE - string - optional - default: ""
## Set a namespace for all StatsD metrics coming from this host.
## Each metric received is prefixed with the namespace before it's sent to Datadog.
#
# statsd_metric_namespace: ""



## @param metadata_providers - list of custom object - optional
## @env DD_METADATA_PROVIDERS - list of custom object - optional
## Metadata providers, add or remove from the list to enable or disable collection.
## Intervals are expressed in seconds. You can also set a provider's interval to 0
## to disable it.
#
# metadata_providers:
#   - name: k8s
#     interval: 60



#######################
## JMX Configuration ##
#######################

## @param jmx_custom_jars - list of strings - optional
## @env DD_JMX_CUSTOM_JARS - space separated list of strings - optional
## If you only run Autodiscovery tests, jmxfetch might fail to pick up custom_jar_paths
## set in the check templates. If that is the case, force custom jars here.
#
# jmx_custom_jars:
#   - /jmx-jars/jboss-cli-client.jar

## @param jmx_use_cgroup_memory_limit - boolean - optional - default: false
## @env DD_JMX_USE_CGROUP_MEMORY_LIMIT - boolean - optional - default: false
## When running in a memory cgroup, openjdk 8u131 and higher can automatically adjust
## its heap memory usage in accordance to the cgroup/container's memory limit.
## The Agent set a Xmx of 200MB if none is configured.
## Note: OpenJDK version &lt; 8u131 or >= 10 as well as other JVMs might fail
## to start if this option is set.
#
# jmx_use_cgroup_memory_limit: false

## @param jmx_use_container_support - boolean - optional - default: false
## @env DD_JMX_USE_CONTAINER_SUPPORT - boolean - optional - default: false
## When running in a container, openjdk 10 and higher can automatically detect
## container specific configuration instead of querying the operating system
## to adjust resources allotted to the JVM.
## Note: openjdk versions prior to 10 and other JVMs might fail to start if
## this option is set.
#
# jmx_use_container_support: false

## @param jmx_max_ram_percentage - float - optional - default: 25.0
## @env DD_JMX_MAX_RAM_PERCENTAGE - float - optional - default: 25.0
## When running in a container with jmx_use_container_support enabled, the JVM can
## automatically declare the maximum heap size based off of a percentage of
## total container allocated memory. This option is overwritten if
## you use -Xmx to manually define the size of the heap. This option applies
## to containers with a total memory limit greater than ~250mb. If
## jmx_use_container_support is disabled this option has no effect.
#
# jmx_max_ram_percentage: 25.0

## @param jmx_log_file - string - optional
## @env DD_JMX_LOG_FILE - string - optional
## Path of the log file where JMXFetch logs are written.
#
# jmx_log_file: <JMXFETCH_LOG_FILE_PATH>

## @param jmx_max_restarts - integer - optional - default: 3
## @env DD_JMX_MAX_RESTARTS - integer - optional - default: 3
## Number of JMX restarts allowed in the restart-interval before giving up.
#
# jmx_max_restarts: 3

## @param jmx_restart_interval - integer - optional - default: 5
## @env DD_JMX_RESTART_INTERVAL - integer - optional - default: 5
## Duration of the restart interval in seconds.
#
# jmx_restart_interval: 5

## @param jmx_check_period - integer - optional - default: 15000
## @env DD_JMX_CHECK_PERIOD - integer - optional - default: 15000
## Duration of the period for check collections in milliseconds.
#
# jmx_check_period: 15000

## @param jmx_thread_pool_size - integer - optional - default: 3
## @env DD_JMX_THREAD_POOL_SIZE - integer - optional - default: 3
## JMXFetch collects multiples instances concurrently. Defines the maximum level of concurrency:
##   * Higher concurrency increases CPU utilization during metric collection.
##   * Lower concurrency results in lower CPU usage but may increase the total collection time.
## A value of 1 processes instances serially.
#
# jmx_thread_pool_size: 3

## @param jmx_collection_timeout - integer - optional - default: 60
## @env DD_JMX_COLLECTION_TIMEOUT - integer - optional - default: 60
## Defines the maximum waiting period in seconds before timing up on metric collection.
#
# jmx_collection_timeout: 60

## @param jmx_reconnection_thread_pool_size - integer - optional - default: 3
## @env DD_JMX_RECONNECTION_THREAD_POOL_SIZE - integer - optional - default: 3
## JMXFetch reconnects to multiples instances concurrently. Defines the maximum level of concurrency:
##   * Higher concurrency increases CPU utilization during reconnection.
##   * Lower concurrency results in lower CPU usage but may increase the total reconnection time
## A value of 1 processes instance reconnections serially.
#
# jmx_reconnection_thread_pool_size: 3

## @param jmx_reconnection_timeout - integer - optional - default: 60
## @env DD_JMX_RECONNECTION_TIMEOUT - integer - optional - default: 60
## Determines the maximum waiting period in seconds before timing up on instance reconnection.
#
# jmx_reconnection_timeout: 60

## @param jmx_statsd_telemetry_enabled - boolean - optional - default: false
## @env DD_JMX_STATSD_TELEMETRY_ENABLED - boolean - optional - default: false
## Specifies whether the JMXFetch statsd client telemetry is enabled.
#
# jmx_statsd_telemetry_enabled: false



###########################
## Logging Configuration ##
###########################

## @param log_level - string - optional - default: info
## @env DD_LOG_LEVEL - string - optional - default: info
## Minimum log level of the Datadog Agent.
## Valid log levels are: trace, debug, info, warn, error, critical, and off.
## Note: When using the 'off' log level, quotes are mandatory.
#
# log_level: 'info'

## @param log_file - string - optional
## @env DD_LOG_FILE - string - optional
## Path of the log file for the Datadog Agent.
## See https://docs.datadoghq.com/agent/guide/agent-log-files/
#
# log_file: <AGENT_LOG_FILE_PATH>

## @param log_format_json - boolean - optional - default: false
## @env DD_LOG_FORMAT_JSON - boolean - optional - default: false
## Set to 'true' to output Agent logs in JSON format.
#
# log_format_json: false

## @param log_to_console - boolean - optional - default: true
## @env DD_LOG_TO_CONSOLE - boolean - optional - default: true
## Set to 'false' to disable Agent logging to stdout.
#
# log_to_console: true

## @param disable_file_logging - boolean - optional - default: false
## @env DD_DISABLE_FILE_LOGGING - boolean - optional - default: false
## Set to 'true' to disable logging to the log file.
#
# disable_file_logging: false

## @param log_file_max_size - custom - optional - default: 10MB
## @env DD_LOG_FILE_MAX_SIZE - custom - optional - default: 10MB
## Maximum size of one log file. Use either a size (e.g. 10MB) or
## provide value in bytes: 10485760
#
# log_file_max_size: 10MB

## @param log_file_max_rolls - integer - optional - default: 1
## @env DD_LOG_FILE_MAX_ROLLS - integer - optional - default: 1
## Maximum amount of "old" log files to keep.
## Set to 0 to not limit the number of files to create.
#
# log_file_max_rolls: 1

## @param log_to_syslog - boolean - optional - default: false
## @env DD_LOG_TO_SYSLOG - boolean - optional - default: false
## Set to 'true' to enable logging to syslog.
## Note: Even if this option is set to 'false', the service launcher of your environment
## may redirect the Agent process' stdout/stderr to syslog. In that case, if you wish
## to disable logging to syslog entirely, set 'log_to_console' to 'false' as well.
#
# log_to_syslog: false

## @param syslog_uri - string - optional
## @env DD_SYSLOG_URI - string - optional
## Define a custom remote syslog uri if needed. If 'syslog_uri' is left undefined/empty,
## a local domain socket connection is attempted.
#
# syslog_uri: <SYSLOG_URI>

## @param syslog_rfc - boolean - optional - default: false
## @env DD_SYSLOG_RFC - boolean - optional - default: false
## Set to 'true' to output in an RFC 5424-compliant format for Agent logs.
#
# syslog_rfc: false

## @param syslog_pem - string - optional
## @env DD_SYSLOG_PEM - string - optional
## If TLS enabled, you must specify a path to a PEM certificate here.
#
# syslog_pem: <PEM_CERTIFICATE_PATH>

## @param syslog_key - string - optional
## @env DD_SYSLOG_KEY - string - optional
## If TLS enabled, you must specify a path to a private key here.
#
# syslog_key: <PEM_KEY_PATH>

## @param syslog_tls_verify - boolean - optional - default: true
## @env DD_SYSLOG_TLS_VERIFY - boolean - optional - default: true
## If TLS enabled, you may enforce TLS verification here.
#
# syslog_tls_verify: true

## @param log_format_rfc3339 - boolean - optional - default false
## @env DD_LOG_FORMAT_RFC3339 - boolean - optional - default false
## If enabled the Agent will log using the RFC3339 format for the log time.
#
# log_format_rfc3339: false

## @param log_all_goroutines_when_unhealthy - boolean - optional - default false
## @env DD_LOG_ALL_GOROUTINES_WHEN_UNHEALTHY - boolean - optional - default false
## If enabled, when the health probe of an internal component fails, the stack traces
## of all the goroutines are logged.
#
# log_all_goroutines_when_unhealthy: false



##############################
## Autoconfig Configuration ##
##############################

## @param autoconf_template_dir - string - optional - default: /datadog/check_configs
## @env DD_AUTOCONF_TEMPLATE_DIR - string - optional - default: /datadog/check_configs
## Directory containing configuration templates for Autoconfig.
#
# autoconf_template_dir: /datadog/check_configs

## @param autoconf_config_files_poll - boolean - optional - default: false
## @env DD_AUTOCONF_CONFIG_FILES_POLL - boolean - optional - default: false
## Should the we check for new/updated integration configuration files on disk.
## WARNING: Only files containing checks configuration are supported (logs configuration are not supported).
#
# autoconf_config_files_poll: false

## @param autoconf_config_files_poll_interval - integer - optional - default: 60
## @env DD_AUTOCONF_CONFIG_FILES_POLL_INTERVAL - integer - optional - default: 60
## How frequently should the Agent check for new/updated integration configuration files (in seconds).
## This value must be >= 1 (i.e. 1 second).
## WARNING: Only files containing checks configuration are supported (logs configuration are not supported).
#
# autoconf_config_files_poll_interval: 60

## @param config_providers - List of custom object - optional
## @env DD_CONFIG_PROVIDERS - List of custom object - optional
## The providers the Agent should call to collect checks configurations. Available providers are:
##   * kubelet - The kubelet provider handles templates embedded in pod annotations.
##   * docker -  The Docker provider handles templates embedded in container labels.
##   * clusterchecks - The clustercheck provider retrieves cluster-level check configurations from the cluster-agent.
##   * kube_services - The kube_services provider watches Kubernetes services for cluster-checks
##
## See https://docs.datadoghq.com/guides/autodiscovery/ to learn more
#
# config_providers:
#  - name: kubelet
#    polling: true
#  - name: docker
#    polling: true
#  - name: clusterchecks
#    grace_time_seconds: 60
#  - name: etcd
#    polling: true
#    template_dir: /datadog/check_configs
#    template_url: http://127.0.0.1
#    username:
#    password:
#  - name: consul
#    polling: true
#    template_dir: datadog/check_configs
#    template_url: http://127.0.0.1
#    ca_file:
#    ca_path:
#    cert_file:
#    key_file:
#    username:
#    password:
#    token:
#  - name: zookeeper
#    polling: true
#    template_dir: /datadog/check_configs
#    template_url: 127.0.0.1
#    username:
#    password:

## @param extra_config_providers - list of strings - optional
## @env DD_EXTRA_CONFIG_PROVIDERS - space separated list of strings - optional
## Add additional config providers by name using their default settings, and pooling enabled.
## This list is available as an environment variable binding.
#
# extra_config_providers:
#   - clusterchecks

## @param autoconfig_exclude_features - list of comma separated strings - optional
## @env DD_AUTOCONFIG_EXCLUDE_FEATURES - list of space separated strings - optional
## Exclude features automatically detected and enabled by environment autodiscovery.
## Supported syntax is a list of `(<attribute>:)<regexp>`. Currently only the `name` attribute is supported.
## When no attribute is present, it defaults to `name:` attribute.
#
# autoconfig_exclude_features:
#  - cloudfoundry
#  - containerd
#  - cri
#  - docker
#  - ecsfargate
#  - eksfargate
#  - kubernetes
#  - orchestratorexplorer

## @param autoconfig_include_features - list of comma separated strings - optional
## @env DD_AUTOCONFIG_INCLUDE_FEATURES - list of space separated strings - optional
## Force activation of features (as if they were discovered by environment autodiscovery).
#
# autoconfig_include_features:
#  - cloudfoundry
#  - containerd
#  - cri
#  - docker
#  - ecsfargate
#  - eksfargate
#  - kubernetes
#  - orchestratorexplorer



###########################################
## Container Autodiscovery Configuration ##
###########################################

## @param container_cgroup_root - string - optional - default: /host/sys/fs/cgroup/
## @env DD_CONTAINER_CGROUP_ROOT - string - optional - default: /host/sys/fs/cgroup/
## Change the root directory to look at to get cgroup statistics.
## Default if environment variable "DOCKER_DD_AGENT" is set to "/host/sys/fs/cgroup"
## and "/sys/fs/cgroup" if not.
#
# container_cgroup_root: /host/sys/fs/cgroup/

## @param container_proc_root - string - optional - default: /host/proc
## @env DD_CONTAINER_PROC_ROOT - string - optional - default: /host/proc
## Change the root directory to look at to get proc statistics.
## Default if environment variable "DOCKER_DD_AGENT" is set "/host/proc" and "/proc" if not.
#
# container_proc_root: /host/proc

## @param listeners - list of key:value elements - optional
## @env DD_LISTENERS - list of key:value elements - optional
## Choose "auto" if you want to let the Agent find any relevant listener on your host
## At the moment, the only auto listener supported is Docker
## If you have already set Docker anywhere in the listeners, the auto listener is ignored
#
# listeners:
#   - name: auto
#   - name: docker

## @param extra_listeners - list of strings - optional
## @env DD_EXTRA_LISTENERS - space separated list of strings - optional
## You can also add additional listeners by name using their default settings.
## This list is available as an environment variable binding.
#
# extra_listeners:
#   - kubelet

## @param ac_exclude - list of comma separated strings - optional
## @env DD_AC_EXCLUDE - list of space separated strings - optional
## Exclude containers from metrics and AD based on their name or image.
## If a container matches an exclude rule, it won't be included unless it first matches an include rule.
## An excluded container won't get any individual container metric reported for it.
## See: https://docs.datadoghq.com/agent/guide/autodiscovery-management/
#
# ac_exclude: []

## @param ac_include - list of comma separated strings - optional
## @env DD_AC_INCLUDE - list of space separated strings - optional
## Include containers from metrics and AD based on their name or image:
## See: https://docs.datadoghq.com/agent/guide/autodiscovery-management/
#
# ac_include: []

## @param exclude_pause_container - boolean - optional - default: true
## @env DD_EXCLUDE_PAUSE_CONTAINER - boolean - optional - default: true
## Exclude default pause containers from orchestrators.
## By default the Agent doesn't monitor kubernetes/openshift pause container.
## They are still counted in the container count (just like excluded containers).
#
# exclude_pause_container: true

## @param docker_query_timeout - integer - optional - default: 5
## @env DD_DOCKER_QUERY_TIMEOUT - integer - optional - default: 5
## Set the default timeout value when connecting to the Docker daemon.
#
# docker_query_timeout: 5

## @param ad_config_poll_interval - integer - optional - default: 10
## @env DD_AD_CONFIG_POLL_INTERVAL - integer - optional - default: 10
## The default interval in second to check for new autodiscovery configurations
## on all registered configuration providers.
#
# ad_config_poll_interval: 10

## @param cloud_foundry_garden - custom object - optional
## Settings for Cloudfoundry application container autodiscovery.
#
# cloud_foundry_garden:

  ## @param listen_network - string - optional - default: unix
  ## @env DD_CLOUD_FOUNDRY_GARDEN_LISTEN_NETWORK - string - optional - default: unix
  ## The network on which the garden API is listening. Possible values are `unix` or `tcp`
  #
  # listen_network: unix

  ## @param listen_address - string - optional - default: /var/vcap/data/garden/garden.sock
  ## @env DD_CLOUD_FOUNDRY_GARDEN_LISTEN_ADDRESS - string - optional - default: /var/vcap/data/garden/garden.sock
  ## The address on which the garden API is listening.
  #
  # listen_address: /var/vcap/data/garden/garden.sock

## @param podman_db_path - string - optional - default: /var/lib/containers/storage/libpod/bolt_state.db
## Settings for Podman DB that Datadog Agent collects container metrics.
#
# podman_db_path: /var/lib/containers/storage/libpod/bolt_state.db



#########################
## Container detection ##
#########################

## @param container_cgroup_prefix - string - optional - default: /docker/
## @env DD_CONTAINER_CGROUP_PREFIX - string - optional - default: /docker/
## On hosts with mixed workloads, non-containernized processes can
## mistakenly be detected as containerized. Use this parameter to
## tune the detection logic to your system and avoid false-positives.
#
# container_cgroup_prefix: "/docker/"

###########################
## Docker tag extraction ##
###########################

## @param docker_labels_as_tags - map - optional
## @env DD_DOCKER_LABELS_AS_TAGS - json - optional
## The Agent can extract container label values and set them as metric tags values associated to a <TAG_KEY>.
## If you prefix your tag name with `+`, it will only be added to high cardinality metrics (Docker check).
#
# docker_labels_as_tags:
#   <LABEL_NAME>: <TAG_KEY>
#   <HIGH_CARDINALITY_LABEL_NAME>: +<TAG_KEY>
#
# DD_DOCKER_LABELS_AS_TAGS='{"LABEL_NAME":"tag_key"}'

## @param docker_env_as_tags - map - optional
## @env DD_DOCKER_ENV_AS_TAGS - json - optional
## The Agent can extract environment variables values and set them as metric tags values associated to a <TAG_KEY>.
## If you prefix your tag name with `+`, it will only be added to high cardinality metrics (Docker check).
#
# docker_env_as_tags:
#   <ENVVAR_NAME>: <TAG_KEY>
#
# DD_DOCKER_ENV_AS_TAGS='{"ENVVAR_NAME": "tag_key"}'



###############################
## Kubernetes tag extraction ##
###############################

## @param kubernetes_pod_labels_as_tags - map - optional
## @env DD_KUBERNETES_POD_LABELS_AS_TAGS - json - optional
## The Agent can extract pod labels values and set them as metric tags values associated to a <TAG_KEY>.
## If you prefix your tag name with +, it will only be added to high cardinality metrics.
#
# kubernetes_pod_labels_as_tags:
#   <POD_LABEL>: <TAG_KEY>
#   <HIGH_CARDINALITY_LABEL_NAME>: +<TAG_KEY>
#
# DD_KUBERNETES_POD_LABELS_AS_TAGS='{"LABEL_NAME":"tag_key"}'

## @param kubernetes_pod_annotations_as_tags - map - optional
## @env DD_KUBERNETES_POD_ANNOTATIONS_AS_TAGS - json - optional
## The Agent can extract annotations values and set them as metric tags values associated to a <TAG_KEY>.
## If you prefix your tag name with +, it will only be added to high cardinality metrics.
#
# kubernetes_pod_annotations_as_tags:
#   <ANNOTATION>: <TAG_KEY>
#   <HIGH_CARDINALITY_ANNOTATION>: +<TAG_KEY>
#
# DD_KUBERNETES_POD_ANNOTATIONS_AS_TAGS='{"ANNOTATION_NAME":"tag_key"}'

## @param kubernetes_namespace_labels_as_tags - map - optional
## @env DD_KUBERNETES_NAMESPACE_LABELS_AS_TAGS - json - optional
## The Agent can extract namespace label values and set them as metric tags values associated to a <TAG_KEY>.
## If you prefix your tag name with +, it will only be added to high cardinality metrics.
#
# kubernetes_namespace_labels_as_tags:
#   <NAMESPACE_LABEL>: <TAG_KEY>
#   <HIGH_CARDINALITY_NAMESPACE_LABEL_NAME>: +<TAG_KEY>
#
# DD_KUBERNETES_NAMESPACE_LABELS_AS_TAGS='{"<NAMESPACE_LABEL>": "<TAG_KEY>"}'

## @param container_env_as_tags - map - optional
## @env DD_CONTAINER_ENV_AS_TAGS - map - optional
## The Agent can extract environment variable values and set them as metric tags values associated to a <TAG_KEY>.
## Requires the container runtime socket to be reachable. (Supported container runtimes: Containerd, Docker)
#
# container_env_as_tags:
#   <ENV>: <TAG_KEY>

## @param container_labels_as_tags - map - optional
## @env DD_CONTAINER_LABELS_AS_TAGS - map - optional
## The Agent can extract container label values and set them as metric tags values associated to a <TAG_KEY>.
## If you prefix your tag name with `+`, it will only be added to high cardinality metrics. (Supported container
## runtimes: Containerd, Docker).
#
# container_labels_as_tags:
#   <LABEL_NAME>: <TAG_KEY>
#   <HIGH_CARDINALITY_LABEL_NAME>: +<TAG_KEY>



###################################
## ECS integration Configuration ##
###################################

## @param ecs_agent_container_name - string - optional - default: ecs-agent
## @env DD_ECS_AGENT_CONTAINER_NAME - string - optional - default: ecs-agent
## The ECS Agent container should be autodetected when running with the
## default (ecs-agent) name. If not, change the container name here:
#
# ecs_agent_container_name: ecs-agent

## @param ecs_agent_url - string - optional - default: http://localhost:51678
## @env DD_ECS_AGENT_URL - string - optional - default: http://localhost:51678
## The ECS Agent container should be autodetected when running with the
## default (ecs-agent) name. If not, change the container name the
## Agent should look for with ecs_agent_container_name, or force a fixed url here:
#
# ecs_agent_url: http://localhost:51678

## @param ecs_collect_resource_tags_ec2 - boolean - optional - default: false
## @env DD_ECS_COLLECT_RESOURCE_TAGS_EC2 - boolean - optional - default: false
## The Agent can collect resource tags from the metadata API exposed by the
## ECS Agent for tasks scheduled with the EC2 launch type.
#
# ecs_collect_resource_tags_ec2: false

## @param ecs_resource_tags_replace_colon - boolean - optional - default: false
## @env DD_ECS_RESOURCE_TAGS_REPLACE_COLON - boolean - optional - default: false
## The Agent replaces colon `:` characters in the ECS resource tag keys by underscores `_`.
#
# ecs_resource_tags_replace_colon: false

## @param ecs_metadata_timeout - integer - optional - default: 500
## @env DD_ECS_METADATA_TIMEOUT - integer - optional - default: 500
## Timeout in milliseconds on calls to the AWS ECS metadata endpoints.
#
# ecs_metadata_timeout: 500



###################################
## CRI integration Configuration ##
###################################

## @param cri_socket_path - string - optional - default: ""
## @env DD_CRI_SOCKET_PATH - string - optional - default: ""
## To activate the CRI check, indicate the path of the CRI socket you're using
## and mount it in the container if needed.
## If left empty, the CRI check is disabled.
## see: https://docs.datadoghq.com/integrations/cri/
#
# cri_socket_path: ""

## @param cri_connection_timeout - integer - optional - default: 5
## @env DD_CRI_CONNECTION_TIMEOUT - integer - optional - default: 5
## Configure the initial connection timeout in seconds.
#
# cri_connection_timeout: 5

## @param cri_query_timeout - integer - optional - default: 5
## @env DD_CRI_QUERY_TIMEOUT - integer - optional - default: 5
## Configure the timeout in seconds for querying the CRI.
#
# cri_query_timeout: 5



##########################################
## Containerd integration Configuration ##
##########################################

## @param cri_socket_path - string - optional - default: /var/run/containerd/containerd.sock
## @env DD_CRI_SOCKET_PATH - string - optional - default: /var/run/containerd/containerd.sock
## To activate the Containerd check, indicate the path of the Containerd socket you're using
## and mount it in the container if needed.
## see: https://docs.datadoghq.com/integrations/containerd/
#
# cri_socket_path: /var/run/containerd/containerd.sock

## @param cri_query_timeout - integer - optional - default: 5
## @env DD_CRI_QUERY_TIMEOUT - integer - optional - default: 5
## Configure the timeout in seconds for querying the Containerd API.
#
# cri_query_timeout: 5

## Deprecated - use `containerd_namespaces` instead
## @param containerd_namespace - list of strings - optional - default: []
## @env DD_CONTAINERD_NAMESPACE - space separated list of strings - optional - default: []
## Activating the Containerd check also activates the CRI check, as it contains an additional subset of useful metrics.
## Defaults to [] which configures the agent to report metrics and events from all the containerd namespaces.
## To watch specific namespaces, list them here.
## https://github.com/containerd/cri/blob/release/1.2/pkg/constants/constants.go#L22-L23
#
# containerd_namespace:
#   - k8s.io

## @param containerd_namespaces - list of strings - optional - default: []
## @env DD_CONTAINERD_NAMESPACES - space separated list of strings - optional - default: []
## Activating the Containerd check also activates the CRI check, as it contains an additional subset of useful metrics.
## Defaults to [] which configures the agent to report metrics and events from all the containerd namespaces.
## containerd_namespaces acts as an alias for containerd_namespace. When both containerd_namespaces and containerd_namespace
## are configured, the Agent merges the two lists.
#
# containerd_namespaces:
#   - k8s.io
#
## @param containerd_exclude_namespaces - list of strings - optional - default: ["moby"]
## @env DD_CONTAINERD_EXCLUDE_NAMESPACES - space separated list of strings - optional - default: ["moby"]
## When containerd_namespaces is set to [], containerd_exclude_namespaces
## allows the exclusion of containers from specific namespaces. By default it
## excludes "moby", to prevent Docker containers from being detected as
## containerd containers.
#
# containerd_exclude_namespaces:
#   - moby



###################################################
## Kubernetes kubelet connectivity Configuration ##
###################################################

## @param kubernetes_kubelet_host - string - optional
## @env DD_KUBERNETES_KUBELET_HOST - string - optional
## The kubelet host should be autodetected when running inside a pod.
## If you run into connectivity issues, set the host here according to your cluster setup.
#
# kubernetes_kubelet_host: <KUBLET_HOST>

## @param kubernetes_http_kubelet_port - integer - optional - default: 10255
## @env DD_KUBERNETES_HTTP_KUBELET_PORT - integer - optional - default: 10255
## The kubelet http port should be autodetected when running inside a pod.
## If you run into connectivity issues, set the http port here according to your cluster setup.
#
# kubernetes_http_kubelet_port: 10255

## @param kubernetes_https_kubelet_port - integer - optional - default: 10250
## @env DD_KUBERNETES_HTTPS_KUBELET_PORT - integer - optional - default: 10250
## The kubelet https port should be autodetected when running inside a pod.
## If you run into connectivity issues, set the https port here according to your cluster setup.
#
# kubernetes_https_kubelet_port: 10250

## @param kubelet_tls_verify - boolean - optional - default: true
## @env DD_KUBELET_TLS_VERIFY - boolean - optional - default: true
## Set to false if you don't want the Agent to verify the kubelet's certificate when using HTTPS.
#
# kubelet_tls_verify: true

## @param kubelet_client_ca - string - optional - default: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
## @env DD_KUBELET_CLIENT_CA - string - optional - default: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt
## Kublet client CA file path.
#
# kubelet_client_ca: /var/run/secrets/kubernetes.io/serviceaccount/ca.crt

## @param kubelet_auth_token_path - string - optional
## @env DD_KUBELET_AUTH_TOKEN_PATH - string - optional
## If authentication is needed, the Agent uses the pod's service account's
## credentials. If you want to use a different account, or are running the Agent
## on the host, set a custom token file path here.
#
# kubelet_auth_token_path: <TOKEN_FILE_PATH>

## @param kubelet_client_crt - string - optional
## @env DD_KUBELET_CLIENT_CRT - string - optional
## Set a custom Client CRT file path.
#
# kubelet_client_crt: <CRT_FILE_PATH>

## @param kubelet_client_key - string - optional
## @env DD_KUBELET_CLIENT_KEY - string - optional
## Set a custom Client key file path.
#
# kubelet_client_key: <CLIENT_KEY_FILE_PATH>

## @param kubelet_wait_on_missing_container - integer - optional - default: 0
## @env DD_KUBELET_WAIT_ON_MISSING_CONTAINER - integer - optional - default: 0
## On some kubelet versions, containers can take up to a second to
## register in the podlist. This option allows to wait for up to a given
## number of seconds (in 250ms chunks) when a container does not exist in the podlist.
#
# kubelet_wait_on_missing_container: 0

## @param kubelet_cache_pods_duration - integer - optional - default: 5
## @env DD_KUBELET_CACHE_PODS_DURATION - integer - optional - default: 5
## Polling frequency in seconds of the Agent to the kubelet "/pods" endpoint.
#
# kubelet_cache_pods_duration: 5

## @param kubernetes_pod_expiration_duration - integer - optional - default: 900
## @env DD_KUBERNETES_POD_EXPIRATION_DURATION - integer - optional - default: 900
## Set the time in second after which the Agent ignores the pods that have exited.
## Set the duration to 0 to disable this filtering.
#
# kubernetes_pod_expiration_duration: 900

## @param kubelet_listener_polling_interval - integer - optional - default: 5
## @env DD_KUBELET_LISTENER_POLLING_INTERVAL - integer - optional - default: 5
## Polling frequency in seconds at which autodiscovery will query the pod watcher to detect new pods/containers.
## Note that kubelet_cache_pods_duration needs to be lower than this setting, or autodiscovery will only poll more frequently the same cached data (kubelet_cache_pods_duration controls the cache refresh frequency).
#
# kubelet_listener_polling_interval: 5



####################################################
## Kubernetes apiserver integration Configuration ##
####################################################

## @param kubernetes_kubeconfig_path - string - optional - default: ""
## @env DD_KUBERNETES_KUBECONFIG_PATH - string - optional - default: ""
## When running in a pod, the Agent automatically uses the pod's service account
## to authenticate with the API server.
## Provide the path to a custom KubeConfig file if you wish to install the Agent out of a pod
## or customize connection parameters.
## See https://kubernetes.io/docs/tasks/access-application-cluster/configure-access-multiple-clusters/
#
# kubernetes_kubeconfig_path: ""

## @param kubernetes_apiserver_ca_path - string - optional - default: ""
## @env DD_KUBERNETES_APISERVER_CA_PATH - string - optional - default: ""
## When running in a pod, the Agent automatically uses the pod's service account CA.
## Use this option to keep using the InCluster config but overriding the default CA Path.
## This parameter has no effect if `kubernetes_kubeconfig_path` is set.
#
# kubernetes_apiserver_ca_path: ""

## @param kubernetes_apiserver_tls_verify - boolean - optional - default: true
## @env DD_KUBERNETES_APISERVER_TLS_VERIFY - boolean - optional - default: true
## When running in a pod, the Agent automatically uses the pod's service account CA.
## Use this option to keep using the InCluster config but deactivating TLS verification (in case APIServer CA is not ServiceAccount CA)
## This parameter has no effect if `kubernetes_kubeconfig_path` is set.
#
# kubernetes_apiserver_tls_verify: true

## @param kubernetes_apiserver_use_protobuf - boolean - optional - default: false
## @env DD_KUBERNETES_APISERVER_USE_PROTOBUF - boolean - optional - default: false
## By default, communication with the apiserver is in json format. Setting the following
## option to true allows communication in the binary protobuf format.
#
# kubernetes_apiserver_use_protobuf: false

## @param kubernetes_collect_metadata_tags - boolean - optional - default: true
## @env DD_KUBERNETES_COLLECT_METADATA_TAGS - boolean - optional - default: true
## Set this to false to disable tag collection for the Agent.
## Note: In order to collect Kubernetes service names, the Agent needs certain rights.
## See https://github.com/DataDog/datadog-agent/blob/main/Dockerfiles/agent/README.md#kubernetes
#
# kubernetes_collect_metadata_tags: true

## @param kubernetes_metadata_tag_update_freq - integer - optional - default: 60
## @env DD_KUBERNETES_METADATA_TAG_UPDATE_FREQ - integer - optional - default: 60
## Set how often in secons the Agent refreshes the internal mapping of services to ContainerIDs.
#
# kubernetes_metadata_tag_update_freq: 60

## @param kubernetes_apiserver_client_timeout - integer - optional - default: 10
## @env DD_KUBERNETES_APISERVER_CLIENT_TIMEOUT - integer - optional - default: 10
## Set the timeout for the Agent when connecting to the Kubernetes API server.
#
# kubernetes_apiserver_client_timeout: 10

## @param collect_kubernetes_events - boolean - optional - default: false
## @env DD_COLLECT_KUBERNETES_EVENTS - boolean - optional - default: false
## Set `collect_kubernetes_events` to true to enable collection of kubernetes
## events to be sent to Datadog.
## Note: leader election must be enabled below to collect events.
##       Only the leader Agent collects events.
## See https://github.com/DataDog/datadog-agent/blob/main/Dockerfiles/agent/README.md#event-collection
#
# collect_kubernetes_events: false

## @param kubernetes_event_collection_timeout - integer - optional - default: 100
## @env DD_KUBERNETES_EVENT_COLLECTION_TIMEOUT - integer - optional - default: 100
## Set the timeout between two successful event collections in milliseconds.
#
# kubernetes_event_collection_timeout: 100

## @param leader_election - boolean - optional - default: false
## @env DD_LEADER_ELECTION - boolean - optional - default: false
## Set the parameter to true to enable leader election on this node.
## See https://github.com/DataDog/datadog-agent/blob/main/Dockerfiles/agent/README.md#leader-election
#
# leader_election: false

## @param leader_lease_duration - integer - optional - default: 60
## @env DD_LEADER_LEASE_DURATION - integer - optional - default: 60
## Set the leader election lease in seconds.
#
# leader_lease_duration: 60

## @param kubernetes_node_labels_as_tags - map - optional
## @env DD_KUBERNETES_NODE_LABELS_AS_TAGS - json - optional
## Configure node labels that should be collected and their name as host tags.
## Note: Some of these labels are redundant with metadata collected by cloud provider crawlers (AWS, GCE, Azure)
#
# kubernetes_node_labels_as_tags:
#   kubernetes.io/hostname: nodename
#   beta.kubernetes.io/os: os
#
# DD_KUBERNETES_NODE_LABELS_AS_TAGS='{"NODE_LABEL": "TAG_KEY"}'

## @param kubernetes_node_annotations_as_tags - map - optional
## @env DD_KUBERNETES_NODE_ANNOTATIONS_AS_TAGS - json - optional
## Configure node annotationss that should be collected and their name as host tags.
#
# kubernetes_node_annotations_as_tags:
#   cluster.k8s.io/machine: machine
#
# DD_KUBERNETES_NODE_ANNOTATIONS_AS_TAGS='{"NODE_ANNOTATION": "TAG_KEY"}'

## @param kubernetes_node_annotations_as_host_aliases - list - optional
## @env DD_KUBERNETES_NODE_ANNOTATIONS_AS_HOST_ALIASES - list - optional
## Configure node annotations that should be collected and used as host aliases.
#
# kubernetes_node_annotations_as_host_aliases:
# - cluster.k8s.io/machine
#
# DD_KUBERNETES_NODE_ANNOTATIONS_AS_HOST_ALIASES='["cluster.k8s.io/machine"]'

## @param cluster_name - string - optional
## @env DD_CLUSTER_NAME - string - optional
## Set a custom kubernetes cluster identifier to avoid host alias collisions.
## The cluster name can be up to 40 characters with the following restrictions:
## * Lowercase letters, numbers, and hyphens only.
## * Must start with a letter.
## * Must end with a number or a letter.
##
## These are the same rules as the ones enforced by GKE:
## https://cloud.google.com/kubernetes-engine/docs/reference/rest/v1beta1/projects.locations.clusters#Cluster.FIELDS.name
#
# cluster_name: <CLUSTER_IDENTIFIER>

## @param disable_cluster_name_tag_key - boolean - optional - default: false
## @env DD_DISABLE_CLUSTER_NAME_TAG_KEY - boolean - optional - default: false
## Disable using the 'cluster_name' tag key to submit orchestrator cluster name tag.
## The Agent will continue sending the cluster name tag with 'kube|ecs_cluster_name' key
## regardless of the value of this parameter.
#
# disable_cluster_name_tag_key: false

## @param kubernetes_ad_tags_disabled -- list of strings - optional
## @env DD_KUBERNETES_AD_TAGS_DISABLED -- list of strings - optional
## Can only be set to a single valid value: [ "kube_service" ]
## in order to not attach the kube_service tag on ready pods
#
# kubernetes_ad_tags_disabled:
#   - kube_service


## @param prometheus_scrape - custom object - optional
## This section configures the Autodiscovery based on the Prometheus annotations
#
# prometheus:

  ## @param enabled - boolean - optional - default: false
  ## Enables the prometheus config provider
  #
  # enabled: false

  ## @param service_endpoints - boolean - optional - default: false
  ## Enables Service Endpoints checks in the prometheus config provider
  #
  # service_endpoints: false

  ## @param checks - custom object - optional
  ## Defines any extra prometheus/openmetrics check configurations to be handled by the prometheus config provider
  #
  # checks: {}

  ## @param version - integer - optional - default: 2
  ## Version of the openmetrics check to be scheduled by the Prometheus auto-discovery
  #
  # version: 2



###################################
## Network Devices Configuration ##
###################################

## @param network_devices - custom object - optional
## Configuration related to Network Devices Monitoring
#
# network_devices:

  ## @param namespace - string - optional - default: default
  ## Namespace can be used to disambiguate devices with the same IP.
  ## Changing namespace will cause devices being recreated in NDM app.
  ## It should contain less than 100 characters and should not contain any of
  ## `&lt;`, `>`, `\n`, `\t`, `\r` characters.
  ## This field is used by NDM features (SNMP check, SNMP Traps listener, etc).
  #
  # namespace: default

  ## @param snmp_traps - custom object - optional
  ## This section configures SNMP traps collection.
  ## Traps are forwarded as logs and can be found in the logs explorer with a source:snmp-traps query
  #
  # snmp_traps:

    ## @param enabled - boolean - optional - default: false
    ## Set to true to enable collection of traps.
    #
    # enabled: false

    ## @param port - integer - optional - default: 9162
    ## @env DD_SNMP_TRAPS_CONFIG_PORT - integer - optional - default: 9162
    ## The UDP port to use when listening for incoming trap packets.
    ## Because the Datadog Agent does not run as root, the port cannot be below 1024.
    ## However, if you run `sudo setcap 'cap_net_bind_service=+ep' /opt/datadog-agent/bin/agent/agent`,
    ## the Datadog Agent can listen on ports below 1024.
    #
    # port: 9162

    ## @param community_strings - list of strings - required
    ## A list of known SNMP community strings that devices can use to send traps to the Agent.
    ## Traps with an unknown community string are ignored.
    ## Enclose the community string with single quote like below (to avoid special characters being interpreted).
    ## Must be non-empty.
    #
    # community_strings:
    #   - '<COMMUNITY_1>'
    #   - '<COMMUNITY_2>'

    ## @param users - list of custom objects - optional
    ## List of SNMPv3 users that can be used to listen for traps.
    ## NOTE: Currently the Datadog Agent only supports having a
    ## single user in this list.
    ## Each user can contain:
    ##  * username     - string - The username used by devices when sending Traps to the Agent.
    ##  * authKey      - string - (Optional) The passphrase to use with the given user and authProtocol
    ##  * authProtocol - string - (Optional) The authentication protocol to use when listening for traps from this user.
    ##                            Available options are: MD5, SHA, SHA224, SHA256, SHA384, SHA512.
    ##                            Defaults to MD5 when authKey is set.
    ##  * privKey      - string - (Optional) The passphrase to use with the given user privacy protocol.
    ##  * privProtocol - string - (Optional) The privacy protocol to use when listening for traps from this user.
    ##                            Available options are: DES, AES (128 bits), AES192, AES192C, AES256, AES256C.
    ##                            Defaults to DES when privKey is set.
    #
    # users:
    # - username: <USERNAME>
    #   authKey: <AUTHENTICATION_KEY>
    #   authProtocol: <AUTHENTICATION_PROTOCOL>
    #   privKey: <PRIVACY_KEY>
    #   privProtocol: <PRIVACY_PROTOCOL>

    ## @param bind_host - string - optional
    ## The hostname to listen on for incoming trap packets.
    ## Binds to 0.0.0.0 by default (accepting all packets).
    #
    # bind_host: 0.0.0.0

    ## stop_timeout - float - optional - default: 5.0
    ## The maximum number of seconds to wait for the trap server to stop when the Agent shuts down.
    #
    # stop_timeout: 5.0

  ## @param netflow - custom object - optional
  ## This section configures NDM NetFlow (and sFlow, IPFIX) collection.
  #
  # netflow:

    ## @param enabled - boolean - optional - default: false
    ## Set to true to enable collection of NetFlow traffic.
    #
    # enabled: false

    ## @param listeners - custom object - optional
    ## This section configures one or more listeners ports that will receive flow traffic.
    ## Each listener have the following options:
    ##  * flow_type    - string - The flow type correspond to the incoming flow protocol.
    ##                            Choices are: netflow5, netflow9, ipfix, sflow5
    ##  * port         - string - (Optional) The port used to receive incoming flow traffic.
    ##                            Default port differ by flow type: netflow5(2055), netflow9(2055), ipfix(4739), sflow5(6343)
    ##  * bind_host    - string - (Optional) The hostname to listen on for incoming netflow packets.
    ##                            Binds to 0.0.0.0 by default (accepting all packets).
    ##  * workers      - string - (Optional) Number of workers to use for this listener.
    ##                            Defaults to 1.
    #
    # listeners:
    # - flow_type: netflow9
    #   port: 2055
    # - flow_type: netflow5
    #   port: 2056
    # - flow_type: ipfix
    #   port: 4739
    # - flow_type: sflow5
    #   port: 6343

    ## stop_timeout - integer - optional - default: 5
    ## The maximum number of seconds to wait for the NetFlow listeners to stop when the Agent shuts down.
    #
    # stop_timeout: 5



###################################
## OpenTelemetry Configuration   ##
###################################

## @param otlp_config - custom object - optional
## This section configures OTLP ingest in the Datadog Agent.
#
# otlp_config:

  ## @param receiver - custom object - optional
  ## The receiver configuration. It follows the OpenTelemetry Collector's OTLP Receiver Configuration.
  ## This template lists the most commonly used settings; see the OpenTelemetry Collector documentation
  ## for a full list of available settings:
  ## https://github.com/open-telemetry/opentelemetry-collector/blob/main/receiver/otlpreceiver/config.md
  #
  # receiver:

    ## @param protocols - custom object - optional
    ## Configuration for the supported protocols.
    #
    # protocols:

        ## @param grpc - custom object - optional
        ## Configuration for OTLP/gRPC listener.
        ## Setting this as an empty section enables the OTLP/gRPC listener with default options.
        #
        # grpc:

          ## @param endpoint - string - optional - default: 0.0.0.0:4317
          ## @env DD_OTLP_CONFIG_RECEIVER_PROTOCOLS_GRPC_ENDPOINT - string - optional - default: 0.0.0.0:4317
          ## The OTLP/gRPC listener endpoint.
          #
          # endpoint: 0.0.0.0:4317

          ## @param transport - string - optional - default: tcp
          ## @env DD_OTLP_CONFIG_RECEIVER_PROTOCOLS_GRPC_TRANSPORT - string - optional - default: tcp
          ## The OTLP/gRPC listener transport protocol.
          ## Known protocols are "tcp", "udp", "ip", "unix", "unixgram", and "unixpacket".
          #
          # transport: tcp

          ## @param max_recv_msg_size_mib - number - optional - default: 4
          ## @env DD_OTLP_CONFIG_RECEIVER_PROTOCOLS_GRPC_MAX_RECV_MSG_SIZE_MIB - number - optional - default: 4
          ## The maximum size (in MiB) of messages accepted by the OTLP/gRPC endpoint.
          #
          # max_recv_msg_size_mib: 4

        ## @param http - custom object - optional
        ## Configuration for OTLP/HTTP listener.
        ## Setting this as an empty section enables the OTLP/HTTP listener with default options.
        #
        # http:

          ## @param endpoint - string - optional - default: 0.0.0.0:4318
          ## @env DD_OTLP_CONFIG_RECEIVER_PROTOCOLS_HTTP_ENDPOINT - string - optional - default: 0.0.0.0:4318
          ## The OTLP/HTTP listener endpoint.
          #
          # endpoint: 0.0.0.0:4318

  ## @param metrics - custom object - optional
  ## Metrics-specific configuration for OTLP ingest in the Datadog Agent.
  #
  # metrics:

    ## @param enabled - boolean - optional - default: true
    ## @env DD_OTLP_CONFIG_METRICS_ENABLED - boolean - optional - default: true
    ## Set to false to disable metrics support in the OTLP ingest endpoint.
    ## To enable the OTLP ingest, the otlp_config.receiver section must be set.
    #
    # enabled: true

    ## @param resource_attributes_as_tags - boolean - optional - default: false
    ## @env DD_OTLP_CONFIG_METRICS_RESOURCE_ATTRIBUTES_AS_TAGS - boolean - optional - default: false
    ## Set to true to add all resource attributes of a metric to its metric tags.
    ## When set to false, only a small predefined subset of resource attributes is converted
    ## to metric tags.
    #
    # resource_attributes_as_tags: false

    ## Deprecated - use `instrumentation_scope_metadata_as_tags` instead in favor of
    ## https://github.com/open-telemetry/opentelemetry-proto/releases/tag/v0.15.0
    ## Both must not be set at the same time.
    ## @param instrumentation_library_metadata_as_tags - boolean - optional - default: false
    ## @env DD_OTLP_CONFIG_METRICS_INSTRUMENTATION_LIBRARY_METADATA_AS_TAGS - boolean - optional - default: false
    ## Set to true to add metadata about the instrumentation library that created a metric.
    #
    # instrumentation_library_metadata_as_tags: false

    ## @param instrumentation_scope_metadata_as_tags - boolean - optional - default: false
    ## @env DD_OTLP_CONFIG_METRICS_INSTRUMENTATION_SCOPE_METADATA_AS_TAGS - boolean - optional - default: false
    ## Set to true to add metadata about the instrumentation scope that created a metric.
    #
    # instrumentation_scope_metadata_as_tags: false

    ## @param tag_cardinality - string - optional - default: low
    ## @env DD_OTLP_CONFIG_METRICS_TAG_CARDINALITY - string - optional - default: low
    ## Configure the level of granularity of tags to send for OTLP metrics. Choices are:
    ##   * low: add tags about low-cardinality objects (clusters, hosts, deployments, container images, ...)
    ##   * orchestrator: add tags about pod, (in Kubernetes), or task (in ECS or Mesos) -level of cardinality
    ##   * high: add tags about high-cardinality objects (individual containers, user IDs in requests, ...)
    ## WARNING: sending container tags for checks metrics may create more metrics
    ## (one per container instead of one per host). This may impact your custom metrics billing.
    #
    # tag_cardinality: low

    ## @param delta_ttl - int - optional - default: 3600
    ## @env DD_OTLP_CONFIG_METRICS_DELTA_TTL - int - optional - default: 3600
    ## The amount of time (in seconds) that values are kept in memory for
    ## calculating deltas for cumulative monotonic metrics.
    #
    # delta_ttl: 3600

    ## @param histograms - custom object - optional
    ## Configuration for OTLP Histograms.
    ## See https://docs.datadoghq.com/metrics/otlp/?tab=histogram for details.
    #
    # histograms:

      ## @param mode - string - optional - default: distributions
      ## @env DD_OTLP_CONFIG_METRICS_HISTOGRAMS_MODE - string - optional - default: distributions
      ## How to report histograms. Valid values are:
      ##
      ## - `distributions` to report metrics as Datadog distributions (recommended).
      ## - `nobuckets` to not report bucket metrics,
      ## - `counters` to report one metric per histogram bucket.
      #
      # mode: distributions

      ## Deprecated - use `send_aggregation_metrics` instead. This flag will override `send_aggregation_metrics` if both are set.
      ## @param send_count_sum_metrics - boolean - optional - default: false
      ## @env DD_OTLP_CONFIG_METRICS_HISTOGRAMS_SEND_COUNT_SUM_METRICS - boolean - optional - default: false
      ## Whether to report sum, count, min, and max as separate histogram metrics.
      #
      # send_count_sum_metrics: false

      ## @param send_aggregation_metrics - boolean - optional - default: false
      ## @env DD_OTLP_CONFIG_METRICS_HISTOGRAMS_SEND_AGGREGATION_METRICS - boolean - optional - default: false
      ## Whether to report sum, count, min, and max as separate histogram metrics.
      #
      # send_aggregation_metrics: false

    ## @param sums - custom object - optional
    ## Configuration for OTLP Sums.
    ## See https://docs.datadoghq.com/metrics/otlp/?tab=sum for details.
    #
    # sums:

        ## @param cumulative_monotonic_mode - string - optional - default: to_delta
        ## @env DD_OTLP_CONFIG_METRICS_SUMS_CUMULATIVE_MONOTONIC_MODE - string - optional - default: to_delta
        ## How to report cumulative monotonic sums. Valid values are:
        ##
        ## - `to_delta` to calculate delta for sum in the client side and report as Datadog counts.
        ## - `raw_value` to report the raw value as a Datadog gauge.
        #
        # cumulative_monotonic_mode: to_delta

        ## @param initial_cumulative_monotonic_value - string - optional - default: auto
        ## How to report the initial value for cumulative monotonic sums. Valid values are:
        ##
        ## - `auto` reports the initial value if its start timestamp is set and it happens after the process was started.
        ## - `drop` always drops the initial value.
        ## - `keep` always reports the initial value.
        #
        # initial_cumulative_monotonic_value: auto

    ## @param summaries - custom object - optional
    ## Configuration for OTLP Summaries.
    ## See https://docs.datadoghq.com/metrics/otlp/?tab=summary for more details.
    #
    # summaries:

        ## @param mode - string - optional - default: gauges
        ## @env DD_OTLP_CONFIG_METRICS_SUMMARIES_MODE - string - optional - default: gauges
        ## How to report summaries. Valid values are:
        ##
        ## - `noquantiles` to not report quantile metrics.
        ## - `gauges` to report one gauge metric per quantile.
        #
        # mode: gauges

  ## @param traces - custom object - optional
  ## Traces-specific configuration for OTLP ingest in the Datadog Agent.
  #
  # traces:

    ## @param enabled - boolean - optional - default: true
    ## @env DD_OTLP_CONFIG_TRACES_ENABLED - boolean - optional - default: true
    ## Set to false to disable traces support in the OTLP ingest endpoint.
    ## To enable the OTLP ingest, the otlp_config.receiver section must be set.
    #
    # enabled: true

    ## @param span_name_as_resource_name - boolean - optional - default: false
    ## @env DD_OTLP_CONFIG_TRACES_SPAN_NAME_AS_RESOURCE_NAME - boolean - optional - default: false
    ## If set to true the OpenTelemetry span name will used in the Datadog resource name.
    ## If set to false the resource name will be filled with the instrumentation library name + span kind.
    #
    # span_name_as_resource_name: false

    ## @param span_name_remappings - map - optional
    ## @env DD_OTLP_CONFIG_TRACES_SPAN_NAME_REMAPPINGS - json - optional
    ## Defines a map of span names and preferred names to map to. This can be used to automatically map Datadog Span
    ## Operation Names to an updated value.
    ## span_name_remappings:
    ##   "io.opentelemetry.javaagent.spring.client": "spring.client"
    ##   "instrumentation:express.server": "express"
    ##   "go.opentelemetry.io_contrib_instrumentation_net_http_otelhttp.client": "http.client"
    #
    # span_name_remappings:
    #   <OLD_NAME>: <NEW_NAME>

    ## @param probabilistic_sampler - custom object - optional
    ## Probabilistic sampler controlling the rate of ingestion. Using this sampler works consistently
    ## in a distributed system where the sampling rate is shared. Exceptions are made for errors and
    ## rare traces (if enabled via apm_config.enable_rare_sampler).
    #
    # probabilistic_sampler:
      ## @param sampling_percentage - number - optional - default: 100
      ## @env DD_OTLP_CONFIG_TRACES_PROBABILISTIC_SAMPLER_SAMPLING_PERCENTAGE - number - optional - default: 100
      ## Percentage of traces to ingest (0 100]. Invalid values (&lt;= 0 || > 100) are disconsidered and the default is used.
      ## If incoming spans have a sampling.priority set by the user, it will be followed and the sampling percentage will
      ## be overridden.
      #
      # sampling_percentage: 100

  ## @param logs - custom object - optional
  ## Logs-specific configuration for OTLP ingest in the Datadog Agent.
  #
  # logs:

    ## @param enabled - boolean - optional - default: false
    ## @env DD_OTLP_CONFIG_LOGS_ENABLED - boolean - optional - default: false
    ## Set to true to enable logs support in the OTLP ingest endpoint.
    ## To enable the OTLP ingest, the otlp_config.receiver section must be set.
    #
    # enabled: true

## @param debug - custom object - optional
  ## Debug-specific configuration for OTLP ingest in the Datadog Agent.
  ## This template lists the most commonly used settings; see the OpenTelemetry Collector documentation
  ## for a full list of available settings:
  ## https://github.com/open-telemetry/opentelemetry-collector/tree/main/exporter/loggingexporter#getting-started
  #
  # debug:

    ## Deprecated (v[6/7].41.0) - use `verbosity` instead
    ## @param loglevel - string - optional - default: none
    ## @env DD_OTLP_CONFIG_DEBUG_LOGLEVEL - string - optional - default: none
    ## Verbosity of debug logs when Datadog Agent receives otlp traces/metrics.
    ## Valid values are disabled, debug, info, error, warn.
    #
    # loglevel: info

    ## @param verbosity - string - optional - default: normal
    ## @env DD_OTLP_CONFIG_DEBUG_VERBOSITY - string - optional - default: normal
    ## Verbosity of debug logs when Datadog Agent receives otlp traces/metrics.
    ## Valid values are basic, normal, detailed.
    #
    # verbosity: normal
