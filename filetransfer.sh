#The sciprt take in agrument the name of the user's directory ($1)

echo -e "\n"
echo "Commande de transfert :"
while read line
do
	echo -e "\n"

	#The script check the first character of eatch line to execute the assosiate command
	if [ "$(echo $line | cut -c 1 )" == "+" ]
	then
		if [  "$(echo $line | rev | cut -c 1)" == $1 ]
		then
			#Check if the name is a folder and copy past the file/folder from one tree to the other
			if [ $(echo $line | cut -f 2 -d " ") == "d" ]
			then
				echo "mkdir $2/$(echo $line | cut -c 2- | cut -f 1 -d " ")"
                                mkdir S/$(echo $line | cut -c 2- | cut -f 1 -d " ")
			else
				echo "cp $1/$(echo $line | cut -c 2- | cut -f 1 -d " ") S/$(echo $line | cut -c 2- | cut -f 1 -d " ")"
                        	cp $1/$(echo $line | cut -c 2- | cut -f 1 -d " ") S/$(echo $line | cut -c 2- | cut -f 1 -d " ")
			fi
		else

			if [ $(echo $line | cut -f 2 -d " ") == "d" ]
                        then
                                echo "mkdir S/$(echo $line | cut -c 2- | cut -f 1 -d " ")"
                                mkdir $1/$(echo $line | cut -c 2- | cut -f 1 -d " ")
                        else
                        	echo "cp S/$(echo $line | cut -c 2- | cut -f 1 -d " ") $1/$(echo $line | cut -c 2- | cut -f 1 -d " ")"
                        	cp S/$(echo $line | cut -c 2- | cut -f 1 -d " ") $1/$(echo $line | cut -c 2- | cut -f 1 -d " ")
			fi
		fi
	elif [ "$(echo $line | cut -c 1)" == "-" ]
	then

                #Remove the file/folder in the tree
		if [  "$(echo $line | rev | cut -c 1)" == $1 ]
		then
			echo "rm S/$(echo $line | cut -c 2- | cut -f 1 -d " ")"
                        rm -r S/$(echo $line | cut -c 2- | cut -f 1 -d " ") 2>/dev/null
		else
			echo "rm $1/$(echo $line | cut -c 2- | cut -f 1 -d " ")"
                        rm $1/$(echo $line | cut -c 2- | cut -f 1 -d " ") 2>/dev/null
		fi
	elif [ "$(echo $line | cut -c 1)" == "*" ]
	then

                #Check if the name is a folder, remove the file/folder before copy past the new file/folder in the tree
		if [ "$(echo $line | rev | cut -c 1)" == $1 ]
		then
			echo "rm S/$(echo $line | cut -c 2- | cut -f 1 -d " ")"
			echo "cp $1/$(echo $line | cut -c 2- | cut -f 1 -d " ") S/$(echo $line | cut -c 2- | cut -f 1 -d " ")"
                        rm S/$(echo $line | cut -c 2- | cut -f 1 -d " ")
                        cp $1/$(echo $line | cut -c 2- | cut -f 1 -d " ") S/$(echo $line | cut -c 2- | cut -f 1 -d " ")
		else
			echo "rm $1/$(echo $line | cut -c 2- | cut -f 1 -d " ")"
			echo "cp S/$(echo $line | cut -c 2- | cut -f 1 -d " ") $1/$(echo $line | cut -c 2- | cut -f 1 -d " ")"
                        rm $1/$(echo $line | cut -c 2- | cut -f 1 -d " ")
                        cp S/$(echo $line | cut -c 2- | cut -f 1 -d " ") $1/$(echo $line | cut -c 2- | cut -f 1 -d " ")
		fi
	fi
done < synchmodif
