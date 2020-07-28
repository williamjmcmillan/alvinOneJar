#!/bin/sh


if ! which mariadb-server-10.0
then
   echo "NO DATABASE"
   echo "...INSTALLING"
   sudo apt-get install mariadb-server-10.0
   wait
fi
if ! which pi4j
then
   echo "INSTALLING PI4J"
   sudo dpkg -i ./install/pi4j-1.2.deb
   wait
fi
if -d ./.git
then
   if git remote | grep "alvinOneGithub"!="alvinOneGithub"
   then
     git remote add alvinOneGithub https://github.com/williamjmcmillan/alvinOneJar.git
     git clone alvinOneGithub master
     wait
     java --module-path=./lib --add-modules=javafx.controls,javafx.graphics,javafx.fxml -jar AlvinOne.jar 
   elif git remote | grep "alvinOneGithub"="alvinOneGitHub"
   then
     git pull alvinOneGithub Master
     wait
     java --module-path=./lib --add-modules=javafx.controls,javafx.graphics,javafx.fxml -jar AlvinOne.jar
   fi
elif  ! -d ./.git
then
   git init
   git remote add alvinOneGithub https://github.com/williamjmcmillan/alvinOneJar.git   
   git clone alvinOneGithub master
   wait
   java --module-path=./lib --add-modules=javafx.controls,javafx.graphics,javafx.fxml -jar AlvinOne.jar
elif $1="now" || $1="-n" || $1="-now"
then
   java --module-path=./lib --add-modules=javafx.controls,javafx.graphics,javafx.fxml -jar AlvinOne.jar
fi
exit 0;
