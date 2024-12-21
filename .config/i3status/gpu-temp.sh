#!/bin/sh 

i3status | while :
do
  read line
  gpus=""
  for id in "$@"
  do
    gpus="$gpus`nvidia-smi --id=$id --query-gpu=name,temperature.gpu --format=csv,noheader | tr -d '\n\r' | tr ',' ':'` °C | "
  done
  echo "$gpus $line" || exit 1
done
