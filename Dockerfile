FROM node:14.21-alpine as builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
# Membuat LABEL agar image yang di build bisa di arahkan ke repository di github yang di tuju.
LABEL org.opencontainers.image.source=https://github.com/yogiflogic/a433-microservices
EXPOSE 8000
CMD [ "npm", "run", "serve" ]
