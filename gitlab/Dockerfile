FROM gitlab/gitlab-ce:latest

RUN apt-get update && apt-get install -y avahi-daemon libnss-mdns
RUN echo '*' > /etc/mdns.allow
RUN sed -i "s/hosts:.*/hosts:          files mdns4 dns/g" /etc/nsswitch.conf

COPY avahi/ /etc/avahi
COPY startup.sh /assets/startup.sh
RUN chmod +x /assets/startup.sh
ENTRYPOINT [ "/assets/startup.sh" ]