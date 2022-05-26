FROM alpine:3.15

# Update System and Install Tools
RUN apk update && \
	apk add nginx openssl

# Create the root folder for nginx
RUN mkdir -p /var/www/html/

# change owner of The folder to nginx user
RUN chown -R nginx:nginx /var/lib/nginx && \
	chown -R nginx:nginx /var/www/html

# COPY Files to container
COPY ./conf/nginx.conf /etc/nginx/

# Copy installing script and make it executable
COPY tools/run.sh /
RUN chmod +x ./run.sh

ENTRYPOINT [ "./run.sh" ]
