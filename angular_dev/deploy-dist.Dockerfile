FROM nginx:1-alpine

COPY ./dist/angular_dev /usr/share/nginx/html
