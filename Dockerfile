#FROM httpd:latest
#COPY .  /usr/local/apache2/htdocs/

FROM nginx:alpine
COPY ./* /usr/share/nginx/html/