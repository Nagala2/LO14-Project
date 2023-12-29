
#take the two masters files in arguments (like A,B or S) in order to compare it

#create a temporary file with only line like : +./toto/tata yy-mm-dd hh:mm:ss or -./ :

diff -u $1 $2 | grep "^[+-].*" | tail -n +3 > temp
sort -o temp temp


#format the temp file in a temp2 file to be useable in a for function :

cut -c 2- temp | cut -f 1 -d " " > temp2

#searche for eatch line if the former line is the same
#if two lines are the same we remove them and write a *toto in diffA :

iminusone="_"
rm diff$1$2
for i in  $(cat temp2)
do
	if [ $i = $iminusone ]
	then
		echo *$(grep "^\+$i" temp | cut -c 2-) >> diff$1$2
		val1=$(grep -n "^.$i" temp | cut -c 1 | head -n 1 )
		sed -i "${val1}d" temp
		sed -i "${val1}d" temp
	fi
	iminusone=$i
done

#write the rest of the temp file in diffA :

cat temp >> diff$1$2
sort -o diff$1$2 diff$1$2
rm temp
rm temp2

#for debugging :

cat diff$1$2
