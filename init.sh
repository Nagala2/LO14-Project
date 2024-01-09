if [ $# -ne 1 ]
then
	echo "usage : init folder_name"
	exit 1
fi

if [ -d $1 ]
then
	touch old$1
else
	mkdir $1
	touch old$1
fi

echo "dossier bien créé, utilisez le scipt synchro.sh pour le remplir"

