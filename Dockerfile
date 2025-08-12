FROM nginxinc/nginx-unprivileged:mainline-alpine-slim
ARG GID=996
USER root
RUN addgroup -g ${GID} docker \
    && adduser nginx docker
USER nginx
