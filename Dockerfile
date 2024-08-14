FROM ubuntu:20.04

RUN apt-get update && \
    apt-get install -y sudo openssh-server python3 python3-pip && \
    pip3 install ansible

RUN mkdir /var/run/sshd && \
    echo 'root:password' | chpasswd && \
    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    mkdir /root/.ssh

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
