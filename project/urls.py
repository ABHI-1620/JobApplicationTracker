# ...existing code...
from django.contrib import admin
from django.urls import path, include

urlpatterns = [
    path('admin/', admin.site.urls),
    # Authentication (login/logout/password management) under /accounts/
    path('accounts/', include('django.contrib.auth.urls')),
    # Tracker app at the site root
    path('', include('tracker.urls')),
]
# ...existing code...