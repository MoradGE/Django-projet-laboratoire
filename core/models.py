from django.db import models
from django.contrib.auth.models import User

class Record(models.Model):
    created_at=models.DateTimeField(auto_now_add=True)
    first_name=models.CharField(max_length=50)
    last_name=models.CharField(max_length=50)
    email=models.CharField(max_length=100)
    phone=models.CharField(max_length=15)
    adress=models.CharField(max_length=100)
    city=models.CharField(max_length=50)
    state=models.CharField(max_length=50)
    zipcode=models.CharField(max_length=20)

    def __str__(self):
        return (f"{self.first_name} {self.last_name}")

class Chercheur(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE, null=True, blank=True)
    nom = models.CharField(max_length=100)
    prenom = models.CharField(max_length=100)
    email = models.EmailField(blank=True, null=True)
    specialite = models.CharField(max_length=100)

    def __str__(self):
        return f"{self.prenom} {self.nom}"

class ProjetRecherche(models.Model):
    STATUT_CHOICES = [
        ('en_cours', 'En cours'),
        ('termine', 'Terminé'),
        ('suspendu', 'Suspendu'),
        ('planifie', 'Planifié'),
    ]
    titre = models.CharField(max_length=200)
    description = models.TextField()
    statut = models.CharField(max_length=20, choices=STATUT_CHOICES, default='planifie')
    date_debut = models.DateField()
    date_fin = models.DateField(null=True, blank=True)
    budget = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    chercheurs = models.ManyToManyField(Chercheur, blank=True)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.titre