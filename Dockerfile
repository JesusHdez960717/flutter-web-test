FROM nginx:stable-alpine
COPY web/ /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 443
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]