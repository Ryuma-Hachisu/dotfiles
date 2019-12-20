#!/bin/sh

for i in `seq 0 300`
do
    src_name=`printf "./chara%03d/ss/akiba_chara_anim%03d.ssbp" $i $i`
    dst_name=`printf "./chara%03d/chara%03d/akiba_chara_anim%03d.ssbp" $i $i $i`
    cp $src_name $dst_name
done
