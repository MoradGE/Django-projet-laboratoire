from django.db import models


class Laboratoire(models.Model):
    STATUT_CHOICES = [
        ("actif", "Actif"),
        ("inactif", "Inactif"),
        ("en_attente", "En attente"),
    ]

    nom_laboratoire = models.CharField(max_length=150)
    code_laboratoire = models.CharField(max_length=50, unique=True)
    domaine = models.CharField(max_length=150)
    localisation = models.CharField(max_length=150)
    description = models.TextField(blank=True)
    date_creation = models.DateField()
    statut = models.CharField(max_length=20, choices=STATUT_CHOICES, default="actif")
    date_ajout = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ["nom_laboratoire"]
        verbose_name = "Laboratoire"
        verbose_name_plural = "Laboratoires"

    def __str__(self):
        return f"{self.nom_laboratoire} ({self.code_laboratoire})"


class Responsable(models.Model):
    nom = models.CharField(max_length=100)
    prenom = models.CharField(max_length=100)
    email = models.EmailField()
    telephone = models.CharField(max_length=30)
    fonction = models.CharField(max_length=120)
    laboratoire = models.ForeignKey(
        Laboratoire,
        on_delete=models.CASCADE,
        related_name="responsables",
    )

    class Meta:
        ordering = ["nom", "prenom"]
        verbose_name = "Responsable"
        verbose_name_plural = "Responsables"

    def __str__(self):
        return f"{self.prenom} {self.nom}"


class Membre(models.Model):
    STATUT_CHOICES = [
        ("actif", "Actif"),
        ("inactif", "Inactif"),
    ]

    NIVEAU_CHOICES = [
        ("licence", "Licence"),
        ("master", "Master"),
        ("doctorat", "Doctorat"),
        ("enseignant", "Enseignant chercheur"),
        ("technicien", "Technicien"),
        ("autre", "Autre"),
    ]

    nom = models.CharField(max_length=100)
    prenom = models.CharField(max_length=100)
    email = models.EmailField()
    telephone = models.CharField(max_length=30)
    role = models.CharField(max_length=120)
    niveau = models.CharField(max_length=30, choices=NIVEAU_CHOICES, default="master")
    statut = models.CharField(max_length=20, choices=STATUT_CHOICES, default="actif")
    date_ajout = models.DateTimeField(auto_now_add=True)
    laboratoire = models.ForeignKey(
        Laboratoire,
        on_delete=models.CASCADE,
        related_name="membres",
    )

    class Meta:
        ordering = ["nom", "prenom"]
        verbose_name = "Membre"
        verbose_name_plural = "Membres"

    def __str__(self):
        return f"{self.prenom} {self.nom}"


