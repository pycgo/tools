# 基于Rockylinux 8.5   运维工具tools

介绍：

在linux中安装常用的运维工具，如python38 which vim net-tools bind-utils mysql redis tcpdump wget
可以方便在容器环境使用 dig mysql redis-cli 等命令

## 支持列表

## 支持列表

✅mysql

✅redis-cli

✅Python3

- [ ] Node
- [ ] kafka
- [ ] elasticsearch
- [ ] rabbitmq
- [ ] Hdfs
- [ ]  And etc....

## 开发

```bash
git clone git@github.com:pycgo/tools.git
cd tools
docker build -t tools .
```



## 启动方式

### docker

```bash
#本地自己编译的
docker run -itd tools
#用已经在docker hub编译好的
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
## web验证

```bash
docker exec -it b9ec36751f97 curl 127.0.0.1
```

结果类似如下：

```bash
1、已经安装的工具列表如下：
python38
which
vim
net-tools
bind-utils
mysql
redis
tcpdump
wget


2、python3.8的第三方库如下：
mysql-connector-python==8.0.28
requests==2.26.0
Flask==2.1.1
pyignite==0.5.2
```
