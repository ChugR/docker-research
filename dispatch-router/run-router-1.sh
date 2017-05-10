#!/bin/bash

# Run qdrouter research project
#  -d    detached
#  --rm  delete container when stopped
#  -p 0.0.0.0:5672:5672 all interfaces sent to 5672
#  -p 0.0.0.0:5674:5674 all interfaces sent to 5674
#     Note: Router listens to
#        5672 on all interfaces with no auth
#        5674 on all interfaces with auth

docker run \
       -d \
       --rm \
       --name qdrouterd \
       -p 0.0.0.0:5672:5672 \
       -p 0.0.0.0:5674:5674 \
       chugr/research-dispatch-router

#
# To shell into this container/image:
# docker exec -i -t qdrouterd /bin/bash
#
# To stop the container/image:
# docker stop qdrouterd
#
