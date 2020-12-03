#!/bin/sh

rm -f tmp3b.counts

for rule in .1 ...1 .....1 .......1 .2 ; do
  dots=`echo $rule | sed 's/[0-9][0-9]*//'`
  skips=`echo $rule | sed 's/[.]*//'`

  cat input3.txt > tmp3b

  while [ -s tmp3b ] ; do
    sed -i bak -nE '2,$p' tmp3b
    sed -i bak -nE $skips',$p' tmp3b
    sed -i bak 's/\('$dots'\)\(.*\)/\2\1/' tmp3b
    sed -n '1s/^#.*/1/p' tmp3b
  done | wc -l | tee -a tmp3b.counts
done

(cat tmp3b.counts ; sed -n '2,$s/.*/*/p' tmp3b.counts ; echo "p") | dc
