FROM nginx:1.25.2-alpine

COPY web/*.* /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/

EXPOSE 80
