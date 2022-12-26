FROM archlinux
RUN pacman -Syu --noconfirm base-devel git libtool autoconf unzip wget python gcc clang ninja cmake jdk11-openjdk python-pip openssh sudo && pacman -Scc
RUN ssh-keygen -A
RUN echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers
RUN pip3 install conan
RUN useradd -ms /bin/bash jenkins
RUN usermod -aG wheel jenkins && usermod --append --groups wheel jenkins
CMD ["/usr/bin/sshd", "-D"] 
