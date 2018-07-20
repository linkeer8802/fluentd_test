FROM vertx/vertx3

ARG JENKINS_AUTH=admin:d9f313987004f9679825eb5a932d396c
ARG JOB_ARTIFACT_URL=http://jenkins.pjsy.com/job/pjsy-platform/lastSuccessfulBuild/artifact

ENV VERTICLE_NAME org.fluent.FluentTest
# Set the location of the verticles
ENV VERTICLE_HOME /usr/verticles

RUN set -x \
    && cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone \
    && dpkg-reconfigure -f noninteractive tzdata


RUN set -x \
	&& cd ${VERTICLE_HOME} \
	&& curl -o package.tar.gz -u $JENKINS_AUTH --progress $JOB_ARTIFACT_URL/fluentd-project/target/fluentd_test-vertx_service.tar.gz \
	&& tar -xzvf package.tar.gz && rm -rf package.tar.gz
	
EXPOSE 8080

# Launch the verticle
WORKDIR $VERTICLE_HOME
ENTRYPOINT ["sh", "-c"]
CMD ["exec vertx run $VERTICLE_NAME -cp $VERTICLE_HOME/*"]