FROM almalinux:9.0
WORKDIR /opt/
RUN dnf install which vim net-tools bind-utils  python-devel  -y  && \
    dnf clean all && mkdir tools
COPY requirements.txt tools
COPY tools.py tools
COPY Dockerfile tools
RUN pip install -r tools/requirements.txt
CMD python3 tools/tools.py
