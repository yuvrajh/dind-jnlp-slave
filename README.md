
Do we really want Docker-in-Docker?

Or just want to run Docker to perform CI System (build, run, push container images to hub) in Jenkins. Jenkins Master will launch Jenkins Slave as container and it will perform CI operation in it.
Yes.. Yes.. we can run docker commands in inside jenkins slave container.

We required Docker binaries files in jenkins slave container, here while creating docker image through docker file we have added docker binaries file to it.

Once image build, we have just to volume mount Docker sock [/var/run/docker.sock] of host machine on conatiner [/var/run/docker.sock].

Here we are executing Docker-daemon from host machine and Docker client as jenkins slave container.
This looks like Docker-in-Docker, feels like Docker-in-Docker, but it’s not Docker-in-Docker
