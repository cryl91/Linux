#!/bin/bash
#a=1
#while [ $a -le 5 ] 
#do 
#echo "$a"
#((a++))
#done

#while read line
#do
#echo "$line"
#done < "Code.sh"

var=$1

while IFS= read -r user; #IFS is a special shell variable that tells the shell what characters to use to split input into words. Default value: space, tab, and newline
do #Without IFS the spaces in the lines are reduced to one space. While IFS Preserves the spaces.
    if [[ "$user" == *$var* ]]; then
        echo "Found it! --> $user"
        # Optionally exit the loop early
        break
    fi
done < 1Code.sh
