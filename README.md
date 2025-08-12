# docker-socket-proxy
A simple socket proxy based on a [**rootless** Nginx-mainline-alpine-slim](https://hub.docker.com/r/nginxinc/nginx-unprivileged) image that allows you to build an image with only the Docker Engine API URL you want to expose.

### How it works:
1. It adds the `docker` group to the container. (⚠️ Verify that the group ID is the same inside the container as on the host.)
2. It adds the nginx user to the docker group, which allows the nginx **process** run by the nginx **user** to send instructions inside the socket.
3. (Optional) It copies the configuration inside the container. Feel free to adjust this line as needed.

⚠️🚩
Running this container with `2375:2375` gives all your networks access to your Docker socket.
Make sure to run it with at least `127.0.0.1:2375:2375` or with the container connected to an internal network.
Or security measures (firewall rules, etc.) may be necessary.
⚠️🚩

This container supports:
- `read_only: true`
- WIP Testing for
```yml
cap_drop:
  - ALL
```

### Caveat:
It needs to be run with the following:
`userns_mode: "host"` in case you are using the [remap functionality](https://docs.docker.com/engine/security/userns-remap/). Otherwise, the Docker socket won't be readable inside the container.
