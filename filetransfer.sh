#les commandes sont dans un echo pour eviter quelles s exécutes et modifie l arbre
while read line
do
	echo $line | cut -c 1
	if [ "$(echo $line | cut -c 1 )" == "+" ]
	then
		if [  "$(echo $line | rev | cut -c 1)" == $1 ]
		then
			echo $1 $(echo $line | cut -c 2- | cut -f 1 -d " ")
			#ça fonctionne pas je suis obligé de mettre echo en commentaire
			#echo "cp arbre_$1/$(cut -c 2- $line | cut -f 1 -d " ") arbre_S/$(cut -c 2- $line | cut -f 1 -d " ")"
		else
			echo hallo
                        #echo "cp arbre_S/$(cut -c 2- $line | cut -f 1 -d " ") arbre_$1/$(cut -c 2- $line | cut -f 1 -d " ")"
		fi
	elif [ "$(echo $line | cut -c 1)" == "-" ]
	then
		if [  "$(echo $line | rev | cut -c 1)" == $1 ]
		then
			echo "rm S/$(echo $line | cut -c 2- | cut -f 1 -d " ")"
		else
			echo "rm $1/$(echo $line | cut -c 2- | cut -f 1 -d " ")"
		fi
	elif [ "$(echo $line | cut -c 1)" == "*" ]
	then
		if [ "$(echo $line | rev | cut -c 1)" == $1 ]
		then
			echo "rm S/$(echo $line | cut -c 2- | cut -f 1 -d " ")"
			echo "cp $1/$(echo $line | cut -c 2- | cut -f 1 -d " ") S/$(echo $line | cut -c 2- | cut -f 1 -d " ")"
		else
			echo "rm $1/$(echo $line | cut -c 2- | cut -f 1 -d " ")"
			echo "cp S/$(echo $line | cut -c 2- | cut -f 1 -d " ") $1/$(echo $line | cut -c 2- | cut -f 1 -d " ")"
		fi
	fi
done < synchmodif
