from django.contrib import admin
from .models import Client, MaterielRecherche, ReservationMateriel

admin.site.register(Client)
admin.site.register(MaterielRecherche)
admin.site.register(ReservationMateriel)