FROM debian:bookworm

RUN apt-get update -y && apt-get upgrade -y && apt-get install -y nginx openssl

RUN mkdir -p /etc/nginx/ssl

# RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \

RUN openssl req -x509 -nodes -keyout /etc/nginx/ssl/ohachami.42.key \
     -out /etc/nginx/ssl/ohachami.42.crt \
     -subj "/C=MA/ST=Tetouan/L=MED/O=1337/CN=ohachami.42.fr"

RUN mkdir -p /var/run/nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 443

RUN  mkdir -p /var/www/html/wordpress && chmod 755 /var/www/html/wordpress

RUN chown -R root:root /var/www/html/wordpress

CMD ["nginx", "-g", "daemon off;"]
