#!/bin/sh

for i in `seq 1 $1`
do
  echo Deleting node$i...
  multipass delete node$i
done

echo Done.
