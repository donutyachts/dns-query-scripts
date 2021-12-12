#!/bin/bash

: 'Written: Monday, July 10, 2017.
Script receives text file in the, inputs directory, with list of domains as input.
Script runs dig query.
Script appends output of query to file after query for each domain.
Script renames the output file and moves to the results directory.

Permissions: chmod u+x filename.sh
Execute: ./filename.sh
'

INPUT="../input/sample-domain-list"
OUTPUT="output-dig-at-nameserver-sample-domain-list"
NAMESERVER="ns1.carrierzone.com"

for domain in `cat $INPUT`
do
  echo $domain
  `dig @$NAMESERVER $domain any +nostats >> $OUTPUT`
done

mv $OUTPUT ../output/"$OUTPUT"_$(date +%F_%R).log

