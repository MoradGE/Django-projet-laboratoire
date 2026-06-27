from django.urls import path
from . import views

urlpatterns = [
    path('', views.equipements_dashboard, name='equipements_dashboard'),
    path('equipments/', views.equipment_list, name='equipment_list'),
    path('add/', views.add_equipment, name='add_equipment'),
    path('update/<int:id>/', views.update_equipment, name='update_equipment'),
    path('delete/<int:id>/', views.delete_equipment, name='delete_equipment'),
]