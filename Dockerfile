# pull image node versi 14 dari docker hub.
FROM node:14.21.3-alpine3.17

# membuat working directory.
WORKDIR /app

# Copy seluruh source code ke working directory di container.
COPY . .

# Membuat Environment / Menentukan agar aplikasi berjalan dalam production mode dan menggunakan container bernama item-dbsebagai database host.
ENV NODE_ENV=production DB_HOST=item-db

# Menginstal dependencies untuk production dan kemudian build aplikasi. 
RUN npm install --production --unsafe-perm && npm run build

# Ekspos bahwa port yang digunakan oleh aplikasi adalah 8080.
EXPOSE 8080

# Membuat LABEL agar image yang di build bisa di arahkan ke repository di github yang di tuju.
LABEL org.opencontainers.image.source=https://github.com/yogiflogic/a433-microservices

# Menjalankan server dengan perintah npm start saat container diluncurkan.
CMD [ "npm", "start" ]
