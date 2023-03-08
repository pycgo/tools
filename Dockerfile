FROM almalinux:9.0
WORKDIR /opt/
RUN dnf install which vim net-tools bind-utils mysql redis tcpdump wget bzip2 java-1.8.0-openjdk* python-devel -y  && \
    dnf clean all
RUN echo "alias ll='ls -la'" >> /root/.bashrc && source /root/.bashrc && mkdir -p /opt/tools
COPY requirements.txt tools
COPY tools.py tools
COPY Dockerfile tools
ADD dependency/zookeeper/apache-zookeeper-3.8.0-bin.tar.gz .
RUN pip install -r tools/requirements.txt
CMD python3 tools/tools.py
