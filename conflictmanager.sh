#Take in argument, the first diff file between the user and the user history ($1), the diff file
#between the server and the user history ($2)

#Remove the exit file
if [ -f synchmodif ]; then
	rm synchmodif
fi

#Use a for function to test if there is conflict between the two diff file
#and ask the user if necessary
k=0
for i in $(cat $1 | cut -f 1 -d " ")
do
	var=$(echo $i | cut -c 2- )
	k=$(($k + 1))

	#Check if there is a conflict between the diff files
	if  grep "$var" $2
	then
		answer=0
		#Check if the conflict is double deletions
		if grep "^-$var" $2
		then
			echo suppression
		else
			#Ask the user to choose between two modifications in conflict
			echo -e  "Veuillez choisir entre 1 et 2 pour continuer\n"
			echo 1 $(sed -n "${k}p" $1)
			echo 2 $(grep "$var" $2) #bugg if grep find two lines in $2
			while [ $answer -ne 1 ] && [ $answer -ne 2 ]
			do
				read answer
				if [ $answer -eq 1 ]
				then
					echo $(sed -n "${k}p" $1) $(echo $1 | rev | cut -c 1) >> synchmodif
				elif [ $answer -eq 2 ]
				then
					echo $(grep "$var" $2) $(echo $2 | rev | cut -c 1)  >> synchmodif
				fi
			done
		fi
	else
		#Write the rest of the lines in the exit file
		echo $(sed -n "${k}p" $1) $(echo $1 | rev | cut -c 1 ) >> synchmodif
	fi
done

for i in $(cat $2 | cut -f 1 -d " ")
do
        var=$(echo $i | cut -c 2- )
        k=$(($k + 1))

        #Check if there is a conflict between the diff files
        if  grep "$var" $1
        then
		j++
	else
		echo $(sed -n "${k}p" $2) $(echo $2 | rev | cut -c 1 ) >> synchmodif
	fi
done

sort -o synchmodif synchmodif 2>/dev/null

#Debugging purposes
echo "fichier synchmodif :"
echo -e "\n"
cat synchmodif 2>/dev/null
