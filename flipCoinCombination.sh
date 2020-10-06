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

triplet_program ()
{
        declare -A triplet
        HHHCount=0;
        TTTCount=0;
        HHTCount=0;
        HTHCount=0;
	HTTCount=0;
	TTHCount=0;
	THTCount=0;
	THHCount=0;

        read -p "enter number of times to flip coin = " num
        echo -e
        for i in `seq $num`
        do
                flip1=$((1+RANDOM%2))
                flip2=$((1+RANDOM%2))
		flip3=$((1+RANDOM%2))
                coin=$flip1$flip2$flip3
                case $coin in
                        111)     ((HHHCount++))
                                triplet[HHH]=$HHHCount ;;
                        222)     ((TTTCount++))
                                triplet[TTT]=$TTTCount ;;
                        112)     ((HHTCount++))
                                triplet[HHT]=$HHTCount ;;
                        121)     ((HTHCount++))
                                triplet[HTH]=$HTHCount ;;
			122)	 ((HTTCount++))
				triplet[HTT]=$HTTCount ;;
			221)	((TTHCount++))
				triplet[TTH]=$TTHCount ;;
			212)	((THTCount++))
				triplet[THT]=$THTCount ;;
			211)	((THHCount++))
				triplet[THH]=$THHCount ;;
                esac
        done

        echo "print triplet dictionary"

        HHHPercent=0;
        TTTPercent=0;

        HHTPercent=0;
        HTHPercent=0;
	HTTPercent=0;

	TTHPercent=0;
	THTPercent=0;
	THHPercent=0;

        maxPercent=0;
        maxStr=w

        for key in "${!triplet[@]}"
        do
                echo "$key : ${triplet[$key]}"
                if [ "$key" = "HHH" ]
                then
                        a=$(awk 'BEGIN {print '${triplet[$key]}' / '$num' }')
                        HHHPercent=$(awk 'BEGIN {print '$a' * '100' }')
                        if (( ${HHHPercent%%.*} > ${maxPercent%%.*} ))
                        then
                                maxPercent=$HHHPercent
                                maxStr=HHH
                        fi
                elif [ "$key" = "TTT" ]
                then
                        b=$(awk 'BEGIN {print '${triplet[$key]}' / '$num' }')
                        TTTPercent=$(awk 'BEGIN {print '$b' * '100' }')
                        if [ ${TTTPercent%%.*} -gt ${maxPercent%%.*} ]
                        then
                                maxPercent=$TTTPercent
                                maxStr=TTT
                        fi
                elif [ "$key" = "HHT" ]
                then
                        c=$(awk 'BEGIN {print '${triplet[$key]}' / '$num' }')
                        HHTPercent=$(awk 'BEGIN {print '$c' * '100' }')
                        if [ ${HHTPercent%%.*} -gt ${maxPercent%%.*} ]
                        then
                                maxPercent=$HHTPercent
                                maxStr=HHT
                        fi
                elif [ "$key" = "HTH" ]
                then
                        b=$(awk 'BEGIN {print '${triplet[$key]}' / '$num' }')
                        HTHPercent=$(awk 'BEGIN {print '$b' * '100' }')
                        if [ ${HTHPercent%%.*} -gt ${maxPercent%%.*} ]
                        then
                                maxPercent=$HTHPercent
                                maxStr=HTH
                        fi
                elif [ "$key" = "HTT" ]
                then
                        c=$(awk 'BEGIN {print '${triplet[$key]}' / '$num' }')
                        HTTPercent=$(awk 'BEGIN {print '$c' * '100' }')
                        if [ ${HTTPercent%%.*} -gt ${maxPercent%%.*} ]
                        then
                                maxPercent=$HTTPercent
                                maxStr=HTT
                        fi
                elif [ "$key" = "TTH" ]
                then
                        b=$(awk 'BEGIN {print '${triplet[$key]}' / '$num' }')
                        TTHPercent=$(awk 'BEGIN {print '$b' * '100' }')
                        if [ ${TTHPercent%%.*} -gt ${maxPercent%%.*} ]
                        then
                                maxPercent=$TTHPercent
                                maxStr=TTH
                        fi
                elif [ "$key" = "THT" ]
                then
                        c=$(awk 'BEGIN {print '${triplet[$key]}' / '$num' }')
                        THTPercent=$(awk 'BEGIN {print '$c' * '100' }')
                        if [ ${THTPercent%%.*} -gt ${maxPercent%%.*} ]
                        then
                                maxPercent=$THTPercent
                                maxStr=THT
                        fi

                else
                        d=$(awk 'BEGIN {print '${triplet[$key]}' / '$num' }')
                        THHPercent=$(awk 'BEGIN {print '$d' * '100' }')
                        if [ ${THHPercent%%.*} -gt ${maxPercent%%.*} ]
                        then
                                maxPercent=$THHPercent
                                maxStr=THH
                        fi
                fi
        done

        echo "Percentage of HHH = $HHHPercent"
	echo -e
        echo "Percentage of TTT = $TTTPercent"
        echo -e
        echo "Percentage of HHT = $HHTPercent"
	echo -e
        echo "Percentage of HTH = $HTHPercent"
        echo -e
        echo "Percentage of HTT = $HTTPercent"
        echo -e
        echo "Percentage of TTH = $TTHPercent"
        echo -e
        echo "Percentage of THT = $THTPercent"
        echo -e
        echo "Percentage of THH = $THHPercent"


        echo -e

        echo "Maximum Percentage of $maxStr is $maxPercent "


}

read -p "choose 1) singlet 2) doublet 3) triplet ==>  " number
case $number in
        1) singlet_program ;;
        2) doublet_program ;;
	3) triplet_program ;;
esac
