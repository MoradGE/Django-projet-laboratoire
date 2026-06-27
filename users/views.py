from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.shortcuts import get_object_or_404, redirect, render

from .models import Profil


def is_admin_user(user):
    if not user.is_authenticated:
        return False
    if user.is_superuser:
        return True
    try:
        return user.profil.role == Profil.Role.ADMIN
    except Profil.DoesNotExist:
        return False


def admin_required(view_func):
    def wrapper(request, *args, **kwargs):
        if not request.user.is_authenticated:
            return redirect("home")
        if not is_admin_user(request.user):
            messages.error(
                request,
                "Accès refusé : seul l'administrateur peut gérer les utilisateurs.",
            )
            return redirect("users_dashboard")
        return view_func(request, *args, **kwargs)
    return wrapper


@login_required
def users_dashboard(request):
    context = {}
    if is_admin_user(request.user):
        context["total_users"] = User.objects.count()
        context["total_admins"] = Profil.objects.filter(role=Profil.Role.ADMIN).count()
        context["total_chercheurs"] = Profil.objects.filter(role=Profil.Role.CHERCHEUR).count()
        context["total_etudiants"] = Profil.objects.filter(role=Profil.Role.ETUDIANT).count()
    return render(request, "users/dashboard.html", context)


@login_required
def profile(request):
    return render(request, "users/profile.html")


@admin_required
def user_list(request):
    query = request.GET.get("q", "")
    role = request.GET.get("role", "")

    users = User.objects.all().order_by("id")

    if query:
        users = users.filter(username__icontains=query) | \
                users.filter(first_name__icontains=query) | \
                users.filter(last_name__icontains=query) | \
                users.filter(email__icontains=query)

    if role:
        users = users.filter(profil__role=role)

    context = {
        "users": users,
        "query": query,
        "selected_role": role,
        "roles": Profil.Role.choices,
    }
    return render(request, "users/user_list.html", context)


@admin_required
def user_create(request):
    if request.method == "POST":
        username = request.POST.get("username")
        email = request.POST.get("email")
        first_name = request.POST.get("first_name", "")
        last_name = request.POST.get("last_name", "")
        password = request.POST.get("password")
        role = request.POST.get("role")

        user = User.objects.create_user(
            username=username, email=email, password=password,
            first_name=first_name, last_name=last_name
        )
        if role == Profil.Role.ADMIN:
            user.is_staff = True
            user.save()
        Profil.objects.create(user=user, role=role)

        messages.success(request, "Utilisateur ajouté avec succès.")
        return redirect("user_list")

    return render(
        request,
        "users/user_form.html",
        {"title": "Ajouter un utilisateur", "button_label": "Ajouter", "roles": Profil.Role.choices},
    )


@admin_required
def user_update(request, pk):
    user_obj = get_object_or_404(User, pk=pk)
    profil_obj, _ = Profil.objects.get_or_create(user=user_obj)

    if request.method == "POST":
        user_obj.username = request.POST.get("username")
        user_obj.email = request.POST.get("email")
        user_obj.first_name = request.POST.get("first_name", "")
        user_obj.last_name = request.POST.get("last_name", "")
        role = request.POST.get("role")

        if role == Profil.Role.ADMIN:
            user_obj.is_staff = True
        else:
            user_obj.is_staff = False
            user_obj.is_superuser = False
        user_obj.save()

        profil_obj.role = role
        profil_obj.save()

        messages.success(request, "Utilisateur modifié avec succès.")
        return redirect("user_list")

    return render(
        request,
        "users/user_form.html",
        {
            "title": "Modifier un utilisateur",
            "button_label": "Modifier",
            "user_obj": user_obj,
            "profil_obj": profil_obj,
            "roles": Profil.Role.choices,
        },
    )


@admin_required
def user_delete(request, pk):
    user_obj = get_object_or_404(User, pk=pk)

    if request.user.pk == user_obj.pk:
        messages.error(request, "Vous ne pouvez pas supprimer votre propre compte connecté.")
        return redirect("user_list")

    if request.method == "POST":
        user_obj.delete()
        messages.success(request, "Utilisateur supprimé avec succès.")
        return redirect("user_list")

    return render(request, "users/user_confirm_delete.html", {"user_obj": user_obj})