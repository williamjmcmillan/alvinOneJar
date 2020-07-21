#!/bin/sh
git init
git remote add alvinOneGithub https://github.com/williamjmcmillan/alvinOneJar.git
git pull alvinOneGithub master
java --module-path=./lib --add-modules=javafx.controls,javafx.graphics,javafx.fxml -jar AlvinOne.jar 

