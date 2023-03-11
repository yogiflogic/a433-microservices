#  Membuat Docker Images
sudo docker build -t item-app:v1 .

# Melihat list docker images di local
sudo docker images

# Mengubah nama images sesuai dengan dockerhub / GitHub Packages
sudo docker tag item-app:v1 yogiflogic/item-app:v1

# login ke docker hub
# ketik di terminal "export PASSWORD_DOCKER_HUB=<password_Anda> "
echo $PASSWORD_DOCKER_HUB | sudo docker login -u yogiflogic --password-stdin

# mengunggah image ke docker hub
sudo docker push yogiflogic/item-app:v1