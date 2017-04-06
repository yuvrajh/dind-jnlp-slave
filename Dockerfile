FROM java:8u66-jdk

ENV JENKINS_REMOTING_VERSION 2.52
ENV HOME /home/jenkins

RUN useradd -c "Jenkins user" -d $HOME -m jenkins && groupadd docker && gpasswd -a jenkins docker

#RUN curl https://get.docker.com/builds/Linux/x86_64/docker-1.13.1.tgz -o /tmp/docker.tgz && tar -xvzf /tmp/docker.tgz && mv -v docker/* /usr/local/bin/


RUN curl --create-dirs -sSLo /usr/share/jenkins/remoting-$JENKINS_REMOTING_VERSION.jar http://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/$JENKINS_REMOTING_VERSION/remoting-$JENKINS_REMOTING_VERSION.jar \
  && chmod 755 /usr/share/jenkins

COPY docker/* /usr/local/bin/

USER jenkins

VOLUME /home/jenkins
USER root
ENTRYPOINT ["/usr/local/bin/jenkins-slave.sh"]
