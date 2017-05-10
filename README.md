# docker-research
Various Docker projects

# dispatch-router #

This Docker project starts with a Fedora image and then adds source builds for Apache projects [Qpid Proton](http://qpid.apache.org/proton/index.html) and [Qpid Dispatch Router](http://qpid.apache.org/components/dispatch-router/index.html). 

Run a version from Docker public registry:

* docker run -d --rm --name qdrouterd -p 0.0.0.0:5672:5672 -p 0.0.0.0:5674:5674 chugr/research-dispatch-router