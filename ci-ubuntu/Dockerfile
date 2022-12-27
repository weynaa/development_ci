FROM ubuntu:22.04

RUN  apt-get update
RUN  apt-get install -y build-essential gcc-12 g++-12 clang-14 software-properties-common lsb-release apt-transport-https ca-certificates gnupg software-properties-common wget doxygen clang-format clang-tidy python3 python3-pip ninja-build curl git


RUN wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | apt-key add -
RUN apt-add-repository 'deb https://apt.kitware.com/ubuntu/ jammy main'

RUN apt-get update &&  apt-get install -y cmake 

RUN pip3 install conan
RUN apt-get install -y libc++-14-dev libc++abi-14-dev
RUN apt-get clean all

RUN useradd -ms /bin/bash ci-user

USER ci-user
RUN conan user
RUN conan remote add conan-local http://artifactory:8081/artifactory/api/conan/conan-local
RUN conan profile new default --detect
COPY --chown=ci-user conan_profiles/ /home/ci-user/.conan/profiles/
