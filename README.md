# lload
Scripts to extract the old of login nodes, still early version

Have all the files in the same folder

Edit the config file to declare the prefix of your login node and the timestep, in seconds, every when to extract information about the login node

Execute from each login node

```
./lload.sh &
```

We create one file per one minute

Execute:

``
prepare_stats.sh i
``

where i is the id of the login node. 

The output will be something like:

Start and end date
How many records (one per minute)
min and max users, memory and cpu utilization  for all the duration

Date start: 20190528-113657 end: 20190528-152704  
Records: 231  
users: min 31 max 42  
memory: min 5.3 max 5.4  
cpu: min 6.5 max 156.6

