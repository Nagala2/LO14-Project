liste=$(find $1)
rm A
for i in $liste
do
	dh=$(stat -c "%y" $i | cut -f 1-2 -d " ")
	echo $i
	if [ -d $i ]
	then
		echo $i d >>A
	else
		echo $i $dh >>A
	fi
done
