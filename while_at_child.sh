#!/bin/bash
# 프로세스의 결과를 while 문에서 읽어들일 때 주의할 점
#
# Process ID를 얻기 위해 $$를 사용하면 먼저 전처리되기 때문에 원하는 값을 얻기 어렵다.
# $BASHPID를 사용해야만 원하는 process ID를 얻을 수 있다.

function wrong {
    local count=0
    echo "PID: $BASHPID"
    ls -1 | while read line;do
        echo "    PID in while: $BASHPID"
        let count=count+1
        #echo $line
    done
    echo "Wrong Total = $count"
}

function correct {
    local count=0
    echo "PID: $BASHPID"
    while read line;do
        echo "    PID in while: $BASHPID"
        let count=count+1
        #echo $line
    done < <(ls -1)
    echo "Correct Total = $count"
}

wrong
correct
