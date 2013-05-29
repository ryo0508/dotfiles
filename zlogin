if [ ${COLUMNS} -gt 110 ]; then
  toilet -w120 -f mono12.tlf "Welcome ${USER}"
else
  toilet -w80 -f mono12.tlf "Welcome ${USER}"
fi
