#  Membuat Docker Images
sudo docker build -t item-app:v1 .

# Melihat list docker images di local
sudo docker images

# Mengubah nama image sesuai dengan repsitory di GitHub Packages
sudo docker tag item-app:v1 ghcr.io/yogiflogic/item-app:v1

# login jika menggunakan github package
# ketik di terminal "export CR_PAT=YOUR_TOKEN"
# login jika menggunakan docker hub
# ketik di terminal "export PASSWORD_DOCKER_HUB=<password_Anda>"
echo $CR_PAT | docker login ghcr.io -u yogiflogic --password-stdin

# mengunggah image ke github container registry
sudo docker push ghcr.io/yogiflogic/item-app:v1
