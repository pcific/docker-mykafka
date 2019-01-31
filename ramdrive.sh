#!/bin/sh

RAMDIR=/ram
MKVOL(){
  VOLPATH=$1
  echo "make vol ${VOLPATH} ... "
  sudo umount ${VOLPATH} 2>/dev/null
  mkdir -p ${VOLPATH} 2>/dev/null && chmod 777 ${VOLPATH} 
  sudo mount -t tmpfs -o size=1024M tmpfs ${VOLPATH}
}

for N in `seq 50 54`
do
  MKVOL ${RAMDIR}/${N} 
done

echo ---------------------------------
df -h |grep -e Filesystem -e "${RAMDIR}"
echo ---------------------------------

