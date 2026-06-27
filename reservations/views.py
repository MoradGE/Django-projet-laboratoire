from django.contrib import messages
from django.shortcuts import get_object_or_404, redirect, render
from django.views.decorators.http import require_POST

from .forms import MaterielRechercheForm, ReservationMaterielForm
from .models import Client, MaterielRecherche, ReservationMateriel

def liste_clients(request):
    tous_les_clients = Client.objects.all()
    return render(request, 'clients/liste_clients.html', {'clients': tous_les_clients})

def detail_client(request, pk):
    client = get_object_or_404(Client, pk=pk)
    return render(request, 'clients/detail_clients.html', {'client': client})


def tableau_bord_laboratoire(request):
    reservations = ReservationMateriel.objects.select_related('materiel')[:8]
    materiels = MaterielRecherche.objects.all()
    contexte = {
        'reservations': reservations,
        'materiels': materiels,
        'total_materiels': materiels.count(),
        'total_disponibles': materiels.filter(etat=MaterielRecherche.ETAT_DISPONIBLE).count(),
        'total_reservations_actives': ReservationMateriel.objects.filter(
            statut__in=[
                ReservationMateriel.STATUT_EN_ATTENTE,
                ReservationMateriel.STATUT_VALIDEE,
            ]
        ).count(),
    }
    return render(request, 'clients/tableau_bord_laboratoire.html', contexte)


def creer_materiel_recherche(request):
    if request.method == 'POST':
        form = MaterielRechercheForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Le matériel de recherche a été ajouté avec succès.')
            return redirect('tableau_bord_laboratoire')
    else:
        form = MaterielRechercheForm()

    return render(request, 'clients/form_materiel_recherche.html', {'form': form})


def liste_reservations_materiel(request):
    reservations = ReservationMateriel.objects.select_related('materiel')
    statut = request.GET.get('statut')

    if statut:
        reservations = reservations.filter(statut=statut)

    return render(
        request,
        'clients/liste_reservations_materiel.html',
        {
            'reservations': reservations,
            'statuts': ReservationMateriel.STATUTS,
            'statut_selectionne': statut,
        },
    )


def creer_reservation_materiel(request):
    if request.method == 'POST':
        form = ReservationMaterielForm(request.POST)
        if form.is_valid():
            reservation = form.save()
            messages.success(request, 'La réservation a été enregistrée avec succès.')
            return redirect('detail_reservation_materiel', pk=reservation.pk)
    else:
        form = ReservationMaterielForm()

    return render(request, 'clients/form_reservation_materiel.html', {'form': form})


def detail_reservation_materiel(request, pk):
    reservation = get_object_or_404(
        ReservationMateriel.objects.select_related('materiel'),
        pk=pk,
    )
    return render(request, 'clients/detail_reservation_materiel.html', {'reservation': reservation})


@require_POST
def changer_statut_reservation(request, pk, statut):
    reservation = get_object_or_404(ReservationMateriel, pk=pk)
    statuts_valides = dict(ReservationMateriel.STATUTS)

    if statut in statuts_valides:
        reservation.statut = statut
        reservation.full_clean()
        reservation.save(update_fields=['statut'])
        messages.success(request, f'Statut mis à jour : {statuts_valides[statut]}.')
    else:
        messages.error(request, 'Statut invalide.')

    return redirect('detail_reservation_materiel', pk=reservation.pk)

