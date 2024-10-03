#!/bin/sh

# To generate config.toml -> gitlab-runner register --url https://gitlab.com  --token $TOKEN
# The result of register command
echo "
concurrent = 1
check_interval = 0
shutdown_timeout = 0

[session_server]
  session_timeout = 1800

[[runners]]
  name = '6decbb276a7b'
  url = '$URL'
  id = 31791174
  token = '$TOKEN'
  token_obtained_at = 2024-01-21T18:28:15Z
  token_expires_at = 0001-01-01T00:00:00Z
  executor = 'docker'
  [runners.docker]
    tls_verify = false
    image = 'docker:stable'
    privileged = true
    disable_entrypoint_overwrite = false
    oom_kill_disable = false
    disable_cache = false
    volumes = ['/cache']
    shm_size = 0
    network_mtu = 0
  [runners.cache]
    MaxUploadedArchiveSize = 0
" > "/etc/gitlab-runner/config.toml"

gitlab-runner run