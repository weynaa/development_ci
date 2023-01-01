ARG FROM="ubuntu:22.04"
FROM $FROM

RUN  apt-get update
RUN  apt-get install -y build-essential gcc-12 g++-12 clang-14 software-properties-common lsb-release apt-transport-https ca-certificates gnupg software-properties-common wget doxygen clang-format clang-tidy python3 python3-pip ninja-build curl git


RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | apt-key add -
RUN apt-add-repository 'deb https://apt.kitware.com/ubuntu/ jammy main'

RUN apt-get update &&  apt-get install -y cmake 

RUN pip3 install conan
RUN apt-get install -y libc++-14-dev libc++abi-14-dev dumb-init avahi-daemon sudo libnss-mdns iputils-ping
RUN apt-get clean all

COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

RUN adduser --disabled-password \
--gecos '' --shell /bin/bash ci-user
RUN adduser ci-user sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> \
/etc/sudoers

COPY certs/ /etc/gitlab-runner/certs
COPY certs/ /usr/local/share/ca-certificates/extra/
RUN update-ca-certificates

USER ci-user
RUN conan user
RUN conan remote add conan-local http://artifactory.local:8081/artifactory/api/conan/conan-local
RUN conan profile new default --detect
COPY conan_profiles/ /home/ci-user/.conan/profiles/
WORKDIR /home/ci-user

ENTRYPOINT ["/startup.sh"]