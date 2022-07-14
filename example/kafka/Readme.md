# Kafka client

## 使用举例

进入容器后 可以使用以下命令查看存在的topic

```bash
/opt/kafka-3.1.0/bin/kafka-topics.sh --bootstrap-server 192.168.11.11:9092 --list
```

查看消费组
```bash
/opt/kafka-3.1.0/bin/kafka-consumer-groups.sh --bootstrap-server 192.168.11.11:909 --list
```

其他命令参考kafka

