#!/bin/sh

rm -f tmp3b.counts

for rule in .1 ...1 .....1 .......1 .2 ; do
  dots=`echo $rule | sed 's/[0-9][0-9]*//'`
  skips=`echo $rule | sed 's/[.]*//'`

  cat input3.txt > tmp3b

  ## sensible version
  if false ; then
    while [ -s tmp3b ] ; do
      sed -i '' '1,'$skips'd; s/\('$dots'\)\(.*\)/\2\1/' tmp3b
      sed -n '1s/^#.*/1/w /dev/stdout' tmp3b
    done | wc -l | tee -a tmp3b.counts
  else
  ## fast version
    lines=`wc -l < input3.txt | xargs`
    (eval "echo {2..$lines}"',\$'s'/\\\('$dots'\\\)\\\(.*\\\)/\\2\\1/\ \;' ; echo "/^#/p") | sed -E 's/; */\
/g' | sed '/^$/d' > tmp3.sed
    cat input3.txt | awk "(NR + 1) % $skips == 0" | sed -nf tmp3.sed | wc -l | tee -a tmp3b.counts
  fi
done

(cat tmp3b.counts ; sed -n '2,$s/.*/*/p' tmp3b.counts ; echo "p") | dc
