FROM alpine:3.15

# Update System and Install Tools
RUN apk update && \
	apk add mariadb mariadb-common mariadb-client openrc

# start openrc
RUN openrc && \
	touch /run/openrc/softlevel

COPY tools/run.sh .
RUN chmod +x /run.sh

ENTRYPOINT [ "./run.sh" ]
