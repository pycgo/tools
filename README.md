# tools

基于Rockyliux 8.5
在linux中安装常用的运维工具，如python38 which vim net-tools bind-utils mysql redis tcpdump wget，方便在容器环境使用

启动方式


1、docker
docker run -itd xlovepython/tools

2、k8s 命令方式
kubectl create deployment tools --image=xlovepython/tools --port=80
