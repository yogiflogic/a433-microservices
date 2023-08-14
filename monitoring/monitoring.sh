#helm
kubectl create namespace monitoring
#kubectl apply -f .\namespace\monitoring.yaml
#helm repo list
#helm repo update
#helm repo add <nama repo> <link repo>
#helm repo add prometheus <link repo>
#helm search repo promethues

# Instal helm
# cara 1 linux
#curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
#chmod 700 get_helm.sh
#./get_helm.sh

# cara 2 linux
#curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
#sudo apt-get install apt-transport-https --yes
#echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
#sudo apt-get update
#sudo apt-get install helm

#cara 3 windows
#Non-Administrative install
ChocolateyInstallNonAdmin.ps1:

# Set directory for installation - Chocolatey does not lock
# down the directory if not the default
#$InstallDir='C:\ProgramData\chocoportable'
#$env:ChocolateyInstall="$InstallDir"

# If your PowerShell Execution policy is restrictive, you may
# not be able to get around that. Try setting your session to
# Bypass.
#Set-ExecutionPolicy Bypass -Scope Process -Force;

# All install options - offline, proxy, etc at
# https://chocolatey.org/install
#iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

====================

choco install kubernetes-helm
choco upgrade kubernetes-helm
choco uninstall kubernetes-helm
choco upgrade chocolatey

#prometheus
#https://github.com/prometheus-community/helm-charts
helm install prometheus prometheus-community/prometheus -n monitoring
kubectl get all -n monitoring

helm uninstall prometheus -n monitoring

#edit service
kubectl -n monitoring edit svc prometheus-server

minikube service prometheus-server -n monitoring

#grafana
#link github repo / bitnami pacakage repo
#https://github.com/grafana/helm-charts
#https://bitnami.com/stack/grafana/helm
#kubectl -n monitoring edit svc grafana
#helm version
helm install grafana grafana/grafana -n monitoring
helm install grafana grafana/grafana -n monitoring

#get password
kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo

#get password windows
kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}"

#result
#cGEyZmhUZjhsQTZNM0NFeFpKN3V1U1c2MjFaWllpcHpCN2YwdngwOQ==

#result decode
#pa2fhTf8lA6M3CExZJ7uuSW621ZZYipzB7f0vx09

http://prometheus-server:80
helm delete grafana

minikube service grafana -n monitoring

http://prometheus-server:80

kubectl get all -n monitoring > monitoring.txt