#!/bin/bash
# 한(unicode codepoint)
echo -e "\ud55c"
echo -e '\ud55c'
echo $'\ud55c'

# 한(UTF-8)
echo -e "\xed\x95\x9c"
echo -e '\xed\x95\x9c'
echo $'\xed\x95\x9c'

# 한(grapheme cluster)
echo -e "\u1112\u1161\u11ab"
echo -e '\u1112\u1161\u11ab'
echo $'\u1112\u1161\u11ab'

# reginal indicator symbol
echo $'\U1F1FA\U1F1F8\U1F1F0\U1F1F7'

# 한1
echo $'\ud55c1'
echo $'\U0000d55c1'
# wrong
echo $'\Ud55c1'

