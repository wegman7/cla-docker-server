#!/bin/bash

mvn -f /usr/src/app/pom.xml clean package
cp /usr/src/app/target/elms.war /elms-war