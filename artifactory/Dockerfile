FROM ubuntu:20.04

RUN apt-get update && apt-get install -y avahi-daemon openjdk-11-jre-headless net-tools unzip wget gpg
RUN wget -qO - https://releases.jfrog.io/artifactory/api/gpg/key/public | apt-key add -;echo "deb https://releases.jfrog.io/artifactory/artifactory-debs focal main" | tee -a /etc/apt/sources.list && apt-get update && apt-get install -y jfrog-artifactory-cpp-ce

COPY avahi/ /etc/avahi
ENV ARTIFACTORY_HOME=/opt/jfrog/artifactory
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh
ENTRYPOINT [ "/startup.sh" ]