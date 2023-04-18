# zookeeper client

## 使用举例

进入容器后 登录远端zk

```bash
/opt/apache-zookeeper-3.8.0-bin/bin/zkCli.sh -server 172.16.86.131:2181
```



其他命令参考zookeeper

修改整个节点文件

```bash
/opt/apache-zookeeper-3.8.0-bin/bin/zkCli.sh -server 172.16.86.131:2181 set /path "`cat my-znode-content.xml`"
```
