FROM mwechner/gitlab-runner-helper:ubuntu20.04

COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

COPY certs/ /etc/gitlab-runner/certs
COPY certs/ /usr/local/share/ca-certificates/extra/
RUN update-ca-certificates
ENV GODEBUG=netdns=cgo+1
ENV LOCALDOMAIN=1
ENTRYPOINT ["/usr/bin/dumb-init", "/startup.sh"]
CMD ["sh"]