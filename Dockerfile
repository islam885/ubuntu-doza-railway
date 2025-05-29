FROM ubuntu:22.04

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget curl git python3 python3-pip openssh-server && \
    mkdir /var/run/sshd

RUN wget -qO /bin/ttyd https://github.com/tsl0922/ttyd/releases/download/1.7.3/ttyd.x86_64 && \
    chmod +x /bin/ttyd

EXPOSE $PORT
EXPOSE $SSHPORT

RUN echo 'useradd -m -s /bin/bash $USERNAME && echo "$USERNAME:$PASSWORD" | chpasswd' >> /init.sh && \
    echo 'echo "Port $SSHPORT" >> /etc/ssh/sshd_config' >> /init.sh && \
    echo 'echo "PermitRootLogin yes" >> /etc/ssh/sshd_config' >> /init.sh && \
    echo 'echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config' >> /init.sh && \
    echo '/usr/sbin/sshd' >> /init.sh && \
    echo '/bin/ttyd -p $PORT -c $USERNAME:$PASSWORD /bin/bash' >> /init.sh && \
    chmod +x /init.sh

CMD ["/bin/bash", "/init.sh"]
