#!/bin/bash
while getopts ":o:" flag; do
  case $flag in 
    o)
      output_file="$OPTARG"
      echo $output_file
      ;;
    *)
      echo ouput file name is not given job is abandon
      exit 1
      ;;
  esac
done

JOB_ID=${1}
PLAYER_LASTNAME=${2}
PLAYER_AGE=${3}
sleep 2

echo $output_file
echo "name:$JOB_ID  length:${#JOB_ID}" >>  $output_file  

echo "Finished job #${JOB_ID}"
