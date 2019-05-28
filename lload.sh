#!/bin/bash

timestep=`cat config  | grep timesteps | awk 'BEGIN{FS="="}{print $2}'`
while true; do
	~/stats.sh
	sleep $timestep
done
