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


doublet_program ()
{
	declare -A doublet
	HHCount=0;
	TTCount=0;
	HTCount=0;
	THCount=0;

	read -p "enter number of times to flip coin = " num
	echo -e
        for i in `seq $num`
        do
                flip1=$((1+RANDOM%2))
		flip2=$((1+RANDOM%2))
		coin=$flip1$flip2
		case $coin in
			11)	((HHCount++))
				doublet[HH]=$HHCount ;;
			12)	((HTCount++))
				doublet[HT]=$HTCount ;;
			21)	((THCount++))
				doublet[TH]=$THCount ;;
			22)	((TTCount++))
				doublet[TT]=$TTCount ;;
		esac
        done

        echo "print doublet dictionary"

        HHPercent=0;
        HTPercent=0;
	THPercent=0;
	TTPercent=0;

	maxPercent=0;
	maxStr=w

        for key in "${!doublet[@]}"
        do
                echo "$key : ${doublet[$key]}"
                if [ "$key" = "HH" ]
                then
                        a=$(awk 'BEGIN {print '${doublet[$key]}' / '$num' }')
                        HHPercent=$(awk 'BEGIN {print '$a' * '100' }')
			if (( ${HHPercent%%.*} > ${maxPercent%%.*} ))
			then
				maxPercent=$HHPercent
				maxStr=HH
			fi
                elif [ "$key" = "HT" ]
		then
                        b=$(awk 'BEGIN {print '${doublet[$key]}' / '$num' }')
                        HTPercent=$(awk 'BEGIN {print '$b' * '100' }')
			if [ ${HTPercent%%.*} -gt ${maxPercent%%.*} ]
                        then
                                maxPercent=$HTPercent
                                maxStr=HT
                        fi
		elif [ "$key" = "TH" ]
		then
                        c=$(awk 'BEGIN {print '${doublet[$key]}' / '$num' }')
                        THPercent=$(awk 'BEGIN {print '$c' * '100' }')
                        if [ ${THPercent%%.*} -gt ${maxPercent%%.*} ]
                        then
                                maxPercent=$THPercent
                                maxStr=TH
                        fi
                else
			d=$(awk 'BEGIN {print '${doublet[$key]}' / '$num' }')
                        TTPercent=$(awk 'BEGIN {print '$d' * '100' }')
                        if [ ${TTPercent%%.*} -gt ${maxPercent%%.*} ]
                        then
                                maxPercent=$TTPercent
                                maxStr=TT
                        fi
		fi
        done

        echo "Percentage of HH = $HHPercent"
        echo "Percentage of HT = $HTPercent"
        echo "Percentage of TT = $TTPercent"
        echo "Percentage of TH = $THPercent"

	echo -e

	echo "Maximum Percentage of $maxStr is $maxPercent "
}
