#!/bin/bash

: 'Written: Sunday July 20, 2020
'

INPUT="/input/emailaddresses"
OUTPUT="group1emailaddresses"

for domain in `cat $INPUT`
do
  echo $domain
  `grep $domain >> $OUTPUT`
done
