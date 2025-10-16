Refactoring: Input sanitization

Before (naive direct saving of notes without sanitization):

form = JobForm(request.POST)
if form.is_valid():
    job = form.save(commit=False)
    job.owner = request.user
    job.save()

Risk: Stored XSS if notes contain HTML/JS.

After (strip HTML tags in form.clean_notes):

# tracker/forms.py
from django.utils.html import strip_tags

class JobForm(forms.ModelForm):
    ...
    def clean_notes(self):
        notes = self.cleaned_data.get('notes', '')
        return strip_tags(notes)

Also ensure templates render escaped output (Django auto-escapes by default).
