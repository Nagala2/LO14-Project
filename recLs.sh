


function parcoursarbre()
{

	nomdufichier=$(ls -l | tail -n +2 | rev | cut -f 1 -d " " | rev)
	for i in $nomdufichier
	do
		if [ -d "$i" ]
		then
			echo dans le dossier $i>> $1
			cd $i
			parcoursarbre $1
			echo sortie du dossier $i>>$1
		else
			ls -l | grep ".*"$i"$" >> $1
		fi
	done
}

path=$(readlink -f A)
rm A
parcoursarbre $path

