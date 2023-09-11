#menggunakan base image dari nodejs versi 16.20.2-alpine3.18 sebagai depedency app
FROM node:16.20.2-alpine3.18

#membuat working directory sebagai letak app
WORKDIR /app

#mengcopy semua file project dari lokal ke working directory image yang sudah di buat pada step sebelumnya
COPY . /app/

#menginstall package/modul nodejs dari repository
RUN npm install

#mengekspose port app agar app bisa di akses secara public
EXPOSE 3000

# Membuat LABEL agar image yang di build bisa di arahkan ke repository di github yang di tuju.
LABEL org.opencontainers.image.source=https://github.com/yogiflogic/a433-microservices

#menjalakan app
CMD [ "npm", "start" ]