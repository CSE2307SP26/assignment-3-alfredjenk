#!/bin/bash
expected_out=$1
student_out=$2

while read student ; do
    #echo $student 

    git -q clone https://github.com/CSE2307SP26/$student.git
    cd $student
    git -q checkout cipher

    git checkout -q `git rev-list -n 1 --first-parent --before="2026-02-12 10:00" cipher`

    javac Cipher.java
    java Cipher
    
    if [[ -f "$student_out" ]]
    then
        OUTPUT=$(cat $student_out)
        RIGHT_OUTPUT=$(cat ../$expected_out)
        if [[ $OUTPUT==$RIGHT_OUTPUT ]]
        then
        echo "$student: 1"
        else
        echo "$student: 0"
        fi
    else
        echo "$student: 0"
    fi

    cd ..
    rm -rf "$student"

done
