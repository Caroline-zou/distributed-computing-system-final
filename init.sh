#!/bin/bash

# 设置 Spark 和 Hadoop 环境变量
SPARK_HOME="/home/ubuntu/spark-2.4.7"
HADOOP_HOME="/home/ubuntu/hadoop-2.10.1"
HADOOP_CONF_DIR="${HADOOP_HOME}/etc/hadoop"
SPARK_CONF_DIR="${SPARK_HOME}/conf"

# 关闭 Spark 服务
echo "Stopping Spark..."
$SPARK_HOME/sbin/stop-all.sh
$SPARK_HOME/sbin/stop-history-server.sh

# 关闭 Hadoop 服务
echo "Stopping Hadoop (DFS and YARN)..."
$HADOOP_HOME/sbin/stop-dfs.sh
$HADOOP_HOME/sbin/stop-yarn.sh

# 等待服务完全停止
echo "Waiting for services to stop..."
sleep 5

# 重新初始化节点（清理临时文件和日志）
echo "Cleaning up temporary and log files..."
rm -rf ${HADOOP_HOME}/tmp/* ${HADOOP_HOME}/logs/*
rm -rf ${SPARK_HOME}/logs/*

# 格式化 HDFS 文件系统
echo "Formatting HDFS..."
$HADOOP_HOME/bin/hdfs namenode -format

# 重新启动 Hadoop 服务
echo "Starting Hadoop (DFS and YARN)..."
$HADOOP_HOME/sbin/start-dfs.sh
$HADOOP_HOME/sbin/start-yarn.sh

# 等待 Hadoop 启动
echo "Waiting for Hadoop to start..."
sleep 10

# 重新启动 Spark 服务
echo "Starting Spark..."
$SPARK_HOME/sbin/start-all.sh

# 启动 Spark History Server（如果需要）
hdfs dfs -mkdir -p /tmp/spark_history
hdfs dfs -chmod 1777 /tmp/spark_history
echo "Starting Spark History Server..."
$SPARK_HOME/sbin/start-history-server.sh

# 检查 Spark 和 Hadoop 状态
echo "Checking Spark and Hadoop status..."
jps


$HADOOP_HOME/sbin/hadoop-daemon.sh start datanode
