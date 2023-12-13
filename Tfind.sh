

liste=$(find $1)
rm A
for i in $liste
do
	dh=$(stat -c "%y" $i | cut -f 1-2 -d " ")
	echo $i $dh >>A
done
