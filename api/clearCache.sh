#!/bin/bash
echo -e "\t清除缓存\n"
filepath=$(cd "$(dirname "$0")/../runtime"; pwd)
echo $filepath
find . -type f \;