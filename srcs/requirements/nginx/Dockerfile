# Description: Nginx Dockerfile

# pull the base image
FROM debian:bookworm

# update and upgrade the system
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y nginx openssl vim

RUN mkdir -p /etc/nginx/ssl

# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \

RUN openssl req -x509 -nodes -keyout /etc/nginx/ssl/ohachami.42.key \
     -out /etc/nginx/ssl/ohachami.42.crt \
     -subj "/C=MA/ST=Tetouan/L=MED/O=1337/CN=ohachami.42.fr"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

# COPY index.html /var/www/html

# # open the port on which the container will exchange traffic
EXPOSE 443

RUN chmod 755 /var/www/html

RUN chown -R www-data:www-data /var/www/html

# define the command to run when the container starts
CMD ["nginx", "-g", "daemon off;"]
