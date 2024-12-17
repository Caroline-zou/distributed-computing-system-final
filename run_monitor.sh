#!/bin/bash

# 定义slave节点的IP地址或主机名
SLAVE1="slave-1"  # 这里用实际的hostname或IP地址替换
SLAVE2="slave-2"  # 这里用实际的hostname或IP地址替换

# 定义monitor.sh脚本的路径，假设每个slave的用户目录下都有这个脚本
MONITOR_SCRIPT_PATH="/home/ubuntu/monitor.sh"

# 在master节点运行的任务，启动两个slave节点上的monitor.sh
echo "========== Starting monitor.sh on slave nodes =========="

# 通过SSH在slave1上启动monitor.sh并使其后台运行
echo "Starting monitor.sh on $SLAVE1..."
ssh $SLAVE1 "bash $MONITOR_SCRIPT_PATH &" &

# 通过SSH在slave2上启动monitor.sh并使其后台运行
echo "Starting monitor.sh on $SLAVE2..."
ssh $SLAVE2 "bash $MONITOR_SCRIPT_PATH &" &

# 等待监控任务完成（或者你可以选择等待一段时间）
wait
echo "Monitor scripts have been started on both slave nodes."
echo "You can check the monitor output on each respective slave."
