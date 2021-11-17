#!/bin/bash

java -jar openapi-generator-cli-5.2.0.jar generate -g spring -i openapi.yaml -c config.json -o spring-boot-codegenerator

cd spring-boot-codegenerator

mvn clean test compile package
