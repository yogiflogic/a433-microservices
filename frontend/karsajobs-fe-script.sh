 kubectl apply -f .\namespace\dicoding.yaml
 kubectl delete ns dicoding-ns

 kubectl apply -f .\frontend\karsajobs-ui-service.yaml -n dicoding-ns
 kubectl apply -f .\frontend\karsajobs-ui-deployment.yaml -n dicoding-ns

 kubectl get all -n dicoding-ns

 minikube service karsauisrv -n dicoding-ns

 kubectl delete deployment frontend-tier -n dicoding-ns
 kubectl delete service karsauisrv -n dicoding-ns

