 kubectl apply -f .\namespace\dicoding.yaml
 kubectl delete ns dicoding-ns

 kubectl apply -f .\backend\karsajobs-service.yaml -n dicoding-ns
 kubectl apply -f .\backend\karsajobs-deployment.yaml -n dicoding-ns

 kubectl get all -n dicoding-ns

 minikube service backend-srv -n dicoding-ns

 kubectl delete deployment backend-tier -n dicoding-ns
 kubectl delete service backend-srv -n dicoding-ns