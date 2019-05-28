#!/bin/bash

timestamp=`date "+%Y%m%d-%H%M%S"`
fileout=$(hostname).${timestamp}
w > $fileout


echo "all users " users >> $fileout
num_users=`users | awk '{print NF}'` 

echo -e "\nActive users= "$num_users >> $fileout


#Memory
echo -e "\nMemory consuming" >> $fileout
ps -eo pmem,pcpu,vsize,pid,cmd | tail -n+2 | sort -k 1 -nr | awk '{if($1>0) print $0}' >> $fileout

#CPU
echo -e "\nCPU processing" >> $fileout
ps -eo pmem,pcpu,vsize,pid,cmd | tail -n+2 | sort -k 2 -nr | awk '{if($2>0) print $0}' >> $fileout
