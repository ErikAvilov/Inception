FROM    debian:buster

RUN	apt-get update && apt-get install -y nginx && apt-get install openssl

RUN	mkdir /etc/nginx/ssl
RUN 	openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       		-out /etc/nginx/ssl/eavilov.42.fr.crt \
       		-keyout /etc/nginx/ssl/eavilov.42.fr.key \
       		-subj "/C=FR/ST=Rhone/L=Lyon/O=42/OU=eavilov/CN=eavilov/"

COPY    ./conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
