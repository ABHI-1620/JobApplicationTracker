Kubernetes deployment notes

- Build Docker image locally: docker build -t job-tracker:lab .
- Start minikube (or a local k8s): minikube start
- Load image into minikube: minikube image load job-tracker:lab
- Apply YAML: kubectl apply -f k8s/deployment.yaml -f k8s/service.yaml
- Get pods: kubectl get pods
- Get service URL: minikube service job-tracker-service --url

Note: On some systems you may need to change Service type or use port-forward:
kubectl port-forward deployment/job-tracker 8000:8000
