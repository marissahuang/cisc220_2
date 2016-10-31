#!/bin/bash

#Kevin Zuern 10134425
#Marissa Huang 10179169
#Deven Bernard 10099810
#Quentin Petraroia 10145835

#pstree -s -p
#ps axo user,pid,ppid,start | pgrep -P $3

recurse() {
  for word in $*; do
    echo $word
    ps axo user,pid,ppid,comm | grep $word
    x=$(pgrep -P $word)
    echo children
    echo $x
    recurse $x
done
}
recurse 1
