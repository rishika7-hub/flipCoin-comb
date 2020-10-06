#!/bin/bash

echo "Welcome to Flip coin combination problem"
echo -e

singlet_program ()
{
	declare -A singlet
	headCount=0
	tailCount=0

	read -p "enter number of times to flip coin = " num
	echo -e
	for i in `seq $num`
	do
		flip=$((1+RANDOM%2))
		if [ $flip -eq 1 ]
		then
			((headCount++))
			singlet[H]=$headCount
		else
			((tailCount++))
			singlet[T]=$tailCount
		fi
	done

	echo "print singlet dictionary"

	headsPercent=0;
	tailsPercent=0;
	for key in "${!singlet[@]}"
	do
		echo "$key : ${singlet[$key]}"
		if [ "$key" = "H" ]
		then
			a=$(awk 'BEGIN {print '${singlet[$key]}' / '$num' }')
			headsPercent=$(awk 'BEGIN {print '$a' * '100' }')
		else
			b=$(awk 'BEGIN {print '${singlet[$key]}' / '$num' }')
			tailsPercent=$(awk 'BEGIN {print '$b' * '100' }')
		fi
	done

	echo "Percentage of H = $headsPercent"
	echo "Percentage of T = $tailsPercent"
}
