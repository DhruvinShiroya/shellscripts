#!/bin/bash

# we will use parallel to create 100 numbers and write that to the file output.txt

while getopts ":o:i:" options; do
  case $options in 
    o)
      output_file="$OPTARG"
      echo $output_file
      ;;
    i)
      input_file_path="$OPTARG"
      ;;
    *)
      echo "Usage: $0 [-o output_filename] [-i input_directorypath]"
      exit 1
      ;;
  esac

done
if test -f ./$output_file; then 
  echo "file exist"
  echo "please delete file with the name or change the argument in [-o output_filename]"
else
  echo "file does not exist creating one "
  touch $output_file
fi

if test -f ./$input_file_path; then
  echo "Input file exist now parsing the file "
else 
  echo "Input file not present please check source"
  exit 1 
fi 
# given the input file take the first field and run job on it.


cat $input_file_path | cut -d " " -f 1-2 | parallel ./do_someting.sh {} -o output.txt


