#! /bin/bash

STATUS=`curl --silent -u elastic:changeme http://127.0.0.1:9200/_cat/health`

restartElkStack () {
curl --silent -u elastic:changeme http://127.0.0.1:9200/_cat/health
  /usr/local/bin/docker-compose down
  /usr/local/bin/docker-compose up -d
  counter=0
  retry=30
  while [ ! "$(curl -u elastic:changeme http://127.0.0.1:9200 2> /dev/null)" -a $counter -lt $retry  ]; do
    sleep 1
    ((counter++))
    echo "Waiting for Elk cluster to start. ($counter/$retry)"
  done
  if [ ! "$(curl -u elastic:changeme http://127.0.0.1:9200 2> /dev/null)" ]; then
    echo "Couln't start Elk cluster. Exiting."
    exit 1
  else
    echo "Cluster status: `curl --silent -u elastic:changeme http://127.0.0.1:9200/_cat/health`"
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
