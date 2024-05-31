#!/bin/bash

'
Script receives text file in the INPUT directory with a list of domains as input.
Script runs dig queries.
Script appends output of query to the OUTPUT file for each domain.
Script renames the OUTPUT file, with a timestamp, and moves to the file to the OUTPUT directory.

Permissions needed to execute file: chmod u+x filename.sh
Execute command in terminal while in the same directory as file: ./filename.sh

Perform following commands on the output file - one after the other - to format the query result onto a single CSV row:
tr "\n" "," < $OUTPUT > $OUTPUT_newfilename
sed -i 's/+++ /\n/g' $OUTPUT_newfilename

If on a Mac, then download gsed and use the gsed command instead of sed.
brew install gnu-sed

=COUNTIF(Mail_Provisioning!A5:A39035,"=A2")
'

INPUT="../input/listofdomainsfordnsquery"
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

mv $OUTPUT ../../migration/"$OUTPUT"_$(date +%F_%R).csv

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

mv $OUTPUT1 ../../migration/"$OUTPUT1"_$(date +%F_%R).csv

for domain in `cat $INPUT`
do
  echo $domain
  printf "$domain" >> $OUTPUT2
  printf "," >> $OUTPUT2
  dig $domain a +short >> $OUTPUT2
  printf "+++ " >> $OUTPUT2
done

mv $OUTPUT2 ../../migration/"$OUTPUT2"_$(date +%F_%R).csv

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

mv $OUTPUT3 ../../migration/"$OUTPUT3"_$(date +%F_%R).csv

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

mv $OUTPUT4 ../../migration/"$OUTPUT4"_$(date +%F_%R).csv

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

mv $OUTPUT5 ../../migration/"$OUTPUT5"_$(date +%F_%R).csv

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

mv $OUTPUT6 ../../migration/"$OUTPUT6"_$(date +%F_%R).csv

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

mv $OUTPUT7 ../../migrationration/"$OUTPUT7"_$(date +%F_%R).csv

