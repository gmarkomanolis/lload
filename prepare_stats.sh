#!/bin/bash

ls -ltr login$1* | awk '{print $NF}' > file_list
for i in `cat file_list`; do cat $i | grep Active |awk '{print $3}'; done  > users_num
#cat users_num | awk 'BEGIN {b=0;s=1000}{if($1>b) b=$1;if($1<s) s=$1}END{print s,b}';



for i in `cat file_list`; do cat $i | awk 'BEGIN{a=0;b=0;mem=0;cpu=0}{if($1=="Memory") a=1; if($1=="CPU") {a=0;b=1;} else {if(a==1) mem=mem+$1; if(b==1) cpu=cpu+$2}}END{print mem,cpu}'; done > utilization

paste users_num utilization > delete

startl=`head -n 1 file_list | awk 'BEGIN{FS="."}{print $2}'`
endl=`tail -n 1 file_list | awk 'BEGIN{FS="."}{print $2}'`

echo -e "Date start: "$startl" end: "$endl
echo "Records: "`wc -l < file_list`
cat delete | awk 'BEGIN{users_min=1000;users_max=0;mem_min=1024;mem_max=0;cpu_min=8000;cpu_max=0}{if($1>users_max) users_max=$1; if($1<users_min) users_min=$1;if($2>mem_max) mem_max=$2;if($2<mem_min) mem_min=$2;if($3>cpu_max) cpu_max=$3;if($3<cpu_min) cpu_min=$3}END{print "users: min " users_min " max " users_max"\nmemory: min " mem_min " max " mem_max"\ncpu: min " cpu_min " max " cpu_max}'


rm delete
