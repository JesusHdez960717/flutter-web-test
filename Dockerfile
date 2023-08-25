FROM nginx:1.25.2-alpine

COPY web /usr/share/nginx/html

EXPOSE 80