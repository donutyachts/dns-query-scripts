#!/bin/bash

'
Script receives text file in the INPUT directory with a list of domains as input. Each domain on a separate line.
Script runs dig query.
Script appends output of query to the OUTPUT file for each domain.
Script renames the OUTPUT file, with a timestamp, and moves to the file to the OUTPUT directory.

The dig command options (+nocomments and +nostats) are used so the response is clean.

Permissions needed to execute file: chmod u+x filename.sh
Execute command in terminal while in the same directory as file: ./filename.sh
'

INPUT="../input/sample-domain-list"
OUTPUT="ouput-dig-ns-sample-domain-list"

for domain in `cat $INPUT`
do
  echo $domain
  `dig -t ns $domain +nocomments +nostats >> $OUTPUT`
done

mv $OUTPUT ../output/"$OUTPUT"_$(date +%F_%R).log
