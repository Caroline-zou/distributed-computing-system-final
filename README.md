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






分工：





