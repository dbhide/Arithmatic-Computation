#!/bin/bash -x

declare -A Results
declare -a arrayResult
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

for (( i=0;i<4;i++ ))
do
	arrayResult[i]=${Results[op$((i+1))]}
done
echo ${arrayResult[@]}

len=${#arrayResult[@]}

for((i=0;i<$len-1;i++))
do
   for((j=i+1;j<$len;j++))
   do
      if [[ ${arrayResult[i]%.*} -lt ${arrayResult[j]%.*} ]]
      then
            temp=${arrayResult[i]}
            arrayResult[i]=${arrayResult[j]}
            arrayResult[j]=$temp
      fi
   done
done

echo ${arrayResult[@]}

