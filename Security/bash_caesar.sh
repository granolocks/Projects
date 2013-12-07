#!/bin/bash
# examople usage:
# ./bash_caesar <key (1-25)> <input file>
#
# user@pc:~$ echo "hi" > sample
# user@pc:~$ ./bash_caesar.sh 2 sample
# jk
# user@pc:~$ ./bash_caesar.sh 20 sample
# bc


export A=$(echo {a..z} | sed -r 's/ //g';); export C=$(echo $A | sed -r "s/^.{$1}//g")$(echo $A | sed -r "s/.{$( expr 26 - $1 )}$//g"); tr '[A-Z]' $A < $2  | tr $A $C



