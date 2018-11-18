#!/usr/bin/env bash

cd $PROJ_PATH/iWeb Test
mvn clean install

#准备ROOT.war包
cd $PROJ_PATH/iWeb Test/target
mv iWeb.war ROOT.war

#制作新的docker image - iweb
cd $PROJ_PATH/iWeb
docker stop iWebObj
docker rm iWebObj
docker rmi iweb
docker build -t iweb .

#启动docker image, 宿主机暴露端口 8111
docker run --name iWebObj -d -p 8111:8080 iweb



