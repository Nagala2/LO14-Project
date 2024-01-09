
if [ $# -ne 1 ]; then
    echo "usage : synchro nom_dossier"
    exit 1
fi
if [ -d $1 ]; then
    treecustom $1 tree$1
    treecustom S treeS
    diffcustom old$1 tree$1
    diffcustom old$1 treeS
    conflictmanager diffold$1tree$1 diffold$1treeS
    filetransfer $1
    cat tree$1 > old$1
    echo "Synchro terminée"
else
    echo "usage synchro nom_dossier"
    exit 1
fi