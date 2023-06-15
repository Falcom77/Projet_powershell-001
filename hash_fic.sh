#! /bin/bash

extensions="7z zip exe tar.xz tar.bz2e rpm deb"
list_fic=""
taille_list=0

touch SHA256SUMS MD5SUMS

for extension in ${extensions}
do
  list_fic=$(ls | grep -i "${extension}" | xargs)
  taille_list=$(expr length "${list_fic}")
  if [ "${taille_list}" -gt 0 ]
  then
    for fic in ${list_fic}
    do
      echo "Hashage du fichier ${fic} en cours..."
      sha256sum "${fic}" >> SHA256SUMS
      md5sum ${fic} >> MD5SUMS
    done
  fi
done
