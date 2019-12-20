#!/bin/sh


for i in `seq 0 300`
do
    src_name=`printf "./chara%03d/ss/akiba_chara_anim%03d.ssbp" $i $i`
    dst_name=`printf "./chara%03d/chara%03d/akiba_chara_anim%03d.ssbp" $i $i $i`
    cp $src_name $dst_name
done



rm -rf ../dest
mkdir ../dest

find . -type d -name "chara*" -print0 -maxdepth 2 -mindepth 2 -exec cp -rf {} ../dest \;



for i in `seq 0 15`
do
    src_name=`printf "../chara_%d" $i`
    rm -rf $src_name
    mkdir $src_name

    src_keep_name=`printf "../chara_%d/.gitkeep" $i`
    touch $src_keep_name
done


for i in `seq 0 300`
do
    name=`printf "../dest/chara%03d" $i`    
    index=`expr $i / 25` 
    dir_name=`printf "../chara_%d/" $index`

    mv $name $dir_name
done

for i in `seq 0 15`
do
    src_name=`printf "../chara_%d/" $i`
    dst_name=`printf "/Users/eagle/work/akb/zip/chara_%d/" $i`
    cp -rf $src_name $dst_name

    delete_src_name=`printf "../chara_%d" $i`
    rm -rf delete_src_name
done

rm -rf ../dest
