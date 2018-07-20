#!/bin/bash
set -xe

CODE_TAG=${BUILD_ID}
STACK_NAME="microservice"
LB_STACK_NAME="app_lb_proxy"
REGISTRY_HOST=${ENV_REGISTRY_HOST}
PROXY_NGINX_CONF=${STACK_NAME}"_proxy_nginx.conf"

export CODE_TAG REGISTRY_HOST

echo ">>>>>>>>deploy stack pjsy_platform<<<<<<<<<<<"
docker stack deploy -c docker-compose.yml --with-registry-auth ${STACK_NAME}

#echo ">>>>>>add or update proxy_nginx.conf files to lb_proxy service<<<<<<<<<"
#docker service update -d --config-rm ${PROXY_NGINX_CONF} ${LB_STACK_NAME}
#set +xe
#docker config rm ${PROXY_NGINX_CONF}
#set -xe
#docker config create ${PROXY_NGINX_CONF} ./conf/apiservice.nginx.conf
#docker service update -d \
#--config-add source=${PROXY_NGINX_CONF},target=/etc/nginx/conf.d/${PROXY_NGINX_CONF} ${LB_STACK_NAME}
