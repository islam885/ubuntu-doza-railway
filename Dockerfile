FROM ubuntu:22.04

# Update dan upgrade sistem
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget curl git python3 python3-pip neofetch

# Install Node.js v20
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

# Download dan beri izin eksekusi untuk ttyd
RUN wget -qO /bin/ttyd https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.x86_64 && \
    chmod +x /bin/ttyd

# Ekspose port
EXPOSE $PORT

# Debug credentials
RUN echo $CREDENTIAL > /tmp/debug

# Jalankan ttyd dengan autentikasi
CMD ["/bin/bash", "-c", "/bin/ttyd -p $PORT -c $USERNAME:$PASSWORD /bin/bash"]
