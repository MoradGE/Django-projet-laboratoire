from django import forms

from .models import MaterielRecherche, ReservationMateriel


class MaterielRechercheForm(forms.ModelForm):
    class Meta:
        model = MaterielRecherche
        fields = ['nom', 'reference', 'laboratoire', 'description', 'etat']
        widgets = {
            'description': forms.Textarea(attrs={'rows': 4, 'class': 'form-control'}),
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field_name, field in self.fields.items():
            if field_name not in self.Meta.widgets:
                field.widget.attrs.update({'class': 'form-control'})


class ReservationMaterielForm(forms.ModelForm):
    class Meta:
        model = ReservationMateriel
        fields = [
            'materiel',
            'demandeur',
            'email_demandeur',
            'date_debut',
            'date_fin',
            'motif',
        ]
        widgets = {
            'date_debut': forms.DateTimeInput(attrs={'type': 'datetime-local', 'class': 'form-control'}),
            'date_fin': forms.DateTimeInput(attrs={'type': 'datetime-local', 'class': 'form-control'}),
            'motif': forms.Textarea(attrs={'rows': 4, 'class': 'form-control'}),
        }

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        for field_name, field in self.fields.items():
            if field_name not in self.Meta.widgets:
                field.widget.attrs.update({'class': 'form-control'})
