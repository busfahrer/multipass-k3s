#!/bin/sh

COUNT=${1:-3}
echo Using count of $COUNT

for i in `seq 1 $1`
do
  echo Deleting node$i...
  multipass delete node$i
done

echo Done.
