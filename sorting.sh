#!/usr/bin/bash
echo "Enter your dictionary txt file path: "
read -r WPATH
tr ' ' '\n' < $WPATH > base.txt
LNF=0
LNS=1
while true
do
sed "$LNF,$LNS!d" base.txt | tr '\n' ' ' >> base2.txt
let "LNF++"
let "LNS++"
echo $LNS
if [[ $LNS == $(wc -l < base.txt) ]]
then
break
fi
done
xargs -n 2 < base2.txt > double.txt
awk '!seen[$0]++' double.txt > double-sorted.txt
while true
do
    read line1 || break
    read line2 || break
    read line3 || break
	echo $line1 $line2 $line3
done < base.txt > triple.txt
awk '!seen2[$0]++' triple.txt > triple-sorted.txt
exit 0