#!/bin/bash
set -xe
CODE_TAG=${BUILD_ID}
#REGISTRY_HOST从环境变量中读取
REGISTRY_HOST=${ENV_REGISTRY_HOST}
JOB_ARTIFACT_URL=${BUILD_URL}"artifact"
JENKINS_AUTH="pjsy:e35173d57bc1a1acb2ed45f9f5b1e667"

echo "building image from jenkins..."
docker build --no-cache --add-host jenkinsci.pjsy.com:192.168.40.210 --build-arg JOB_ARTIFACT_URL=${JOB_ARTIFACT_URL} \
 --build-arg JENKINS_AUTH=${JENKINS_AUTH} \
 -t ${REGISTRY_HOST}/vertx-service:${CODE_TAG} .

echo "pushing image to registry..."
docker push ${REGISTRY_HOST}/vertx-service:${CODE_TAG}