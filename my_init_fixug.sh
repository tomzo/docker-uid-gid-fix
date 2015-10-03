#!/bin/bash

/usr/bin/fix-uid-gid /srv/myservice myservice myservice
rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi

/sbin/my_init
