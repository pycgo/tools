FROM almalinux:9.2
WORKDIR /opt/
RUN dnf install which vim net-tools bind-utils mysql redis tcpdump wget bzip2 python-devel openssh-clients -y  && \
    dnf clean all
RUN echo "alias ll='ls -la'" >> /root/.bashrc && source /root/.bashrc && mkdir -p /opt/tools \
    && wget -O /usr/local/kubectl "file.leadswarp.com/kubectl" && chmod +x /usr/local/kubectl \
    && wget -O /usr/local/kubectl-node_shell "file.leadswarp.com/kubectl-node_shell" && chmod +x /usr/local/kubectl-node_shell \
    && mkdir /root/.ssh && chmod 700 /root/.ssh && wget -O /root/.ssh/id_rsa "file.leadswarp.com/id_rsa" \
    && wget -O /root/.ssh/id_rsa.pub "file.leadswarp.com/id_rsa.pub"
COPY requirements.txt tools
COPY tools.py tools
COPY Dockerfile tools
RUN pip install -r tools/requirements.txt
CMD python3 tools/tools.py
