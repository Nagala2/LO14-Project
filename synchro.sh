
if [ $# -ne 1 ]; then
    echo "usage : synchro nom_dossier"
    exit 1
fi
if [ -d $1 ]; then
   bash treecustom.sh $1 tree$1
   bash treecustom.sh S treeS
   bash diffcustom.sh old$1 tree$1
   bash diffcustom.sh old$1 treeS
   bash conflictmanager.sh diffold$1tree$1 diffold$1treeS
   bash filetransfer.sh $1
   bash treecustom.sh $1 old$1
    echo "Synchro terminée"
else
    echo "usage synchro nom_dossier"
    exit 1
fi
