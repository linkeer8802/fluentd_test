FROM openjdk

ARG JENKINS_AUTH=admin:d9f313987004f9679825eb5a932d396c
ARG JOB_ARTIFACT_URL=http://jenkins.pjsy.com/job/pjsy-platform/lastSuccessfulBuild/artifact

RUN set -x \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata


RUN set -x \
	&& mkdir -p /deploy \
	&& cd /deploy \
	&& curl -o vertx-service.jar -u ${JENKINS_AUTH} ${JOB_ARTIFACT_URL}/target/fluentd_test-jar-with-dependencies.jar 

EXPOSE 8080
