eksctl create cluster --name uda-cluster --region us-east-1 --fargate 
#this one cant connect RDS, why?
#or
eksctl create cluster \
--name uda-cluster3 \
--region us-west-2 \
--nodegroup-name standard-workers \
--node-type t3a.small \
--nodes 2 \
--nodes-min 1 \
--nodes-max 2 \
--managed

kubectl get svc,po,deploy

kubectl apply -f env-configmap.yaml 
kubectl apply -f env-secret.yaml 
kubectl apply -f aws-secret.yaml 

kubectl apply -f backend-user-deployment.yaml 
kubectl apply -f backend-user-service.yaml  
kubectl apply -f backend-feed-deployment.yaml 
kubectl apply -f backend-feed-service.yaml  
kubectl apply -f frontend-deployment.yaml 
kubectl apply -f frontend-service.yaml  
kubectl apply -f reverseproxy-deployment.yaml 
kubectl apply -f reverseproxy-service.yaml  


#http://uda-eks-proj-ui.gaojunkai.com:8081/home
#http://uda-eks-proj-backend.gaojunkai.com:8080/api/v0/feed



kubectl delete -f backend-user-deployment.yaml 
kubectl delete -f backend-user-service.yaml  
kubectl delete -f backend-feed-deployment.yaml 
kubectl delete -f backend-feed-service.yaml  
kubectl delete -f frontend-deployment.yaml 
kubectl delete -f frontend-service.yaml  
kubectl delete -f reverseproxy-deployment.yaml 
kubectl delete -f reverseproxy-service.yaml  

#kubectl port-forward service/frontend 8081:8081
#kubectl port-forward service/reverseproxy 8080:8080


eksctl delete cluster --name=uda-cluster --region us-east-1
#or
eksctl delete cluster --name=uda-cluster3 --region us-west-2
