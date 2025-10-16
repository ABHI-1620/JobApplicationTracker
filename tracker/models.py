from django.db import models
from django.contrib.auth import get_user_model

class Job(models.Model):
    owner = models.ForeignKey(get_user_model(), on_delete=models.CASCADE)
    company = models.CharField(max_length=200)
    role = models.CharField(max_length=200)
    application_date = models.DateField()
    status = models.CharField(max_length=50)
    notes = models.TextField(blank=True)

    def __str__(self):
        return f"{self.company} - {self.role}"
