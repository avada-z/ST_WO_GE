#!/usr/bin/bash
echo "Write your sentence:"
read -r INPUT
LWORD=$(echo $INPUT | grep -oE '[^[:space:]]+$')
echo "Last word is: "
echo $LWORD && echo $LWORD > lword.txt
MATCH=$(awk 'NR==FNR{a[$0]=$0}NR>FNR{if($1==a[$1])print $0}' lword.txt double.txt | head -n 1 | grep -oE '[^[:space:]]+$')
echo $INPUT $MATCH
exit 0