#  Membuat Docker Images
docker build -t karsajobs-ui:latest .

# Melihat list docker images di local
docker images

# Mengubah nama image sesuai dengan repsitory di GitHub Packages
sudo docker tag karsajobs-ui:latest ghcr.io/yogiflogic/karsajobs-ui:latest

# login ke github container registry
# ketik di terminal "export CR_PAT=YOUR_TOKEN"
echo $CR_PAT | docker login ghcr.io -u yogiflogic --password-stdin

# mengunggah image ke github container registry
docker push ghcr.io/yogiflogic/karsajobs-ui:latest
