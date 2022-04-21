# 基于Rockylinux 8.5   运维工具tools

在linux中安装常用的运维工具，如python38 which vim net-tools bind-utils mysql redis tcpdump wget，方便在容器环境使用

## 开发

```bash
git clone git@github.com:pycgo/tools.git
cd tools
docker build -t tools .
```



## 启动方式

### docker

```bash
docker run -itd xlovepython/tools
```

### k8s

#### 命令方式

```bash
 kubectl create deployment tools --image=xlovepython/tools --port=80
```

#### yaml方式

```bash
kubectl create -f tools.yaml
```

