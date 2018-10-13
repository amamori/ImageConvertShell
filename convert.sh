#!/bin/bash

resize_percent=$1

if [ ${#resize_percent} -gt 2 ]; then
	echo "0から99の間で入力してください"
	exit
fi

mkdir convert_file

for fname in image*.png; do
  newfname=$(echo "${fname}" | sed "s/\.png$/_${resize_percent}p.png/g")
  convert -geometry ${resize_percent}% "${fname}" "convert_file/${newfname}"
  echo "${fname}終わりました"
done
