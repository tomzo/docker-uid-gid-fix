FROM phusion/baseimage:0.9.17

ADD fix-uid-gid.sh /usr/bin/fix-uid-gid
ADD my_init_fixug.sh /sbin/my_init_fixug

# Service set up..
RUN useradd myservice --home /srv/myservice

# Use baseimage-docker's init system.
# But call fix-uid-gid before all services start
CMD ["/sbin/my_init_fixug"]
