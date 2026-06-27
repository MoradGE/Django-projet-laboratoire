from django import forms
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User

from .models import Laboratoire, Membre, Responsable


class BootstrapFormMixin:
    """Apply Bootstrap classes to Django form widgets."""

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field in self.fields.values():
            widget = field.widget
            if isinstance(widget, forms.Select):
                css_class = "form-select"
            elif isinstance(widget, forms.CheckboxInput):
                css_class = "form-check-input"
            else:
                css_class = "form-control"

            existing_class = widget.attrs.get("class", "")
            widget.attrs["class"] = f"{existing_class} {css_class}".strip()


class UserRegisterForm(BootstrapFormMixin, UserCreationForm):
    email = forms.EmailField(label="Email", required=True)

    class Meta:
        model = User
        fields = ["username", "email", "password1", "password2"]
        labels = {
            "username": "Nom d'utilisateur",
            "password1": "Mot de passe",
            "password2": "Confirmation du mot de passe",
        }

    def save(self, commit=True):
        user = super().save(commit=False)
        user.email = self.cleaned_data["email"]
        if commit:
            user.save()
        return user


class LaboratoireForm(BootstrapFormMixin, forms.ModelForm):
    date_creation = forms.DateField(
        label="Date de creation",
        input_formats=["%Y-%m-%d"],
        widget=forms.DateInput(attrs={"type": "date"}, format="%Y-%m-%d"),
    )

    class Meta:
        model = Laboratoire
        fields = [
            "nom_laboratoire",
            "code_laboratoire",
            "domaine",
            "localisation",
            "description",
            "date_creation",
            "statut",
        ]
        labels = {
            "nom_laboratoire": "Nom du laboratoire",
            "code_laboratoire": "Code du laboratoire",
            "domaine": "Domaine",
            "localisation": "Localisation",
            "description": "Description",
            "statut": "Statut",
        }
        widgets = {
            "description": forms.Textarea(attrs={"rows": 4}),
        }


class ResponsableForm(BootstrapFormMixin, forms.ModelForm):
    class Meta:
        model = Responsable
        fields = ["nom", "prenom", "email", "telephone", "fonction", "laboratoire"]
        labels = {
            "nom": "Nom",
            "prenom": "Prenom",
            "email": "Email",
            "telephone": "Telephone",
            "fonction": "Fonction",
            "laboratoire": "Laboratoire",
        }


class MembreForm(BootstrapFormMixin, forms.ModelForm):
    class Meta:
        model = Membre
        fields = [
            "nom",
            "prenom",
            "email",
            "telephone",
            "role",
            "niveau",
            "statut",
            "laboratoire",
        ]
        labels = {
            "nom": "Nom",
            "prenom": "Prenom",
            "email": "Email",
            "telephone": "Telephone",
            "role": "Role",
            "niveau": "Niveau",
            "statut": "Statut",
            "laboratoire": "Laboratoire",
        }
