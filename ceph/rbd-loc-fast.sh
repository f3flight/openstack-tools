#!/bin/bash

if [ -z ${1} ] || [ -z ${2} ];
then
  echo 'USAGE: ./rbd-loc-fast.sh <pool> <image>'
  exit 1
fi
rbd_info=$(rbd -p ${1} info ${2})
rbd_prefix=$(echo "$rbd_info" | grep block_name_prefix | awk '{print $2}')
last_obj_num=$(($(echo "$rbd_info" | grep -o 'in [[:digit:]]\+ objects' | cut -d' ' -f2)-1))
for i in $(seq 0 $last_obj_num)
do
  ceph osd map ${1} ${rbd_prefix}.$(printf '%016x' $i)
done
