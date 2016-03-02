#!/bin/bash
if [ -z "$2" ];then
	PROGRAM=$(basename $0)
	echo "Usage: $PROGRAM <from> <to>"
	echo "       $PROGRAM 0xAC00 0xD7AF (Hangul Syllabels)"
	echo "       $PROGRAM 44032 55215 (Hangul Syllables)"
	echo "       $PROGRAM 0x1D100 0x1D1FF (Musical Symbols)"
	exit 1
fi

# decimal,hex to decimal
FROM=$(($1))
TO=$(($2))

# BASH 3.XX does NOT support \u, \U
NATIVE_UNICODE=N
[ $'\U41' = 'A' ] && NATIVE_UNICODE=Y

for ((i=$FROM;i<=$TO;i++));do
	hex=$(printf "%08X" $i)
	if [ $NATIVE_UNICODE = 'Y' ];then
		utf8=$(echo -e "\U$hex")
	else
		# 3 times slower than native support
		utf8=$(echo -n "$hex" | xxd -r -p | iconv -f UCS-4BE -t UTF-8)
	fi
	echo "0x$hex($i) : $utf8"
done


