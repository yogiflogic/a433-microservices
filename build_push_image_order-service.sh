#!/bin/sh
#  Membuat Docker Images
docker build -t order-service:latest .

# Melihat list docker images di local
docker images

# Mengubah nama image sesuai dengan repsitory di GitHub Packages
docker tag order-service:latest ghcr.io/yogiflogic/order-service:latest

# login ke github container registry
# ketik di terminal "export CR_PAT=YOUR_TOKEN"
echo $CR_PAT | docker login ghcr.io -u yogiflogic --password-stdin

# mengunggah image ke github container registry
docker push ghcr.io/yogiflogic/order-service:latest