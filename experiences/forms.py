from django import forms
from .models import Publication, Resultat


class PublicationForm(forms.ModelForm):
    class Meta:
        model = Publication
        fields = '__all__'


class ResultatForm(forms.ModelForm):
    class Meta:
        model = Resultat
        fields = '__all__'