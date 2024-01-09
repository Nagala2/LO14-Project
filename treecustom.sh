#take in argument, the path of the main directory ($1) and the name of the exit file ($2)

#remove the exit file
if [ -f $2 ]; then
	rm $2
fi
#create a list of all the folders and files with the find command
liste=$(find $1)
#use the for function to write the tree in a temporary file with the right format
for i in $liste
do
	dh=$(stat -c "%y" $i | cut -f 1-2 -d " ")
	if [ -d $i ]
	then
		#write the folder like : totofolder d
		echo $(echo $i | cut -f 2- -d "/") d >> temp
	else
		#write the file like : totofolder/tatafile yy-mm-dd hh:mm:ss
		echo $(echo $i | cut -f 2- -d "/") $dh >> temp
	fi
done

#remove the first line with the main directory name to be able to compare the exit file
tail -n +2 temp > $2

#option for debugg purposes
echo "Fichier  $2 :"
echo -e "\n"
cat $2
echo -e  "\n"
rm temp
