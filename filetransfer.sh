#les commandes sont dans un echo pour eviter quelles s exécutes et modifie l arbre

echo -e "\n"
echo "Commande de transfert :"
while read line
do
	echo -e "\n"
	if [ "$(echo $line | cut -c 1 )" == "+" ]
	then
		if [  "$(echo $line | rev | cut -c 1)" == $1 ]
		then
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
		if [  "$(echo $line | rev | cut -c 1)" == $1 ]
		then
			echo "rm S/$(echo $line | cut -c 2- | cut -f 1 -d " ")"
                        rm S/$(echo $line | cut -c 2- | cut -f 1 -d " ")
		else
			echo "rm $1/$(echo $line | cut -c 2- | cut -f 1 -d " ")"
                        rm $1/$(echo $line | cut -c 2- | cut -f 1 -d " ")
		fi
	elif [ "$(echo $line | cut -c 1)" == "*" ]
	then
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
