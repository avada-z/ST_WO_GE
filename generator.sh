#!/usr/bin/bash
echo "Write your sentence:"
read -r INPUT
LWORD=$(echo $INPUT | grep -oE '[^[:space:]]+$')
echo "Last word is: "
echo $LWORD && echo $LWORD > lword.txt
LN=0
NUMWS=$(awk 'NR==FNR{a[$0]=$0}NR>FNR{if($1==a[$1])print $0}' lword.txt double-sorted.txt | wc -l)
echo "There are total $NUMWS matches, how many you want to see?"
read NUMW
MATCH=$(awk 'NR==FNR{a[$0]=$0}NR>FNR{if($1==a[$1])print $0}' lword.txt double-sorted.txt | head -n $NUMW | grep -oE '[^[:space:]]+$')
echo $MATCH | tr ' ' '\n' > gen.txt
while IFS= read -r line; do
echo $INPUT $line
done < gen.txt
exit 0