Job Application Tracker - Secure DevOps Lab

This workspace contains a minimal Django + SQLite application and documentation to complete the secure development lifecycle lab.

What's included:
- SRS.txt: mini SRS (purpose, requirements, constraints, acceptance criteria)
- agile.md: two user stories and sprint plan
- dfd.drawio: placeholder Draw.io XML (edit to create DFD)
- threat_analysis.md: STRIDE analysis and attack tree (Draw.io placeholder)
- test_cases.md: 3 test cases
- Dockerfile, .dockerignore: to build app container
- k8s/: Kubernetes Deployment and Service YAML
- tracker/: Django app with basic models, views, forms, and input sanitization (refactor)
- manage.py and Django project files

How to run locally:
1. Install Python 3.10+ and pip.
2. Create a venv: python -m venv .venv; .\.venv\Scripts\Activate.ps1
3. Install deps: pip install -r requirements.txt
4. Run migrations: python manage.py migrate
5. Create a superuser (optional): python manage.py createsuperuser
6. Run server: python manage.py runserver

Docker build (PowerShell):
# docker build -t job-tracker:lab .; docker run -p 8000:8000 job-tracker:lab

Minikube / Kubernetes: see k8s/README in this workspace.
