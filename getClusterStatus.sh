#! /bin/bash

STATUS=`curl --silent -u elastic:changeme http://127.0.0.1:9200/_cat/health`

restartElkStack () {
  sudo /usr/local/bin/docker-compose down
  sudo /usr/local/bin/docker-compose up -d
  sleep 15
  if [ $? -ne 0 ]
    then
      echo "ELK restart failed..."
 fi
}

checkClusterStatus() {
if [ `echo ${STATUS} | grep docker-cluster | wc -l` -ne 1 ]
  then
    echo "ELK Cluster is not running..."
    echo "Attempting to restart ELK stack..."
    restartElkStack
  else
    echo "Cluster ${STATUS}"
fi
}

checkClusterStatus
