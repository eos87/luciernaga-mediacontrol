# -*- coding: UTF-8 -*-

from django import forms as forms
from models import *


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
    org2 = forms.CharField(max_length=150, label='Organizacion2')
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

def get_months():
    s = Solicitud.objects.all().order_by('fecha')
    dicc = {
        1:'Enero',
        2:'Febrero',
        3:'Marzo',
        4:'Abril',
        5:'Mayo',
        6:'Junio',
        7:'Julio',
        8:'Agosto',
        9:'Septiembre',
        10:'Octubre',
        11:'Noviembre',
        12:'Diciembre'
    }
    choices = []
    meses = []
    for i in s:
        meses.append(int(i.fecha.month))    
    for a in sorted(list(set(meses))):
        lista = []
        lista.append(a)
        lista.append(dicc[int(a)])
        choices.append(lista)
    return choices

def get_years():
    s = Solicitud.objects.all()
    years = []
    data = []
    for a in s:
        years.append(a.fecha.year)
    for y in sorted(list(set(years))):
        lista = []
        lista.append(y)
        lista.append(str(y))
        data.append(lista)
    return data

class ReportForm(forms.Form):
    mes = forms.MultipleChoiceField(choices=get_months())
    anio = forms.ChoiceField(choices=get_years(), label='Año')    


VARS = (('sexo','Sexo'), ('organizacion', 'Organizacion'))
class VariablesForm(forms.Form):
    variable = forms.ChoiceField(choices=VARS, label='Seleccione la variable')
    anio = forms.ChoiceField(choices=get_years(), label='Año')