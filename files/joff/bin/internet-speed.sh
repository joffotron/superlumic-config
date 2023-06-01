#!/bin/bash
STATS=`speedtest --json --server 6141 --bytes | jq '.ping,.download,.upload'`

PING=`/bin/echo ${STATS} | /usr/bin/awk '{printf "%d", $1}'`
DOWNLOAD=`/bin/echo ${STATS} | /usr/bin/awk '{printf "%d" ,$2}'`
UPLOAD=`/bin/echo ${STATS} | /usr/bin/awk '{printf "%d", $3}'`

NOW=`date`

echo "${NOW}, ${PING}, ${DOWNLOAD}, ${UPLOAD}" >> internet-stats.csv

