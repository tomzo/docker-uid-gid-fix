Alternative approach to making sure directory mounted from host has correct ownership inside container.

### Problem

We have a directory on docker host `/host/data/` with owner whose uid:gid is `777:888`.
If we mount to docker container with `--volume /host/data/:/srv/myservice` then
there is no guarantee that container has a user with uid and gid matching `777:888`.

### Solution

We have 2 approaches available to ensure correct permissions:

1. run `chown myservice -R /srv/myservice` on container start. We might not want
this when there are lots of files in `/srv/service` or we care about keeping numeric uid and gid in host.
2. change uid and gid of `myservice` on container start to match with mounted directory

This repository demonstrates second option. It has its limitations:
 * cannot be used when host owner is root (uid=0,gid=0) and container owner is not root
 * when docker image already contains files owned by `myservice` user then
 after changing uid and gid we have to search for all those files and update their ownership
