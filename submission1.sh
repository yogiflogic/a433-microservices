# kriteria 1
# link hasil fork repository dari dicoding
https://github.com/yogiflogic/a433-microservices/tree/proyek-pertama

# kriteria 2
# Script Membuat Docker Image
FROM node:14

WORKDIR /app

COPY . .

ENV NODE_ENV=production DB_HOST=item-db

RUN npm install --production --unsafe-perm && npm run build

EXPOSE 8080

CMD [ "start", "npm" ]

#  Membuat Docker Images
docker build -t item-app:v1 .

# Melihat list docker images di local
docker images

# Mengubah nama images sesuai dengan dockerhub / GitHub Packages
docker tag localhost:5000/nginx-hello-world:latest <username>/nginx-hello-world:v1

sudo docker tag node:14-alpine yogiflogic/nodedicoding

# login ke docker hub / GitHub Packages
docker login

# Mengunggah image ke Docker Hub
docker tag item-app:v1 yogiflogic/item-app:v1
docker push yogiflogic/imagedicoding


# kriteria 3 (script file ini)

# kriteria 4 (Menggunakan docker composer)

# kriteria tambahan
# membuat network
docker network create item-app

# membuat volume
docker volume network create app-db

# docker compose
docker compose up -d

docker compose down --volumes

sudo curl -L "https://github.com/docker/compose/releases/download/v2.12.2/docker-compose-$(uname -s)-$(uname -m)"  -o /usr/local/bin/docker-compose
sudo mv /usr/local/bin/docker-compose /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose

sudo docker container create -it --name item-app --network item-app --publish 8080:8080 --env NODE_ENV=production --env DB_HOST=item-db item-app:v1

sudo docker container create --name item-db --network item-app --publish 27019:27017 --mount "type=volume,source=mongodata,destination=/data/db" --env MONGO_INITDB_ROOT_USERNAME=yogiuser --env MONGO_INITDB_ROOT_PASSWORD=yogidb mongo:3

sudo docker run -d --name mongo-db --network item-net --network-alias item-db --restart on-failure -v app-db:/data/db -p 27020:27017 -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=qazxsw123 mongo

sudo docker run -d --name item-app --network item-net -e NODE_ENV=production -e DB_HOST=item-db --restart on-failure -p 8080:8080 item-app:v1