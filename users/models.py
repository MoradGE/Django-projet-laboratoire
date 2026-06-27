from django.contrib.auth.models import User
from django.db import models


class Profil(models.Model):
    class Role(models.TextChoices):
        ADMIN = "ADMIN", "Admin"
        CHERCHEUR = "CHERCHEUR", "Chercheur"
        ETUDIANT = "ETUDIANT", "Étudiant"

    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='profil')
    role = models.CharField(max_length=20, choices=Role.choices, default=Role.ETUDIANT)

    def __str__(self):
        return f"{self.user.username} - {self.role}"
