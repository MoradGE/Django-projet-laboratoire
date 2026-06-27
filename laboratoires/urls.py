from django.urls import path
from . import views

urlpatterns = [
    path('', views.dashboard, name='laboratoires_dashboard'),
path('liste/', views.laboratoire_list, name='laboratoire_list'),
    path('<int:pk>/', views.laboratoire_detail, name='laboratoire_detail'),
    path('nouveau/', views.laboratoire_create, name='laboratoire_create'),
    path('<int:pk>/modifier/', views.laboratoire_update, name='laboratoire_update'),
    path('<int:pk>/supprimer/', views.laboratoire_delete, name='laboratoire_delete'),

    path('responsables/', views.responsable_list, name='responsable_list'),
    path('responsables/nouveau/', views.responsable_create, name='responsable_create'),
    path('responsables/<int:pk>/modifier/', views.responsable_update, name='responsable_update'),
    path('responsables/<int:pk>/supprimer/', views.responsable_delete, name='responsable_delete'),
    path('<int:laboratoire_id>/responsables/', views.responsables_par_laboratoire, name='responsables_par_laboratoire'),

    path('membres/', views.membre_list, name='membre_list'),
    path('membres/nouveau/', views.membre_create, name='membre_create'),
    path('membres/<int:pk>/modifier/', views.membre_update, name='membre_update'),
    path('membres/<int:pk>/supprimer/', views.membre_delete, name='membre_delete'),
    path('<int:laboratoire_id>/membres/', views.membres_par_laboratoire, name='membres_par_laboratoire'),
]