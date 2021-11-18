#!/bin/bash

java -jar openapi-generator-cli-5.2.0.jar generate -g spring -i openapi.yaml -c config.json -o spring-boot-codegenerator

cd spring-boot-codegenerator

mvn clean test compile package

curl -v --user admin:password --data-binary @spring-boot-codegenerator/target/spring-boot-codegenerator-1.0.0.jar -X PUT "http://192.168.1.67:8082/artifactory/artifactsjar"
