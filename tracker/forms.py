from django import forms
from .models import Job
from django.utils.html import strip_tags

class JobForm(forms.ModelForm):
    class Meta:
        model = Job
        fields = ['company', 'role', 'application_date', 'status', 'notes']

    def clean_notes(self):
        notes = self.cleaned_data.get('notes', '')
        # Sanitize notes by stripping HTML tags to prevent stored XSS
        clean = strip_tags(notes)
        return clean

    def clean_company(self):
        company = self.cleaned_data.get('company', '')
        return strip_tags(company)

    def clean_role(self):
        role = self.cleaned_data.get('role', '')
        return strip_tags(role)
