#!/bin/bash
cd ./gnuplots
for i in $(ls ./*.gp)
do
$1 $i
done
cd ..
for i in $(ls ./*.eps)
do
epspdf ./$i
done
#cd images
#for i in $(ls *|grep tga)
#do
#convert -quality 100 -density 300 -trim $i $(echo $i|awk -F "." '{print $1}').eps
#done
