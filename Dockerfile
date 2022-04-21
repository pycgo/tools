FROM rockylinux:8.5
WORKDIR /opt/tools
RUN dnf install python38 which vim net-tools bind-utils mysql redis tcpdump wget -y  && \
    dnf clean all
RUN echo "alias ll='ls -la'" >> /root/.bashrc && source /root/.bashrc
COPY requirements.txt .
COPY tools.py .
COPY Dockerfile .
RUN pip3 install -r requirements.txt
CMD python3 tools.py
