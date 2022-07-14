FROM rockylinux:8.5
WORKDIR /opt/
RUN dnf install python38 which vim net-tools bind-utils mysql redis tcpdump wget bzip2 java-1.8.0-openjdk* -y  && \
    dnf clean all
RUN echo "alias ll='ls -la'" >> /root/.bashrc && source /root/.bashrc && mkdir -p /opt/tools
COPY requirements.txt tools
COPY tools.py tools
COPY Dockerfile tools
ADD dependency/kafka/kafka-3.1.0.tbz .
ADD dependency/zookeeper/apache-zookeeper-3.8.0-bin.tar.gz .
RUN pip3 install -r tools/requirements.txt
CMD python3 tools/tools.py
