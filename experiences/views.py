from django.shortcuts import render, redirect
from .models import Experience, Publication, Resultat
from .forms import PublicationForm, ResultatForm


def home(request):
    experiences = Experience.objects.all()
    publications = Publication.objects.all()
    resultats = Resultat.objects.all()

    context = {
        'experiences': experiences,
        'publications': publications,
        'resultats': resultats,
    }

    return render(
        request,
        'lab_management/home.html',
        context
    )


def detail(request):
    return render(
        request,
        'lab_management/detail.html'
    )


def experiences_dashboard(request):
    context = {
        'nb_exp': Experience.objects.count(),
        'nb_pub': Publication.objects.count(),
        'nb_res': Resultat.objects.count(),
    }

    return render(
        request,
        'lab_management/dashboard.html',
        context
    )


def liste_experiences(request):
    return render(
        request,
        'lab_management/experiences.html',
        {
            'experiences': Experience.objects.all()
        }
    )


def publications(request):
    return render(
        request,
        'lab_management/publications.html',
        {
            'publications': Publication.objects.all()
        }
    )


def resultats(request):
    return render(
        request,
        'lab_management/resultats.html',
        {
            'resultats': Resultat.objects.all()
        }
    )


def ajouter_publication(request):
    form = PublicationForm(
        request.POST or None
    )

    if form.is_valid():
        form.save()
        return redirect('experiences_home')

    return render(
        request,
        'lab_management/ajouter_publication.html',
        {
            'form': form
        }
    )


def ajouter_resultat(request):
    form = ResultatForm(
        request.POST or None
    )

    if form.is_valid():
        form.save()
        return redirect('experiences_home')

    return render(
        request,
        'lab_management/ajouter_resultat.html',
        {
            'form': form
        }
    )