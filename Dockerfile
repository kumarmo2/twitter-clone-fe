FROM node:12-alpine3.12 as builder

WORKDIR /app

COPY . .

# RUN npm install && npm run build-dev

RUN npm install

RUN ["sh", "./build-docker.sh", ".", "./public", "dev"]

FROM nginx:1.19.6-alpine

WORKDIR /usr/share/nginx/html/public

COPY --from=builder /app/public .
COPY --from=builder /app/nginx.docker.conf .

EXPOSE 7000

ENTRYPOINT ["nginx", "-c", "/usr/share/nginx/html/public/nginx.docker.conf", "-g", "daemon off;"]