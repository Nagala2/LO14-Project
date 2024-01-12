#The script take in argument $1 the name of the new user

if [ $# -ne 1 ]
then
	echo "usage : init folder_name"
	exit 1
fi

#Check if the tree of the new user already exist, if not create it, and then create the history file old$1
if [ -d $1 ]
then
	touch old$1
else
	mkdir $1
	touch old$1
fi

echo "dossier bien créé, utilisez le scipt synchro.sh pour le remplir"

