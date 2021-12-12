#!/bin/bash

: 'Written: Monday July 14, 2020. 
Script receives text file in the, inputs directory, with list of domains as input. 
Script runs dig query for NS then MX then A.
Script appends output of query to file after query for each domain.
Script renames the output file and moves to the results directory.

Permissions: chmod u+x filename.sh
Execute: ./filename.sh

Perform following commands on output file to format results on single CSV row:
tr "\n" "," < $OUTPUT > $OUTPUT_newfilename
sed -i 's/+++ /\n/g' $OUTPUT_newfilename

=COUNTIF(Mail_Provisioning!A5:A39035,"=A2")
'

INPUT="../input/rise/20200713-domains-rise-broadband"
OUTPUT="output-dig-ns"
OUTPUT1="output-dig-mx"
OUTPUT2="output-dig-a"
OUTPUT3="output-dig-pop"
OUTPUT4="output-dig-imap"
OUTPUT5="output-dig-mail"
OUTPUT6="output-dig-smtp"
OUTPUT7="output-dig-webmail"

printf "###### START NS ######"
printf "\n"

for domain in `cat $INPUT`
do
  echo $domain
  printf "$domain" >> $OUTPUT
  printf "," >> $OUTPUT
  dig $domain ns +short >> $OUTPUT
  printf "+++ " >> $OUTPUT
done

printf "\n"
printf "###### START MX ######"
printf "\n"

mv $OUTPUT ../../strfkd.com/mig/"$OUTPUT"_$(date +%F_%R).csv

for domain in `cat $INPUT`
do
  echo $domain
  printf "$domain" >> $OUTPUT1
  printf "," >> $OUTPUT1
  dig $domain mx +short >> $OUTPUT1
  printf "+++ " >> $OUTPUT1
done

printf "\n"
printf "###### START A ######"
printf "\n"

mv $OUTPUT1 ../../strfkd.com/mig/"$OUTPUT1"_$(date +%F_%R).csv

for domain in `cat $INPUT`
do
  echo $domain
  printf "$domain" >> $OUTPUT2
  printf "," >> $OUTPUT2
  dig $domain a +short >> $OUTPUT2
  printf "+++ " >> $OUTPUT2
done

mv $OUTPUT2 ../../strfkd.com/mig/"$OUTPUT2"_$(date +%F_%R).csv

printf "\n"
printf "###### START POP.DOMAIN.TLD ######"
printf "\n"

for domain in `cat $INPUT`
do
  echo $domain
  printf "$domain" >> $OUTPUT3
  printf "," >> $OUTPUT3
  dig pop.$domain a +short >> $OUTPUT3
  printf "+++ " >> $OUTPUT3 
done

mv $OUTPUT3 ../../strfkd.com/mig/"$OUTPUT3"_$(date +%F_%R).csv

printf "\n"
printf "###### START IMAP.DOMAIN.TLD ######"
printf "\n"

for domain in `cat $INPUT`
do
  echo $domain
  printf "$domain" >> $OUTPUT4
  printf "," >> $OUTPUT4
  dig imap.$domain a +short >> $OUTPUT4
  printf "+++ " >> $OUTPUT4
done

mv $OUTPUT4 ../../strfkd.com/mig/"$OUTPUT4"_$(date +%F_%R).csv

printf "\n"
printf "###### START MAIL.DOMAIN.TLD ######"
printf "\n"

for domain in `cat $INPUT`
do
  echo $domain
  printf "$domain" >> $OUTPUT5
  printf "," >> $OUTPUT5
  dig mail.$domain a +short >> $OUTPUT5
  printf "+++ " >> $OUTPUT5
done

mv $OUTPUT5 ../../strfkd.com/mig/"$OUTPUT5"_$(date +%F_%R).csv

printf "\n"
printf "###### START SMTP.DOMAIN.TLD ######"
printf "\n"

for domain in `cat $INPUT`
do
  echo $domain
  printf "$domain" >> $OUTPUT6
  printf "," >> $OUTPUT6
  dig smtp.$domain a +short >> $OUTPUT6
  printf "+++ " >> $OUTPUT6
done

mv $OUTPUT6 ../../strfkd.com/mig/"$OUTPUT6"_$(date +%F_%R).csv

printf "\n"
printf "###### START WEBMAIL.DOMAIN.TLD ######"
printf "\n"

for domain in `cat $INPUT`
do
  echo $domain
  printf "$domain" >> $OUTPUT7
  printf "," >> $OUTPUT7
  dig webmail.$domain a +short >> $OUTPUT7
  printf "+++ " >> $OUTPUT6
done

mv $OUTPUT7 ../../strfkd.com/mig/"$OUTPUT7"_$(date +%F_%R).csv

