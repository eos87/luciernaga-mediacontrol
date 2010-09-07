from django import forms as forms
from models import *
import datetime


class SolicitudForm(forms.ModelForm):
    persona = forms.CharField(max_length=200, label='Solicitante')
    material = forms.CharField(max_length=200)
    userid = forms.CharField(max_length=50, widget=forms.HiddenInput())
    #fecha = forms.DateTimeField(initial=datetime.datetime.now())
    class Meta:
        model = Solicitud
        fields = ['persona', 'material', 'fecha']   

class MaterialForm(forms.ModelForm):
    tematica = forms.ModelMultipleChoiceField(queryset=Tematica.objects.all(), widget=forms.CheckboxSelectMultiple, help_text="")
    class Meta:
        model = Material
        #widgets = {'tematica': forms.CheckboxSelectMultiple}

class PersonaForm(forms.ModelForm):
    profesion = forms.ModelMultipleChoiceField(queryset=Profesion.objects.all(), widget=forms.CheckboxSelectMultiple, help_text="")
    class Meta:
        model = Persona
        
class ProfesionForm(forms.ModelForm):
    class Meta:
        model = Profesion

class TipoForm(forms.ModelForm):
    class Meta:
        model = Tipo

class TematicaForm(forms.ModelForm):
    class Meta:
        model = Tematica
