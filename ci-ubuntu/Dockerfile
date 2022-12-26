FROM ubuntu:22.04

RUN  apt-get update
RUN  apt-get install -y build-essential gcc-12 clang clang-14 software-properties-common lsb-release

RUN apt-get install -y apt-transport-https ca-certificates gnupg software-properties-common wget

RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | apt-key add -
RUN apt-add-repository 'deb https://apt.kitware.com/ubuntu/ jammy main'

RUN apt-get update &&  apt-get install -y cmake python3 python3-pip ninja-build curl git

RUN apt-get install -y doxygen clang-format clang-tidy

RUN pip3 install conan

RUN apt clean all

RUN useradd -ms /bin/bash ci-user

USER ci-user
RUN conan user
RUN conan remote add conan-local http://artifactory:8081/artifactory/api/conan/conan-local
COPY --chown=ci-user conan_profiles/ /home/ci-user/.conan/profiles/
