#!/bin/bash

'
Script received INPUT file containing list of email addresses and outputs a file listing the domains.
'

INPUT="/input/emailaddresses"
OUTPUT="group1emailaddresses"

for domain in `cat $INPUT`
do
  echo $domain
  `grep $domain >> $OUTPUT`
done
