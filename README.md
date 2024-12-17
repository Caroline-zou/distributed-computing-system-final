# distributed-computing-system-final

实验目的：

    测试不同StorageLevel对spark性能的影响。


实验方法：

    本实验采用spark-bench中的kmeans案例对spark的性能进行测试。
    
    分别对
    
    MEMORY_ONLY
    
    DISK_ONLY
    
    MEMORY_AND_DISK
    
    MEMORY_ONLY_SER
    
    MEMORY_AND_DISK_SER
    
    五种StorageLevel下spark的性能表现及从节点的系统参数进行测试。


    1、使用超过内存大小的数据集（约22G）进行测试
    2、使用远小于内存大小的数据集（约19MB）进行测试
       


结果：
实验结果图在Graph_All目录下
结论：
1、如果 RDD 完全适合内存且不会溢出，则使用 MEMORY_ONLY。
2、如果内存不足以存储整个RDD，请选择MEMORY_AND_DISK_SER。



分工：
邹越溪：设计实验内容，搭建实验环境，可视化实验结果，答辩、PPT制作
唐震：实验设计，搭建环境，脚本编写，跑实验，结果分析




