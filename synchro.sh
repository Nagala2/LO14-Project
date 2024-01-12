#The srcipt take in argument ($1) the name of the user's tree (A,B,W)

#We check if the user past an argument
if [ $# -ne 1 ]; then
    echo "usage : synchro nom_dossier"
    exit 1
fi

#Check if the user's directory exist and then start the synchronization
if [ -d $1 ]; then
   bash treecustom.sh $1 tree$1
   bash treecustom.sh S treeS
   bash diffcustom.sh old$1 tree$1
   bash diffcustom.sh old$1 treeS
   bash conflictmanager.sh diffold$1tree$1 diffold$1treeS
   bash filetransfer.sh $1
   bash treecustom.sh $1 old$1

#Remove all the files used for the synch
   rm tree$1 2>/dev/null
   rm treeS 2>/dev/null
   rm diffold$1tree$1 2>/dev/null
   rm diffold$1treeS 2>/dev/null
   rm synchmodif 2>/dev/null

    echo "Synchro terminée"
else
    echo "usage : ./synchro.sh  ${{nom_dossier}}"
    exit 1
fi
