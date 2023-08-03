#!/bin/sh

#  Membuat Docker Images
sudo docker build -t karsajobs:latest .

# Melihat list docker images di local
sudo docker images

# Mengubah nama image sesuai dengan repsitory di GitHub Packages
sudo docker tag karsajobs:latest ghcr.io/yogiflogic/karsajobs:latest

# login ke github container registry
# ketik di terminal "export CR_PAT=YOUR_TOKEN"
echo $CR_PAT | docker login ghcr.io -u yogiflogic --password-stdin

# mengunggah image ke github container registry
sudo docker push ghcr.io/yogiflogic/karsajobs:latest
