#!/bin/sh

cat input3.txt > tmp3a

while [ -s tmp3a ] ; do
  sed -i bak -nE '2,$p' tmp3a
  sed -i bak 's/\(...\)\(.*\)/\2\1/' tmp3a
  sed -n '1s/^#.*/1/p' tmp3a
done | wc -l
