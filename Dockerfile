FROM joshuacox/ubuntu:14.04
MAINTAINER 'josh at webhosting coop'

COPY assets/setup/ /app/setup/
RUN chmod 755 /app/setup/install
RUN /app/setup/install

COPY assets/config/ /app/setup/config/
COPY assets/init /app/init
RUN chmod 755 /app/init

EXPOSE 22
EXPOSE 80
EXPOSE 443
# NO_HTTP_PROXY
# MOUNT_FROM_HOST /exports/gitlab/git/data /home/git/data
# MOUNT_FROM_HOST /epxorts/gitlab/var/log/gitlab /var/log/gitlab
# dontMOUNT_FROM_HOST /home/git/src/docker-openfire.git/lib /var/lib/openfire
# PORTS_FROM_HOST 16422 22
# PORTS_FROM_HOST 16480 80
# PORTS_FROM_HOST 16443 443

VOLUME ["/home/git/data"]
VOLUME ["/var/log/gitlab"]

ENTRYPOINT ["/app/init"]
CMD ["app:start"]
