#!/bin/bash

# Runs second router on common bridge. Use this image to test
# getting at first router's ports from a second docker instance.

docker run \
       -d \
       --rm \
       --name qdrouterd2 \
       -p 0.0.0.0:15672:5672 \
       -p 0.0.0.0:15674:5674 \
       local:research-dispatch-router qdrouterd

#
# To shell into this container/image:
# docker exec -i -t qdrouterd2 /bin/bash
#
# To stop the container/image:
# docker stop qdrouterd2
#
