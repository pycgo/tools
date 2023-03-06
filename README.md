# 基于almalinux:9.0   运维工具tools:dig
子镜像

介绍：

在linux中安装常用的运维工具，如python39  net-tools bind-utils tcpdump wget mysql redis
可以方便在容器环境使用 dig  等命令



## 支持列表及未来计划
   绿色是已经支持的，未来的不一定会支持，看工作需要

✅tcpdump

✅wget

✅dig

✅mysql

✅redis


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
docker run -itd --name tools tools
#用已经在docker hub编译好的
docker run -itd --name tools xlovepython/tools
```

### k8s

#### 命令方式


国内
镜像由阿里云自动触发构建，一直是最新
```bash
 kubectl create deployment tools --image=registry.aliyuncs.com/opsflow/ops:dig --port=80
```

#### yaml方式

```bash
kubectl create -f tools.yaml
```
## web验证

```bash
docker exec -it tools curl 127.0.0.1
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
