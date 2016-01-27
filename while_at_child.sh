#!/bin/bash
# 프로세스의 결과를 while 문에서 읽어들일 때 주의할 점
#
# * BASHPID
#   - Process ID를 얻기 위해 $$를 사용하면 먼저 전처리되기 때문에 원하는 값을 얻기 어렵다.
#   - $BASHPID를 사용해야만 원하는 process ID를 얻을 수 있다.
#   - BASHPID는 Bash 4.0 이후에 추가되어서 Mac OS X El Capitan에서는 동작하지 않는다.
#
# * <(process)
#   - process의 실행 결과를 named pipe로 보내고 <(process)를 named pipe로 변경한다.
#   - file(read 용)이 들어갈 자리에 프로세스를 넣을 수 있게 해 준다.
#

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
