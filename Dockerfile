FROM almalinux:9.0
WORKDIR /opt/
RUN dnf install net-tools bind-utils tcpdump wget mysql redis  python-devel -y  && \
    dnf clean all
RUN echo "alias ll='ls -la'" >> /root/.bashrc && source /root/.bashrc && mkdir -p /opt/tools
COPY requirements.txt tools
COPY tools.py tools
COPY Dockerfile tools
RUN pip install -r tools/requirements.txt
CMD python3 tools/tools.py
