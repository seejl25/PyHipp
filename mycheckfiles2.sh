#!/bin/bash

echo "Number of hkl files"
find . -name "*.hkl" | grep -v -e spiketrain -e mountains | wc -l

echo "Number of mda files"
find mountains -name "firings.mda" | wc -l
echo " "

echo "#==========================================================="
echo "Start Times"
head -n 1 -v rplpl-slurm*.out
echo " "
head -n 1 -v rplspl-slurm*.out


echo "End Times"
tail -n 2 -v rplpl-slurm*.out
aws sns publish --topic-arn arn:aws:sns:ap-southeast-1:225989329650:awsnotify --message "RPLParallelJobDone"
echo " "

tail -n 2 -v rplspl-slurm*.out
aws sns publish --topic-arn arn:aws:sns:ap-southeast-1:225989329650:awsnotify --message "RPLSplitJobDone"

echo "#==========================================================="
