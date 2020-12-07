#!/bin/sh


sed 's/^$/$/' input5.txt | tr '\n$' ' \n' | sed 's/ $//' | sed 's/^ //' > tmp5.txt

sed 's/\([^ ]*\) /| tr -cd "\1" /g' tmp5.txt | sed 's/^\(.*\) \([^ ]*\)$/echo \2 \1 /' | sed 's/^\([^ ]*\)$/echo \1 | tr -cd "\1"/' > tmp5.sh

sh tmp5.sh | wc -c
