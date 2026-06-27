# On importe render pour afficher une page HTML
# et redirect pour rediriger vers une autre page
from django.shortcuts import render, redirect

# authenticate = vérifier le nom d'utilisateur et le mot de passe
# login = connecter l'utilisateur
# logout = déconnecter l'utilisateur
from django.contrib.auth import authenticate, login, logout

# messages permet d'afficher des messages à l'utilisateur
from django.contrib import messages

# On importe le formulaire d'inscription
from .forms import SignUpForm
from .models import Record, Chercheur, ProjetRecherche

# ---------------- PAGE D'ACCUEIL ----------------
def home(request):
    if request.user.is_authenticated:
        return render(request, 'core/home.html')
    if request.method == "POST":
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            messages.success(request, "Bien authentifié")
            return redirect('home')
        else:
            messages.success(request, "Erreur d'authentification")
            return redirect('home')
    return render(request, 'core/home.html')

def projets_dashboard(request):
    if request.user.is_authenticated:
        total_projets = ProjetRecherche.objects.count()
        en_cours = ProjetRecherche.objects.filter(statut='en_cours').count()
        termines = ProjetRecherche.objects.filter(statut='termine').count()
        planifies = ProjetRecherche.objects.filter(statut='planifie').count()
        suspendus = ProjetRecherche.objects.filter(statut='suspendu').count()
        total_chercheurs = Chercheur.objects.count()
        derniers_projets = ProjetRecherche.objects.order_by('-created_at')[:5]
        return render(request, 'core/dashboard_projet.html', {
            'total_projets': total_projets,
            'en_cours': en_cours,
            'termines': termines,
            'planifies': planifies,
            'suspendus': suspendus,
            'total_chercheurs': total_chercheurs,
            'derniers_projets': derniers_projets,
        })
    else:
        return redirect('home')


# ---------------- PAGE LOGIN ----------------
def login_user(request):

    # pass signifie :
    # aucun code pour le moment
    pass


# ---------------- DÉCONNEXION ----------------
def logout_user(request):

    # Déconnexion de l'utilisateur
    logout(request)

    # Message de succès
    messages.success(
        request,
        "Déconnexion effectuée"
    )

    # Retour vers la page home
    return redirect('home')


# ---------------- INSCRIPTION ----------------
def register_user(request):

    # Vérifie si le formulaire est envoyé
    if request.method == "POST":

        # Création du formulaire avec les données envoyées
        f = SignUpForm(request.POST)

        # Vérifie si le formulaire est valide
        if f.is_valid():

            # Sauvegarde du nouvel utilisateur
            f.save()

            # Récupération des données nettoyées
            username = f.cleaned_data['username']
            password = f.cleaned_data['password1']

            # Vérification du nouvel utilisateur
            user = authenticate(
                username=username,
                password=password
            )

            # Connexion automatique après inscription
            login(request, user)

            # Message de succès
            messages.success(
                request,
                "Bien inscrit !!!"
            )

            # Redirection vers home
            return redirect('home')

    else:
        # Si la page est juste ouverte
        # on crée un formulaire vide
        f = SignUpForm()

    # Affichage de la page register.html
    # avec le formulaire
    return render(
        request,
        'core/register.html',
        {'form': f}
    )
def customer_record(request, pk):
    if request.user.is_authenticated:
        cs=Record.objects.get(id=pk)
        return render(request, 'core/record.html', {'customer_record': cs})
    else:
        messages.success(request,"Vous devez s'authentifier pour acceder a cette page")
        return redirect('home')
def delete_record(request, pk):
    if request.user.is_authenticated:
        delete_it=Record.objects.get(id=pk)
        delete_it.delete()
        messages.success(request, "Le record est bien supprime...")
        return redirect('home')
    else:
        messages.success(request, "Vous devez s'authentifier pour acceder a cette page")
        return redirect('home')
    
# ---------------- PROJETS DE RECHERCHE ----------------
def liste_projets(request):
    if request.user.is_authenticated:
        projets = ProjetRecherche.objects.all()
        return render(request, 'core/projets.html', {'projets': projets})
    else:
        messages.success(request, "Vous devez vous authentifier")
        return redirect('home')

def creer_projet(request):
    if request.user.is_authenticated:
        if request.method == "POST":
            projet = ProjetRecherche(
                titre=request.POST['titre'],
                description=request.POST['description'],
                statut=request.POST['statut'],
                date_debut=request.POST['date_debut'],
                date_fin=request.POST.get('date_fin') or None,
                budget=request.POST.get('budget') or None,
            )
            projet.save()
            chercheurs_ids = request.POST.getlist('chercheurs')
            projet.chercheurs.set(chercheurs_ids)
            messages.success(request, "Projet créé avec succès")
            return redirect('liste_projets')
        chercheurs = Chercheur.objects.all()
        return render(request, 'core/creer_projet.html', {'chercheurs': chercheurs})
    else:
        messages.success(request, "Vous devez vous authentifier")
        return redirect('home')

def detail_projet(request, pk):
    if request.user.is_authenticated:
        projet = ProjetRecherche.objects.get(id=pk)
        return render(request, 'core/detail_projet.html', {'projet': projet})
    else:
        messages.success(request, "Vous devez vous authentifier")
        return redirect('home')

def editer_projet(request, pk):
    if request.user.is_authenticated:
        projet = ProjetRecherche.objects.get(id=pk)
        if request.method == "POST":
            projet.titre = request.POST['titre']
            projet.description = request.POST['description']
            projet.statut = request.POST['statut']
            projet.date_debut = request.POST.get('date_debut') or projet.date_debut
            projet.date_fin = request.POST.get('date_fin') or None
            projet.budget = request.POST.get('budget') or None
            projet.save()
            chercheurs_ids = request.POST.getlist('chercheurs')
            projet.chercheurs.set(chercheurs_ids)
            messages.success(request, "Projet modifié avec succès")
            return redirect('liste_projets')
        chercheurs = Chercheur.objects.all()
        return render(request, 'core/editer_projet.html', {'projet': projet, 'chercheurs': chercheurs})
    else:
        messages.success(request, "Vous devez vous authentifier")
        return redirect('home')

def eliminer_projet(request, pk):
    if request.user.is_authenticated:
        projet = ProjetRecherche.objects.get(id=pk)
        projet.delete()
        messages.success(request, "Projet supprimé")
        return redirect('liste_projets')
    else:
        messages.success(request, "Vous devez vous authentifier")
        return redirect('home')

# ---------------- CHERCHEURS ----------------
def liste_chercheurs(request):
    if request.user.is_authenticated:
        chercheurs = Chercheur.objects.all()
        return render(request, 'core/liste_chercheurs.html', {'chercheurs': chercheurs})
    else:
        messages.success(request, "Vous devez vous authentifier")
        return redirect('home')

def creer_chercheur(request):
    if request.user.is_authenticated:
        if request.method == "POST":
            chercheur = Chercheur(
                nom=request.POST['nom'],
                prenom=request.POST['prenom'],
                email=request.POST['email'],
                specialite=request.POST['specialite'],
            )
            chercheur.save()
            messages.success(request, "Chercheur ajouté avec succès")
            return redirect('liste_chercheurs')
        return render(request, 'core/creer_chercheur.html')
    else:
        messages.success(request, "Vous devez vous authentifier")
        return redirect('home')

def supprimer_chercheur(request, pk):
    if request.user.is_authenticated:
        chercheur = Chercheur.objects.get(id=pk)
        chercheur.delete()
        messages.success(request, "Chercheur supprimé")
        return redirect('liste_chercheurs')
    else:
        messages.success(request, "Vous devez vous authentifier")
        return redirect('home')
def editer_chercheur(request, pk):
    if request.user.is_authenticated:
        chercheur = Chercheur.objects.get(id=pk)
        if request.method == "POST":
            chercheur.nom = request.POST['nom']
            chercheur.prenom = request.POST['prenom']
            chercheur.email = request.POST['email']
            chercheur.specialite = request.POST['specialite']
            chercheur.save()
            messages.success(request, "Chercheur modifié avec succès")
            return redirect('liste_chercheurs')
        return render(request, 'core/editer_chercheur.html', {'chercheur': chercheur})
    else:
        messages.success(request, "Vous devez vous authentifier")
        return redirect('home')
    
def liste_projets(request):
    if request.user.is_authenticated:
        query = request.GET.get('q', '')
        statut = request.GET.get('statut', '')
        projets = ProjetRecherche.objects.all()
        if query:
            projets = projets.filter(titre__icontains=query)
        if statut:
            projets = projets.filter(statut=statut)
        return render(request, 'core/projets.html', {
            'projets': projets,
            'query': query,
            'statut': statut,
        })
    else:
        messages.success(request, "Vous devez vous authentifier")
        return redirect('home')