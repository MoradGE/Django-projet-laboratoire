from django.db import models

class Equipment(models.Model):
    STATUS_CHOICES = [
        ('fonctionnel', 'Fonctionnel'),
        ('panne', 'En panne'),
        ('maintenance', 'En maintenance'),
        ('hors_service', 'Hors service'),
    ]

    AVAILABILITY_CHOICES = [
        ('disponible', 'Disponible'),
        ('reserve', 'Réservé'),
        ('utilise', 'En cours d’utilisation'),
        ('indisponible', 'Indisponible'),
    ]

    name = models.CharField(max_length=100)
    serial_number = models.CharField(max_length=100, unique=True)
    status = models.CharField(max_length=20, choices=STATUS_CHOICES)
    availability = models.CharField(max_length=20, choices=AVAILABILITY_CHOICES)
    date_added = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.name