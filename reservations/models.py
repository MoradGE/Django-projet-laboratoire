
from django.db import models
from django.core.exceptions import ValidationError
from django.utils import timezone

class Client(models.Model):
    nom = models.CharField(max_length=100)
    email = models.EmailField()
    telephone = models.CharField(max_length=20)

    def __str__(self):
        return self.nom


class MaterielRecherche(models.Model):
    ETAT_DISPONIBLE = 'disponible'
    ETAT_MAINTENANCE = 'maintenance'
    ETAT_HORS_SERVICE = 'hors_service'

    ETATS = [
        (ETAT_DISPONIBLE, 'Disponible'),
        (ETAT_MAINTENANCE, 'En maintenance'),
        (ETAT_HORS_SERVICE, 'Hors service'),
    ]

    nom = models.CharField(max_length=120)
    reference = models.CharField(max_length=50, unique=True)
    laboratoire = models.CharField(max_length=120)
    description = models.TextField(blank=True)
    etat = models.CharField(max_length=20, choices=ETATS, default=ETAT_DISPONIBLE)

    class Meta:
        ordering = ['nom']
        verbose_name = 'Matériel de recherche'
        verbose_name_plural = 'Matériels de recherche'

    def __str__(self):
        return f'{self.nom} ({self.reference})'


class ReservationMateriel(models.Model):
    STATUT_EN_ATTENTE = 'en_attente'
    STATUT_VALIDEE = 'validee'
    STATUT_TERMINEE = 'terminee'
    STATUT_ANNULEE = 'annulee'

    STATUTS = [
        (STATUT_EN_ATTENTE, 'En attente'),
        (STATUT_VALIDEE, 'Validée'),
        (STATUT_TERMINEE, 'Terminée'),
        (STATUT_ANNULEE, 'Annulée'),
    ]

    materiel = models.ForeignKey(
        MaterielRecherche,
        on_delete=models.CASCADE,
        related_name='reservations',
    )
    demandeur = models.CharField(max_length=120)
    email_demandeur = models.EmailField()
    date_debut = models.DateTimeField()
    date_fin = models.DateTimeField()
    motif = models.TextField()
    statut = models.CharField(max_length=20, choices=STATUTS, default=STATUT_EN_ATTENTE)
    date_creation = models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['-date_debut']
        verbose_name = 'Réservation de matériel'
        verbose_name_plural = 'Réservations de matériels'

    def __str__(self):
        return f'{self.materiel} réservé par {self.demandeur}'

    def clean(self):
        erreurs = {}

        if self.date_debut and self.date_fin and self.date_fin <= self.date_debut:
            erreurs['date_fin'] = 'La date de fin doit être après la date de début.'

        if self.date_debut and self.date_debut < timezone.now() and not self.pk:
            erreurs['date_debut'] = 'La date de début ne peut pas être dans le passé.'

        reservation_active = self.statut in [self.STATUT_EN_ATTENTE, self.STATUT_VALIDEE]

        if (
            reservation_active
            and self.materiel_id
            and self.materiel.etat != MaterielRecherche.ETAT_DISPONIBLE
        ):
            erreurs['materiel'] = 'Ce matériel n’est pas disponible à la réservation.'

        if reservation_active and self.materiel_id and self.date_debut and self.date_fin:
            reservations_en_conflit = ReservationMateriel.objects.filter(
                materiel=self.materiel,
                statut__in=[self.STATUT_EN_ATTENTE, self.STATUT_VALIDEE],
                date_debut__lt=self.date_fin,
                date_fin__gt=self.date_debut,
            )

            if self.pk:
                reservations_en_conflit = reservations_en_conflit.exclude(pk=self.pk)

            if reservations_en_conflit.exists():
                erreurs['date_debut'] = 'Ce matériel est déjà réservé sur cette période.'

        if erreurs:
            raise ValidationError(erreurs)
