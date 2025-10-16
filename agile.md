Agile: User stories and Sprint Plan

User Stories:
1) As a user, I want to create and manage job application entries so that I can track my applications and statuses.
2) As a user, I want my input to be sanitized so that my data is private and the app is safe from XSS and injection attacks.

Sprint Plan (1 day lab sprint):
- Sprint goal: Implement core CRUD for job entries and secure inputs; containerize and deploy to minikube.
- Tasks:
  - Setup Django project and tracker app (2h)
  - Implement models, views, templates (3h)
  - Add input sanitization and validation (1h)
  - Create Dockerfile and test container (1h)
  - Create k8s YAML and deploy to minikube (1h)
  - Documentation and screenshots (1h)

Definition of Done:
- Features implemented and tested locally, container built and running, deployed to minikube, basic security checks completed.
