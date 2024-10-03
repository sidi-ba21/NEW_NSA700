# Gitlab server installation

- https://195.35.48.81:4433/

## Requirements

- docker (https://www.docker.com/get-started/)

## Run

```
./script.sh <https-port> <ssh-port> <?domain-name>
```

## Post installation

- Now you can Browse to https://your-ip to access the gitlab client
- Default user is root and password specified in your conf
- To get password run this command : ```docker exec -it gitlab-server grep 'Password:' /etc/gitlab/initial_root_password```
- After you logged in you can update your password as your wish (Note: the default password is available for 24h).