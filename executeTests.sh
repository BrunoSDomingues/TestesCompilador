#!/bin/bash
R=('2' '1' '77' '3' '3' '4' '1' '145' '-1' '5' '49' '-2' '-6' '1' '2' '1' 'Traceback()' 'Traceback()' 'Traceback()' 'Traceback()' 'Traceback()' 'Traceback()' 'Traceback()' 'Traceback()' 'Traceback()')
files=(./tests/*)
N_tests=${#R[@]}

FILE=""

if [ $# -eq 0 ]
  then
    read -p "Enter file path: " FILE
  else
    FILE="$1"
fi

for ((i = 0; i < $N_tests; i++)); do
    A=$(python3 $FILE ${files[$i]} 2>&1)
    if ! [[ $A == ${R[$i]} ]]; then      # if not equal to number in list
        if ! [[ $A =~ ^${R[$i]} ]]; then # if regex doesn't match
            echo "Failure on ${files[$i]}. Expected ${R[$i]}, but got $A."
            exit
        fi
    fi
done

echo "All tests passed"
