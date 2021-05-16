#!/bin/bash 
echo "------------------------------- Well come flip coin simulator ---------------------------"

declare -A flipStore

isFlip=0
maximum=0
temp=0

function totalFlip()
{
	for((index=0; index<$1; index++))
	do
		side=""
		for((indexOne=0; indexOne<$2; indexOne++))
		do
			
			flipCoin=$((RANDOM%2))
			if [ $flipCoin -eq $isFlip ]
			then
				side+=H
			else
				side+=T
			fi
		done
		flipStore[$side]=$((${flipStore[$side]}+1))
	done
	echo "Count of all combination     :${flipStore[@]}"
}


function totalPercentageFlip()
{
	for count in ${!flipStore[@]}
	{
		flipStore[$count]=`echo "scale=2; $((${flipStore[$count]}))/$times*100 "`
		temp=${flipStore[$count]}
		if [ $temp -ge $maximum ]
		then
			maximum=$temp
			key=$count
		fi
	}
}

read -p "Enter number of times you want to flip:" times
read -p "Enter choice 1)Singlet 2)Doublet 3)Triplet and so on:" coins
totalFlip $times $coins
totalPercentageFlip
echo "All head and tail combination:${!flipStore[@]}"
echo "percentage of all combination:${flipStore[@]}"
echo "Max winning combination      :" $maximum "-" $key


2.compuation_sort.sh
echo "Welcome to the Program"
echo "Enter the first Number"
read a
echo "Enter the second Number"
read b
echo "Enter the third Number"
read c
echo "First Number:$a"
echo "Second Number:$b"
echo "Third Number:$c"
result1=$(($a+($b*$c)))
result2=$((($a*$b)+$c))
result3=$(($c+($a/$b)))
result4=$((($a%$b)+$c))
echo $result1
echo $result2
echo $result3
echo $result4
declare -A test_var
test_var[key1]=$result1
test_var['key2']=$result2
test_var['key3']=$result3
# add key/value pair using bash variables
another_key_var='key4'
another_value_var=$result4
test_var[$another_key_var]=$another_value_var
echo ${test_var[key1]}
echo ${test_var[key2]}
echo ${test_var[key3]}
echo ${test_var[$another_key_var]}
counter=0
Array[((counter++))]=$result1
Array[((counter++))]=$result2
Array[((counter++))]=$result3
Array[((counter++))]=$result4
echo ${Array[@]}
echo "Original Numbers in array:"
for (( i = 0; i <= 3; i++ ))
    do
      echo ${Array[$i]}
    done

for (( i = 0; i <= 3; i++ ))
do
   for (( j = $i; j <= 3; j++ ))
   do
      if [ ${Array[$i]} -gt ${Array[$j]}  ]; then
       t=${Array[$i]}
       Array[$i]=${Array[$j]}
       Array[$j]=$t
      fi
   done
done

echo -e "\nSorted Numbers in Descending Order:"
for (( i=0; i <= 3; i++ )) 
do
  echo ${Array[$i]}
done
for (( i = 0; i <= 3; i++ ))
do
   for (( j = $i; j <= 3; j++ ))
   do
      if [ ${Array[$i]} -lt ${Array[$j]}  ]; then
       t=${Array[$i]}
       Array[$i]=${Array[$j]}
       Array[$j]=$t
      fi
   done
done

echo -e "\nSorted Numbers in Descending Order:"
for (( i=0; i <= 3; i++ ))
do
  echo ${Array[$i]}
done


3. flip_coin_simulation.sh

#!/bin/bash
echo "Welcome to the Flip coin simulation program"
echo "toss time"
counter=0

tails=0;
heads=0;

i=0;
while [ true ]
do

	TossCheck=$((RANDOM%2));
	if [ $TossCheck -eq 0 ];
	then
		tails=$(($tails+1));
		echo Tails;
	else
		heads=$(($heads+1));
		echo Heads;
	fi

	difft=$(($tails-$heads));
	diffh=$(($heads-$tails));

	if [ $tails -ge 21 -a $difft -ge 2 ]
	then
		echo "Tails won by: "$(($tails-$heads));
		break;
	elif [ $heads -ge 21 -a $diffh -ge 2 ]
	then
		echo "Heads won by:" $(($heads-$tails));
		break;
	fi
done

echo "Tails count: "$tails "and Heads count :"$heads;
