#!/bin/sh

echo "shiny gold bag" > tmp7c
rm -f tmp7a
touch tmp7a

while ! diff tmp7a tmp7c ; do
cp tmp7c tmp7a

grep -E "`cat tmp7a | tr '\n' '|' | sed 's/[| ]*$//'`" input7.txt | sed 's/s* contain.*//' | sed 's/ *$//' > tmp7b
cat tmp7a tmp7b | sort -u > tmp7c

cat tmp7c | grep -v  "shiny gold bag" | wc -l

done




