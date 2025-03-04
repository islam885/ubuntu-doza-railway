FROM ubuntu:22.04

# Update dan upgrade sistem
RUN apt-get update && \
    apt-get upgrade -y

# Install semua paket yang dibutuhkan (biar gak terpisah-pisah)
RUN apt-get install -y wget curl git python3 python3-pip neofetch

# Install Node.js v20
RUN curl -fsSL https://deb.nodesource.com/setup_20.x -o setup_node.sh && \
    chmod +x setup_node.sh && \
    bash setup_node.sh && \
    apt-get install -y nodejs && \
    rm setup_node.sh  # Bersihkan file setup

# Download dan beri izin eksekusi untuk ttyd
RUN wget -qO /bin/ttyd https://github.com/tsl0922/ttyd/releases/download/1.7.7/ttyd.x86_64 && \
    chmod +x /bin/ttyd

# Ekspose port
EXPOSE $PORT

# Debug credentials
RUN echo $CREDENTIAL > /tmp/debug

# Jalankan ttyd dengan autentikasi & jalankan neofetch saat masuk shell
CMD ["/bin/bash", "-c", "neofetch; /bin/ttyd -p $PORT -c $USERNAME:$PASSWORD /bin/bash"]
