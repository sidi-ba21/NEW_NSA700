#!/bin/bash

# Get args
https_port=$1
ssh_port=$2
domain_name=$3

# Get your public IP address
ipv4=$(curl -s ip4.me | grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b")

volume_path=/srv/gitlab-server/

# Run Docker container with GitLab
docker run --detach \
  --hostname gitlab.example.com \
  --env GITLAB_OMNIBUS_CONFIG="external_url 'https://$(if [ -n "$domain_name" ]; then echo "$domain_name"; else echo "$ipv4"; fi)/';" \
  --publish "${https_port}":443 --publish "${ssh_port}":22 \
  --name gitlab-server \
  --restart always \
  --volume "${volume_path}"config:/etc/gitlab \
  --volume "${volume_path}"logs:/var/log/gitlab \
  --volume "${volume_path}"data:/var/opt/gitlab \
  --shm-size 256m \
  gitlab/gitlab-ee:latest