"""
URL configuration for myproject project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from myapp.views import LoginView, Adminconfig,UserConfig,Text_moodConfig,Text_typeConfig,face_detect,face_recognition

urlpatterns = [
    path('admin/', admin.site.urls),
    path('login/', LoginView.as_view(), name='login'),
    path('api/admin/', Adminconfig.as_view(), name='all-admin-api'),
    path('api/users/', UserConfig.as_view(), name = 'all-users-api'),
    path('api/text-mood/', Text_moodConfig.as_view(), name = 'all-text-api'),
    path('api/type-mood/', Text_typeConfig.as_view(), name = 'all-type-api'),
    path('api/face-detect/', face_detect.as_view(), name = 'face-detect-api'),
    path('api/face_recognition/', face_recognition.as_view(), name = 'face-recognition-api'),
]