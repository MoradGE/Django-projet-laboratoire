from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='experiences_home'),
    path('dashboard/', views.experiences_dashboard, name='experiences_dashboard'),
    path('detail/', views.detail, name='experiences_detail'),
    path('liste/', views.liste_experiences, name='liste_experiences'),
    path('publications/', views.publications, name='publications'),
    path('resultats/', views.resultats, name='resultats'),
    path('publications/ajouter/', views.ajouter_publication, name='ajouter_publication'),
    path('resultats/ajouter/', views.ajouter_resultat, name='ajouter_resultat'),
]