FROM adoptopenjdk/openjdk11:alpine-jre

ENV JAVA_OPTS="" KEYCLOAK_SSL_VERIFY=true IMPORT_PATH=/config
ENTRYPOINT exec java $JAVA_OPTS -jar /app/keycloak-config-cli.jar $0 $@
COPY ./target/keycloak-config-cli.jar /app/

USER 1001

RUN mvn clean package -Prh-sso -Dkeycloak.version=9.0.15.redhat-00002
