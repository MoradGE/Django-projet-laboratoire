from django.urls import path
from . import views

urlpatterns = [
    path('', views.tableau_bord_laboratoire, name='tableau_bord_laboratoire'),
    path('clients/', views.liste_clients, name='liste_clients'),
    path('clients/<int:pk>/', views.detail_client, name='detail_client'),
    path('materiels/nouveau/', views.creer_materiel_recherche, name='creer_materiel_recherche'),
    path('reservations/', views.liste_reservations_materiel, name='liste_reservations_materiel'),
    path('reservations/nouvelle/', views.creer_reservation_materiel, name='creer_reservation_materiel'),
    path('reservations/<int:pk>/', views.detail_reservation_materiel, name='detail_reservation_materiel'),
    path('reservations/<int:pk>/statut/<str:statut>/', views.changer_statut_reservation, name='changer_statut_reservation'),
]