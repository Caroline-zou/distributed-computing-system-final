#!/bin/bash

OUTPUT_FILE="slave1.txt"

# 输出表头
echo "Timestamp, CPU_Usage, Memory_Usage, IO_Read, IO_Write" > $OUTPUT_FILE

# 循环，每隔10秒记录一次CPU、内存和I/O使用情况
while true; do
    # 获取当前时间戳
    TIMESTAMP=$(date +%Y-%m-%d\ %H:%M:%S)
    
    # 使用 top 命令获取 CPU 使用情况
    CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/")
    
    # 使用 free 命令获取内存使用情况
    MEMORY_USAGE=$(free -m | grep Mem | awk '{print $3/$2 * 100.0}')
    
    # 使用 iostat 命令获取磁盘 I/O 情况
    # iostat 输出样式： %usr %sys %iowait %idle
    IO_STATS=$(iostat -dx 1 1 | tail -n 2 | head -n 1)
    IO_READ=$(echo $IO_STATS | awk '{print $4}')  # 读取字节数
    IO_WRITE=$(echo $IO_STATS | awk '{print $5}') # 写入字节数
    
    # 输出到 result.txt
    echo "$TIMESTAMP, $CPU_USAGE, $MEMORY_USAGE, $IO_READ, $IO_WRITE" >> $OUTPUT_FILE
    
    # 等待10秒
    sleep 10
done
