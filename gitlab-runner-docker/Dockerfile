FROM ubuntu:20.04
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive TZ="Europe/Vienna" apt-get -y install avahi-daemon libnss-mdns curl git git-lfs ca-certificates
RUN echo '*' > /etc/mdns.allow
RUN sed -i "s/hosts:.*/hosts:          files mdns4 dns/g" /etc/nsswitch.conf

COPY gitlab-config.toml /etc/gitlab-runner/config.toml
COPY certs/ /etc/gitlab-runner/certs
COPY certs/ /usr/local/share/ca-certificates/extra/
RUN update-ca-certificates
COPY binaries/ /usr/local/bin
COPY entrypoint /entrypoint
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh
RUN chmod +x /entrypoint
RUN chmod +x /usr/local/bin/gitlab-runner
RUN chmod +x /usr/local/bin/gitlab-runner-helper
ENV GODEBUG=netdns=cgo+1
ENV LOCALDOMAIN=1
RUN useradd -ms /bin/bash gitlab-runner
ENTRYPOINT [ "/startup.sh" ]