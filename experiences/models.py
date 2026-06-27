from django.db import models


class Experience(models.Model):
    titre = models.CharField(max_length=200)
    description = models.TextField()

    def __str__(self):
        return self.titre


class Publication(models.Model):
    titre = models.CharField(max_length=200)
    auteur = models.CharField(max_length=100)
    date_publication = models.DateField()

    def __str__(self):
        return self.titre


class Resultat(models.Model):
    titre = models.CharField(max_length=200)
    description = models.TextField()

    def __str__(self):
        return self.titre