FROM nginxinc/nginx-unprivileged:mainline-alpine-slim
ARG GID=996
USER root
RUN addgroup -g ${GID} docker \
    && adduser nginx docker
COPY ./nginx.conf /etc/nginx/conf.d/nginx.conf # You can remove this line if you want to conf.d to be umpty, and use volume, config or secret
USER nginx
EXPOSE 2375
