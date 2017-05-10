# elkStack

# SUMMARY
 This assumes that you already have docker and docker-compose installed.
 Running docker-compose will spin up 3 dockers, to make up an Elk stack for
 testing.  These dockers are pulled down from docker hub using the "latest" 
 tag.  You can also use getClusterStatus.sh to see the current status
 of the Elk stack at anytime.  If the stack is not running, it will make
 one attempt to start the stack.  You can also tie this simple script
 to a Jenkins job to log the status on this stack if required.  The 
 default userid:password is elastic:changeme as set by the X-PACK 
 security module installed by default.

# PORTS USED
 kibana - 5601
 elasticsearch - 9200
 logstash - 5000

# FUTURE DEVELOPMENT
 Build Dockerfile created so we're not reliant upon Elastic.co images
 Create scripts for building images / running docker-compose
 Implement remote image management like Registry or Artifactory for image storage
 Create build script for Dockerfile build - script created but Dockerfile still being worked on

