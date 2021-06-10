#!/bin/bash

DOCKER_IMG_AIP2020="adamfgreen/aip2020:latest"
DOCKER_IMG_JAVA="anapsix/alpine-java"

PATH_DOMAIN=/var/data/domain.pddl
PATH_PROBLEM=/var/data/problem.$1.pddl

echo "---------"  
echo "metricff"
echo "---------"
docker run -v `pwd`/data:/var/data ${DOCKER_IMG_AIP2020} metricff -o ${PATH_DOMAIN} -f ${PATH_PROBLEM}
echo "\n"
echo "---------"
echo "SMTPlan"
echo "---------"
docker run -v `pwd`/data:/var/data ${DOCKER_IMG_AIP2020} SMTPlan ${PATH_DOMAIN} ${PATH_PROBLEM}  -v 
echo "\n"
echo "---------"
echo "fd"
echo "---------"
docker run -v `pwd`/data:/var/data ${DOCKER_IMG_AIP2020} fd --alias lama-first  ${PATH_DOMAIN} ${PATH_PROBLEM}
echo "\n"
echo "---------"
echo "HSP"
echo "---------"
docker run -v `pwd`/data:/var/data -v `pwd`/bin/pddl4j-3.8.3.jar:/opt/pddl4j ${DOCKER_IMG_JAVA} java -jar /opt/pddl4j  -o ${PATH_DOMAIN} -f ${PATH_PROBLEM} -s true