FROM node:16.20.2-alpine3.18

WORKDIR /app

COPY . /app/

RUN npm install

EXPOSE 3000

# Membuat LABEL agar image yang di build bisa di arahkan ke repository di github yang di tuju.
LABEL org.opencontainers.image.source=https://github.com/yogiflogic/a433-microservices

CMD [ "npm", "start" ]