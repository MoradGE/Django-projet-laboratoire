from django.contrib import admin
from .models import Laboratoire, Responsable, Membre

admin.site.register(Laboratoire)
admin.site.register(Responsable)
admin.site.register(Membre)
