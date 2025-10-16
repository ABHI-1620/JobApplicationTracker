from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth.decorators import login_required
from .models import Job
from .forms import JobForm

@login_required
def index(request):
    jobs = Job.objects.filter(owner=request.user)
    return render(request, 'tracker/index.html', {'jobs': jobs})

@login_required
def add_job(request):
    if request.method == 'POST':
        form = JobForm(request.POST)
        if form.is_valid():
            job = form.save(commit=False)
            job.owner = request.user
            job.save()
            return redirect('index')
    else:
        form = JobForm()
    return render(request, 'tracker/form.html', {'form': form})

@login_required
def edit_job(request, pk):
    job = get_object_or_404(Job, pk=pk, owner=request.user)
    if request.method == 'POST':
        form = JobForm(request.POST, instance=job)
        if form.is_valid():
            form.save()
            return redirect('index')
    else:
        form = JobForm(instance=job)
    return render(request, 'tracker/form.html', {'form': form, 'edit': True})

@login_required
def delete_job(request, pk):
    job = get_object_or_404(Job, pk=pk, owner=request.user)
    if request.method == 'POST':
        job.delete()
        return redirect('index')
    return render(request, 'tracker/confirm_delete.html', {'job': job})
