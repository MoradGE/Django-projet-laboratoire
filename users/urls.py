from django.urls import path
from . import views

urlpatterns = [
    path('', views.users_dashboard, name='users_dashboard'),
    path('profile/', views.profile, name='profile'),
    path('liste/', views.user_list, name='user_list'),
    path('nouveau/', views.user_create, name='user_create'),
    path('<int:pk>/modifier/', views.user_update, name='user_update'),
    path('<int:pk>/supprimer/', views.user_delete, name='user_delete'),
]