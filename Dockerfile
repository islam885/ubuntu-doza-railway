FROM ubuntu:22.04

# Update dan upgrade sistem
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y wget curl git python3 python3-pip neofetch

# Install ttyd versi 1.7.3
RUN wget -qO /bin/ttyd https://github.com/tsl0922/ttyd/releases/download/1.7.3/ttyd.x86_64 && \
    chmod +x /bin/ttyd

# Tambahkan neofetch ke dalam bashrc (agar muncul otomatis saat user masuk)
RUN echo "neofetch" >> /root/.bashrc

# Ekspose port
EXPOSE $PORT

# Debug credentials
RUN echo $CREDENTIAL > /tmp/debug

# Jalankan ttyd sebagai perintah utama
CMD ["/bin/bash", "-c", "/bin/ttyd -p $PORT -c $USERNAME:$PASSWORD /bin/bash"]
