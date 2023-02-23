#!/bin/bash

'
Script receives text file in the INPUT directory with a list of domains as input.
Script runs dig query.
Script appends output of query to the file for each domain.
Script renames the output file, with a timestamp, and moves to the file to the OUTPUT directory.

Permissions needed to execute file: chmod u+x filename.sh
Execute command in terminal while in the same directory as file: ./filename.sh
'

INPUT="../input/sample-domain-list"
OUTPUT="output-dig-axfr-sample-domain-list"
NAMESERVER="ns1.carrierzone.com"

for domain in `cat $INPUT`
do
  echo $domain
  `dig @$NAMESERVER $domain axfr +nostats >> $OUTPUT`
done

mv $OUTPUT ../output/"$OUTPUT"_$(date +%F_%R).log

