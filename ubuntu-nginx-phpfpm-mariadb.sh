#!/bin/bash
# docker-scripts v0.1 

DS_PATH=~/Docker
DS_NET=`docker network ls | grep ds_net`
DS_NGINX=`docker ps -a | grep ds_nginx`
DS_POSTGRES=`docker ps -a | grep ds_postgres`
DS_MARIADB=`docker ps -a | grep ds_mariadb`

create-ds-network() {
	docker network create --driver bridge --subnet 172.200.0.0/16 lexp_net > /dev/null 2>&1
}

create-lexp-web() {
	docker run --rm --net lexp_net --name lexp_web \
		-v ${PROJECT_PATH}/config/lexp/nginx:/etc/nginx \
		-v ${PROJECT_PATH}/www:/var/www nginx > /dev/null 2>&1 &
		sleep 2
}
