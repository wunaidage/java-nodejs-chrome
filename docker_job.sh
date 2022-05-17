#!/bin/bash

currentVersion=$(curl https://omahaproxy.appspot.com/linux)
currentMajor=`echo $currentVersion | cut -d. -f1`

lastCheckMajor=$(cat last_check_chrome_version)


if [ $lastCheckMajor != $currentMajor ]
then
cd java-nodejs-chrome

sudo docker build --no-cache -f Dockerfile-J8N14 -t wunaidage/java-nodejs-chrome:J8N14 .
sudo docker build --no-cache -f Dockerfile-J8N16 -t wunaidage/java-nodejs-chrome:J8N16 .
sudo docker build --no-cache -f Dockerfile-J11N14 -t wunaidage/java-nodejs-chrome:J11N14 .
sudo docker build --no-cache -f Dockerfile-J11N16 -t wunaidage/java-nodejs-chrome:J11N16 .
sudo docker build --no-cache -f Dockerfile-J17N14 -t wunaidage/java-nodejs-chrome:J17N14 .
sudo docker build --no-cache -f Dockerfile-J17N16 -t wunaidage/java-nodejs-chrome:J17N16 .

sudo docker push wunaidage/java-nodejs-chrome:J8N14
sudo docker push wunaidage/java-nodejs-chrome:J8N16
sudo docker push wunaidage/java-nodejs-chrome:J11N14
sudo docker push wunaidage/java-nodejs-chrome:J11N16
sudo docker push wunaidage/java-nodejs-chrome:J17N14
sudo docker push wunaidage/java-nodejs-chrome:J17N16

fi

sudo docker system prune -af

cd ~
echo $currentMajor > last_check_chrome_version
