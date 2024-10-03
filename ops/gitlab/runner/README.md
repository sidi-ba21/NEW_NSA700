# Gitlab runner

## Run (No root)

- Build image

```
docker build --no-cache -t nsa-lsa-gitlab-runner:1.0.0 .
```

- Run

```
 docker run -it -d --name gitlab-runner --restart always -e URL=<URL> -e TOKEN=<TOKEN> -e RUNNER_ALLOW_RUNASROOT="1" -v /var/run/docker.sock:/var/run/docker.sock nsa-lsa-gitlab-runner:1.0.0
```