#!/bin/bash
rm *trim* *zip errors -f

printf "Test 1: Doing straight trimming\n" |tee -a errors
../preprocess_illumina.pl -paired -noadaptor test?.fastq.bz2 2>> errors

rm *trim* *zip -f
printf "\n\nTest 2: Using also Trimmomatic and adaptor searching\n" |tee -a errors
../preprocess_illumina.pl -paired test?.fastq.bz2 2>>errors

rm *trim* *zip -f
printf "\n\nTest 3: Doing straight trimming with deduplication\n" |tee -a errors
../preprocess_illumina.pl -paired -dedup -noadaptor test?.fastq.bz2 2>> errors

printf "\n\nDONE! See errors file for any errors.\n"
