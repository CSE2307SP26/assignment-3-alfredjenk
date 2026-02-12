#!/bin/bash
expected_out=$1
student_out=$2



while read student ; do
    echo $student 

    git clone https://github.com/CSE2307SP26/$student.git
    cd $student
    git checkout cipher
   


    git checkout `git rev-list -n 1 --first-parent --before="2026-02-12 10:00" cipher`

    if [[ -f "Cipher.java" ]] #skeloton for chekcking cipherre
        then
            echo "1"
        else
            echo "0"
        fi

done
