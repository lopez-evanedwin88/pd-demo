from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('api/greet/', views.greet, name='greet'),
]
