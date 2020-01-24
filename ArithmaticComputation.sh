#!/bin/bash -x

declare -A Results

read -p "Enter Value of a: " number1
read -p "Enter Value of b: " number2
read -p "Enter Value of c: " number3

result1=`echo "scale=2; $number1+$number2*$number3" | bc`
result2=`echo "scale=2; $number1*$number2+$number3" | bc`
result3=`echo "scale=2; $number3+$number1/$number2" | bc`
result4=`echo "$number1%$number2+$number3" | bc`


Results[op1]="$result1"
Results[op2]="$result2"
Results[op3]="$result3"
Results[op4]="$result4"



