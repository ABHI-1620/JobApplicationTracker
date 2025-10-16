Final steps & verification

Run locally (PowerShell):
1. python -m venv .venv; .\.venv\Scripts\Activate.ps1
2. pip install -r requirements.txt
3. python manage.py migrate
4. python manage.py createsuperuser (optional)
5. python manage.py runserver 0.0.0.0:8000

Docker (PowerShell):
1. docker build -t job-tracker:lab .
2. docker run -p 8000:8000 job-tracker:lab
3. Verify by visiting http://localhost:8000 or use curl: curl http://localhost:8000

Minikube/K8s (PowerShell):
1. minikube start
2. minikube image load job-tracker:lab
3. kubectl apply -f k8s/deployment.yaml -f k8s/service.yaml
4. kubectl get pods
5. minikube service job-tracker-service --url

Deliverables for lab submission:
- SRS.txt (1 page)
- agile.md (user stories + sprint plan)
- DFD PNG (export from dfd.drawio)
- threat_analysis.md + attack tree PNG
- test_cases.md
- Screenshot of `docker ps` after running container
- Screenshot of `kubectl get pods` after deployment
- refactor.md and code snippet (tracker/forms.py)
- Final app URL or CLI output showing the app running in Kubernetes
