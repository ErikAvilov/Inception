FROM    debian:buster

RUN		apt-get update && apt-get upgrade -y 
RUN 	apt-get install nginx -y && apt-get install openssl -y

RUN		mkdir -p /etc/nginx/ssl

RUN 	openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
       		-out /etc/nginx/ssl/eavilov.42.fr.crt \
       		-keyout /etc/nginx/ssl/eavilov.42.fr.key \
       		-subj "/C=FR/ST=Rhone/L=Lyon/O=42/OU=eavilov/CN=eavilov.42.fr/"

COPY    ./conf/html.conf /etc/nginx/sites-available/default

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

# Create the ssl directory so you can put your certificate there, it's prettier
# Isn't that complicated, always recreates a new certificate and automatically gives him the arguments
# doing this by hand was painful, thank god there was the -subj flag
# copy your custom conf into the image