from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.shortcuts import get_object_or_404, redirect, render

from .forms import LaboratoireForm, MembreForm, ResponsableForm
from .models import Laboratoire, Membre, Responsable



@login_required
def dashboard(request):
    context = {
        "total_laboratoires": Laboratoire.objects.count(),
        "total_responsables": Responsable.objects.count(),
        "total_membres": Membre.objects.count(),
        "derniers_laboratoires": Laboratoire.objects.order_by("-date_ajout")[:5],
        "derniers_membres": Membre.objects.select_related("laboratoire").order_by("-date_ajout")[:5],
    }
    return render(request, "dashboard.html", context)


@login_required
def laboratoire_list(request):
    laboratoires = Laboratoire.objects.all()
    return render(request, "laboratoires/laboratoire_list.html", {"laboratoires": laboratoires})


@login_required
def laboratoire_detail(request, pk):
    laboratoire = get_object_or_404(Laboratoire, pk=pk)
    responsables = laboratoire.responsables.all()
    membres = laboratoire.membres.all()
    context = {
        "laboratoire": laboratoire,
        "responsables": responsables,
        "membres": membres,
    }
    return render(request, "laboratoires/laboratoire_detail.html", context)


@login_required
def laboratoire_create(request):
    if request.method == "POST":
        form = LaboratoireForm(request.POST)
        if form.is_valid():
            laboratoire = form.save()
            messages.success(request, "Laboratoire ajoute avec succes.")
            return redirect("laboratoire_detail", pk=laboratoire.pk)
        messages.error(request, "Veuillez corriger les erreurs du formulaire.")
    else:
        form = LaboratoireForm()

    return render(
        request,
        "laboratoires/laboratoire_form.html",
        {"form": form, "title": "Ajouter un laboratoire", "button_label": "Ajouter"},
    )


@login_required
def laboratoire_update(request, pk):
    laboratoire = get_object_or_404(Laboratoire, pk=pk)
    if request.method == "POST":
        form = LaboratoireForm(request.POST, instance=laboratoire)
        if form.is_valid():
            laboratoire = form.save()
            messages.success(request, "Laboratoire modifie avec succes.")
            return redirect("laboratoire_detail", pk=laboratoire.pk)
        messages.error(request, "Veuillez corriger les erreurs du formulaire.")
    else:
        form = LaboratoireForm(instance=laboratoire)

    return render(
        request,
        "laboratoires/laboratoire_form.html",
        {"form": form, "title": "Modifier un laboratoire", "button_label": "Modifier"},
    )


@login_required
def laboratoire_delete(request, pk):
    laboratoire = get_object_or_404(Laboratoire, pk=pk)
    if request.method == "POST":
        laboratoire.delete()
        messages.success(request, "Laboratoire supprime avec succes.")
        return redirect("laboratoire_list")

    return render(
        request,
        "laboratoires/laboratoire_confirm_delete.html",
        {"laboratoire": laboratoire},
    )


@login_required
def responsable_list(request):
    responsables = Responsable.objects.select_related("laboratoire")
    return render(
        request,
        "responsables/responsable_list.html",
        {"responsables": responsables},
    )


@login_required
def responsables_par_laboratoire(request, laboratoire_id):
    laboratoire = get_object_or_404(Laboratoire, pk=laboratoire_id)
    responsables = laboratoire.responsables.select_related("laboratoire")
    return render(
        request,
        "responsables/responsable_list.html",
        {"responsables": responsables, "laboratoire": laboratoire},
    )


@login_required
def responsable_create(request):
    initial = {}
    laboratoire_id = request.GET.get("laboratoire")
    if laboratoire_id:
        laboratoire = get_object_or_404(Laboratoire, pk=laboratoire_id)
        initial["laboratoire"] = laboratoire

    if request.method == "POST":
        form = ResponsableForm(request.POST)
        if form.is_valid():
            responsable = form.save()
            messages.success(request, "Responsable ajoute avec succes.")
            return redirect("laboratoire_detail", pk=responsable.laboratoire.pk)
        messages.error(request, "Veuillez corriger les erreurs du formulaire.")
    else:
        form = ResponsableForm(initial=initial)

    return render(
        request,
        "responsables/responsable_form.html",
        {"form": form, "title": "Ajouter un responsable", "button_label": "Ajouter"},
    )


@login_required
def responsable_update(request, pk):
    responsable = get_object_or_404(Responsable, pk=pk)
    if request.method == "POST":
        form = ResponsableForm(request.POST, instance=responsable)
        if form.is_valid():
            responsable = form.save()
            messages.success(request, "Responsable modifie avec succes.")
            return redirect("laboratoire_detail", pk=responsable.laboratoire.pk)
        messages.error(request, "Veuillez corriger les erreurs du formulaire.")
    else:
        form = ResponsableForm(instance=responsable)

    return render(
        request,
        "responsables/responsable_form.html",
        {"form": form, "title": "Modifier un responsable", "button_label": "Modifier"},
    )


@login_required
def responsable_delete(request, pk):
    responsable = get_object_or_404(Responsable, pk=pk)
    laboratoire_pk = responsable.laboratoire.pk
    if request.method == "POST":
        responsable.delete()
        messages.success(request, "Responsable supprime avec succes.")
        return redirect("laboratoire_detail", pk=laboratoire_pk)

    return render(
        request,
        "responsables/responsable_confirm_delete.html",
        {"responsable": responsable},
    )


@login_required
def membre_list(request):
    membres = Membre.objects.select_related("laboratoire")
    return render(request, "membres/membre_list.html", {"membres": membres})


@login_required
def membres_par_laboratoire(request, laboratoire_id):
    laboratoire = get_object_or_404(Laboratoire, pk=laboratoire_id)
    membres = laboratoire.membres.select_related("laboratoire")
    return render(
        request,
        "membres/membre_list.html",
        {"membres": membres, "laboratoire": laboratoire},
    )


@login_required
def membre_create(request):
    initial = {}
    laboratoire_id = request.GET.get("laboratoire")
    if laboratoire_id:
        laboratoire = get_object_or_404(Laboratoire, pk=laboratoire_id)
        initial["laboratoire"] = laboratoire

    if request.method == "POST":
        form = MembreForm(request.POST)
        if form.is_valid():
            membre = form.save()
            messages.success(request, "Membre ajoute avec succes.")
            return redirect("laboratoire_detail", pk=membre.laboratoire.pk)
        messages.error(request, "Veuillez corriger les erreurs du formulaire.")
    else:
        form = MembreForm(initial=initial)

    return render(
        request,
        "membres/membre_form.html",
        {"form": form, "title": "Ajouter un membre", "button_label": "Ajouter"},
    )


@login_required
def membre_update(request, pk):
    membre = get_object_or_404(Membre, pk=pk)
    if request.method == "POST":
        form = MembreForm(request.POST, instance=membre)
        if form.is_valid():
            membre = form.save()
            messages.success(request, "Membre modifie avec succes.")
            return redirect("laboratoire_detail", pk=membre.laboratoire.pk)
        messages.error(request, "Veuillez corriger les erreurs du formulaire.")
    else:
        form = MembreForm(instance=membre)

    return render(
        request,
        "membres/membre_form.html",
        {"form": form, "title": "Modifier un membre", "button_label": "Modifier"},
    )


@login_required
def membre_delete(request, pk):
    membre = get_object_or_404(Membre, pk=pk)
    laboratoire_pk = membre.laboratoire.pk
    if request.method == "POST":
        membre.delete()
        messages.success(request, "Membre supprime avec succes.")
        return redirect("laboratoire_detail", pk=laboratoire_pk)

    return render(request, "membres/membre_confirm_delete.html", {"membre": membre})
