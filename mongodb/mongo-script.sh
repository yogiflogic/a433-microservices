 kubectl apply -f .\namespace\dicoding.yaml
 kubectl delete ns dicoding-ns

 kubectl apply -f .\mongodb\mongo-secret.yaml -n dicoding-ns
 kubectl apply -f .\mongodb\mongo-configmap.yaml -n dicoding-ns
 kubectl apply -f .\mongodb\mongo-pv-pvc.yaml -n dicoding-ns
 kubectl apply -f .\mongodb\mongo-service.yaml -n dicoding-ns
 kubectl apply -f .\mongodb\mongo-statefulset.yaml -n dicoding-ns

 kubectl get all -n dicoding-ns

 kubectl delete statefulset  mongodb -n dicoding-ns
 kubectl delete service mongosrv -n dicoding-ns

 kubectl describe pod mongodb-0 -n dicoding-ns
 kubectl exec -it mongodb-0 sh -n dicoding-ns

 kubectl exec mypod curl http://<Pod-IP>:80
  or like this.
 kubectl exec mypod -- curl http://<pod-ip>:80