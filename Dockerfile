FROM almalinux:9.2
WORKDIR /opt/
RUN dnf install  epel-release -y && dnf install which vim net-tools procps-ng bind-utils mysql redis tcpdump wget bzip2 python-devel openssh-clients screen bash-completion -y  && \
    dnf clean all && \
    echo "alias ll='ls -la'" >> /root/.bashrc && source /root/.bashrc && mkdir -p /opt/tools \
    && wget -O /usr/local/bin/kubectl "file.leadswarp.com/kubectl" && chmod +x /usr/local/bin/kubectl \
    && wget -O /usr/local/bin/kubectl-node_shell "file.leadswarp.com/kubectl-node_shell" && chmod +x /usr/local/bin/kubectl-node_shell \
    && mkdir /root/.ssh && chmod 700 /root/.ssh && wget -O /root/.ssh/id_rsa "file.leadswarp.com/id_rsa" && chmod 600 /root/.ssh/id_rsa \
    && wget -O /root/.ssh/id_rsa.pub "file.leadswarp.com/id_rsa.pub" \
    && mkdir /root/.kube && touch /root/.kube/config \
    && kubectl completion bash > /etc/bash_completion.d/kubectl
COPY requirements.txt tools
COPY tools.py tools
COPY Dockerfile tools
RUN pip install -r tools/requirements.txt
CMD python3 tools/tools.py
