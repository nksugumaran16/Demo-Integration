#!/bin/bash

#Shell script to build jar file

version=$(sed -n 's/^ *"version" *: *//p' openapi.yaml | grep -oP '"\K[^"]+')

java -jar openapi-generator-cli-5.2.0.jar generate -g spring -i openapi.yaml -c config.json -o spring-boot-codegenerator

cd spring-boot-codegenerator

mvn clean test compile package


#rl -vSf -u "admin:password" -X PUT -T target/spring-boot-codegenerator-1.0.0.jar 'http://192.168.1.67:8082/artifactory/artifactsjar/spring-boot-codegenerator-1.0.0.jar'

curl -vSf -u "admin:password" -X PUT -T target/spring-boot-codegenerator-2.0.2.jar 'http://192.168.1.67:8082/artifactory/artifactsjar/spring-boot-codegenerator-$version.jar'
