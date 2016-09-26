FROM ubuntu:latest
MAINTAINER a-schneider9@web.de

# Update local repositories and install supervisor (process management daemon)
RUN apt-get -y update && apt-get -y install supervisor

# Copy the standard supervisor configuration.
# The supervisor process will run in foreground and keep child containers
# active when started but not attached.
COPY ./conf/supervisor.conf /etc/supervisor.conf

# Start new containers with supervisor running the copied configuration as
# standard behavior
ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisor.conf"]
