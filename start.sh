#!/bin/bash

# cp -r /elms /usr/src/app
mvn -f /usr/src/app/pom.xml clean package
cp /usr/src/app/target/elms.war /elms-war