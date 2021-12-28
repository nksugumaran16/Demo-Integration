#!/bin/bash

#Shell script to build jar file

version=$(sed -n 's/^ *"version" *: *//p' openapi.yaml | grep -oP '"\K[^"]+')



#sudo npm install @openapitools/openapi-generator-cli -g
#sudo openapi-generator-cli version-manager set 5.3.0
#sudo npm install @openapitools/openapi-generator-cli -D


openapi-generator-cli generate -g spring -i openapi.yaml -c config.json -o spring-boot-codegenerator

cd spring-boot-codegenerator

mvn clean test compile package


#rl -vSf -u "admin:password" -X PUT -T target/spring-boot-codegenerator-1.0.0.jar 'http://192.168.1.67:8082/artifactory/artifactsjar/spring-boot-codegenerator-1.0.0.jar'

curl -vSf -u "admin:password" -X PUT -T "target/spring-boot-codegenerator-$version.jar" "http://192.168.1.67:8082/artifactory/artifactsjar-generic-local/spring-boot-codegenerator-$version.jar"

cd ..

mkdir $version

cp openapi.yaml $version/

git branch

git checkout -b openapi$version

git add .

git commit -m "Addded new $version openapi file"

git push https://nksugumaran16:naveenpriya2020@github.com/nksugumaran16/Demo-Integration.git --all
