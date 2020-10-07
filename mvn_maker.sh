#!/bin/bash
#filename: mvn_yao.sh
#usage to build:  ./mvn_yao [-build|-B|-b]
#usage to clean:  ./mvn_yao [-clean|-C|-c]

wsobj=../WSObject
mapbox=../mapbox-utils
webcore=../JlimoWeb_Core
gui=../JlimoGui
designer=../JlimoDesigner
dbaccess=../JlimoDBAccess
datalib=../JlimoDataLibrary

modules=($wsobj $mapbox $designer $dbaccess $datalib $gui $webcore)
len=${#modules[*]}

function mvn_build() {
    local i=0
    while [ $i -lt "$len" ]; do
      mvn -f "${modules[$i]}" -Dmaven.test.skip=true clean install
      i=$((i+1))
    done

    mvn -Dmaven.test.skip=true clean package
}

function mvn_clean() {
    local i=0
    while [ $i -lt "$len" ]; do
      mvn -f "${modules[$i]}" clean
      i=$((i+1))
    done

    mvn clean
}

case $1 in
  -build|-Build|-B|-b ) mvn_build;;
  -clean|-Clean|-C|-c ) mvn_clean;;
esac
