#!/bin/sh
while true
do
  eventTime=$(date +"%Y-%m-%d-%T")
  userId=$(( ( RANDOM % 100000 )  + 1 ))
  appId=$(( ( RANDOM % 1000 )  + 1 ))
  appScore=$(( ( RANDOM % 100 )  + 1 ))
  appData=SomeTestData
  echo "$eventTime,$userId,$appId,$appScore,$appData"
  aws kinesis put-record --stream-name iniciativa-big-data --data "$eventTime,$userId,$appId,$appScore,$appData"$'\n' --partition-key $appId --region es-west-1
done