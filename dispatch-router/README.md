#  Researching Qpid Dispatch Router under Docker

This Docker project starts with a Fedora image and then adds source builds for Apache projects [Qpid Proton](http://qpid.apache.org/proton/index.html) and [Qpid Dispatch Router](http://qpid.apache.org/components/dispatch-router/index.html). 

# Overview #

This Docker image provides a Dispatch Router ready to go. Use it to test your brokerless AMQP peer-to-peer infrastructure.

The Dockerfile provides the build instructions and produces the image. Several source scripts are included to provide a working system right away. Use these scripts as models for further testing or for your production setup.

The project directory holds scripts used to manage the Docker image on the host system.

* ./build-docker-image.sh - Docker command line to create the image
* ./run-router-1.sh - Shell script to launch one instance of the router
* ./run-router-2.sh - Shell script to launch another instance of the router

The ./scripts directory holds scripts that are installed in the Docker image and control and configure the router.

* ./scripts/launch-qdrouterd.sh - Shell script to start the router
* ./scripts/qdrouterd.conf - Router configuration file
* ./scripts/qdrouterd_sasl.conf - Router SASL configuration file


