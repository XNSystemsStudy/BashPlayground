#!/bin/bash
if [ -z "$2" ];then
	echo "Usage: $(basename $0) <from> <to>"
	echo "       $(basename $0) 0xAC00 0xD7AF"
	echo "       $(basename $0) 44032 55215"
	exit 1
fi

FROM=$(($1))
TO=$(($2))

for ((i=$FROM;i<=$TO;i++));do
	hex=$(printf "%X" $i)
	echo -e '\u'$hex
done


