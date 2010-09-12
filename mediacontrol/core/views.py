from django.http import HttpResponse
from django.http import HttpResponseRedirect
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.utils import simplejson
from django.db.models import Q
from django.views.decorators.cache import cache_page
from forms import *
from models import *

def index(request):
    return render_to_response('index.html', RequestContext(request, locals()))

def add_solicitud(request):
    flag = 'solicitud'
    a = request.GET.get('q', '')
    form = SolicitudForm()
    return render_to_response('solicitud.html', RequestContext(request, locals()))

def add_persona(request):
    flag = 'persona'
    solicitantes = Persona.objects.all().order_by('-id')
    if request.method == 'POST':
        form = PersonaForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect('/add/persona/#registrados')
    else:
        form = PersonaForm()
        
    return render_to_response('persona.html', RequestContext(request, locals()))

def edit_persona(request, id):
    flag = 'persona'
    solicitantes = Persona.objects.all().order_by('-id')
    edit = Persona.objects.get(pk=int(id))
    if request.method == 'POST':
        form = PersonaForm(request.POST, instance=edit)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect('/add/persona/#registrados')
    else:
        form = PersonaForm(instance=edit)

    return render_to_response('persona.html', RequestContext(request, locals()))

def add_material(request):
    flag = 'material'
    materiales = Material.objects.all().order_by('-id')
    
    if request.method == 'POST':
        form = MaterialForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect('/add/material/#registrados')
    else:
        form = MaterialForm()
        
    return render_to_response('material.html', RequestContext(request, locals()))

def edit_material(request, id):
    flag = 'material'
    materiales = Material.objects.all().order_by('-id')
    material = Material.objects.get(pk=id)
    if request.method == 'POST':
        form = MaterialForm(request.POST, instance=material)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect('/add/material/#registrados')
    else:
        form = MaterialForm(instance=material)

    return render_to_response('material.html', RequestContext(request, locals()))

def add_otros(request):
    flag = 'otros'
    if request.method == 'POST':
        form = ProfesionForm(request.POST)
        if form.is_valid():
            form.save()
            return HttpResponseRedirect('/add/otros/')
    else:
        form = ProfesionForm()
        form_tipo = TipoForm()
        form_tematica = TematicaForm()
    return render_to_response('otros.html', RequestContext(request, locals()))

def add_otros_edit(request, id):
    flag = 'otros'
    pro = Profesion.objects.get(pk=id)
    if request.method == 'POST':
        form = ProfesionForm(request.POST, instance=pro)
        form_tipo = TipoForm()
        form_tematica = TematicaForm()

        if form.is_valid():
            pro.nombre = form.cleaned_data['nombre']
            pro.save()
            return HttpResponseRedirect('/add/otros/')
    else:
        form = ProfesionForm(instance=pro)
        form_tipo = TipoForm()
        form_tematica = TematicaForm()

    return render_to_response('otros_edit_profesion.html', RequestContext(request, locals()))

def add_otros_tematica(request):
    flag = 'otros'
    if request.method == 'POST':
        form_tematica = TematicaForm(request.POST)
        if form_tematica.is_valid():
            form_tematica.save()
            return HttpResponseRedirect('/add/otros/')
    else:
        form = ProfesionForm()
        form_tipo = TipoForm()
        form_tematica = TematicaForm()
    return render_to_response('otros.html', RequestContext(request, locals()))

def add_otros_tematica_edit(request, id):
    flag = 'otros'
    obj = Tematica.objects.get(pk=id)
    if request.method == 'POST':
        form = ProfesionForm()
        form_tipo = TipoForm()
        form_tematica = TematicaForm(request.POST, instance=obj)

        if form_tematica.is_valid():
            obj.nombre = form_tematica.cleaned_data['nombre']
            obj.save()
            return HttpResponseRedirect('/add/otros/')
    else:
        form = ProfesionForm()
        form_tipo = TipoForm()
        form_tematica = TematicaForm(instance=obj)

    return render_to_response('otros_edit_tematica.html', RequestContext(request, locals()))

def add_otros_tipo(request):
    flag = 'otros'
    if request.method == 'POST':
        form_tipo = TipoForm(request.POST)
        if form_tipo.is_valid():
            form_tipo.save()
            return HttpResponseRedirect('/add/otros/')
    else:
        form = ProfesionForm()
        form_tipo = TipoForm()
        form_tematica = TematicaForm()
    return render_to_response('otros.html', RequestContext(request, locals()))

def add_otros_tipo_edit(request, id):
    flag = 'otros'
    obj = Tipo.objects.get(pk=id)
    if request.method == 'POST':
        form = ProfesionForm()
        form_tipo = TipoForm(request.POST, instance=obj)
        form_tematica = TematicaForm()

        if form_tipo.is_valid():
            obj.nombre = form_tipo.cleaned_data['nombre']
            obj.save()
            return HttpResponseRedirect('/add/otros/')
    else:
        form = ProfesionForm()
        form_tipo = TipoForm(instance=obj)
        form_tematica = TematicaForm()

    return render_to_response('otros_edit_tipo.html', RequestContext(request, locals()))


def load(request):

    query = request.GET.get('q')
    qset = (
            Q(nombre__icontains=query) |
            Q(apellido__icontains=query)
            )

    if query:
        personas = Persona.objects.filter(qset).distinct()
    else:
        personas = Persona.objects.all()
        
    return render_to_response('load.html', RequestContext(request, locals()))

# Vistas para funciones de busqueda
def buscar_solicitud(request):
    flag = 'solicitud'
    query = request.GET.get('q')
    limit = request.GET.get('limit', 15)
    try:
        limit = int(limit)
    except ValueError:
        return HttpResponseBadRequest()

    qset = (
            Q(nombre__icontains=query) |
            Q(apellido__icontains=query)
            )
    personas = Persona.objects.filter(qset).distinct()[:limit]
    return render_to_response('buscar.html', RequestContext(request, locals()))



# Se vienen las vistas que son consultadas por medio de ajax
#autocomplete
def get_materiales(request):

    def iter_results(results):
        if results:
            for r in results:
                yield '%s-%s|%s|%s|%s|%s|%s\n' % (r.codigo, r.titulo, r.codigo, r.titulo, r.autor, r.tipo, r.id)

    if not request.GET.get('q'):
        return HttpResponse(mimetype='text/plain')

    query = request.GET.get('q')
    limit = request.GET.get('limit', 15)
    try:
        limit = int(limit)
    except ValueError:
        return HttpResponseBadRequest()

    qset = (
            Q(titulo__icontains=query) |
            Q(codigo__icontains=query)
            )
    materiales = Material.objects.filter(qset).distinct()[:limit]
    #lista = [(p.id, p.nombre, p.apellido) for p in personas]

    return HttpResponse(iter_results(materiales), mimetype='text/plain')

autocomplete = cache_page(get_materiales, 60 * 60)

def get_profesiones(request):
    profesiones = Profesion.objects.all().order_by('id')
    lista = [(profesion.id, profesion.nombre) for profesion in profesiones]
    return HttpResponse(simplejson.dumps(lista), mimetype='application/javascript')

def get_tipos(request):
    tipos = Tipo.objects.all().order_by('id')
    lista = [(tipo.id, tipo.nombre) for tipo in tipos]
    return HttpResponse(simplejson.dumps(lista), mimetype='application/javascript')

def get_tematicas(request):
    tematicas = Tematica.objects.all().order_by('id')
    lista = [(tematica.id, tematica.nombre) for tematica in tematicas]
    return HttpResponse(simplejson.dumps(lista), mimetype='application/javascript')

def del_profesiones(request, id):
    profesion = Profesion.objects.get(pk=int(id))
    profesion.delete()
    return HttpResponse('Registro Eliminado', mimetype='text/html')

def del_tipo(request, id):
    tipo = Tipo.objects.get(pk=int(id))
    tipo.delete()
    return HttpResponse('Registro Eliminado', mimetype='text/html')

def del_tematica(request, id):
    tema = Tematica.objects.get(pk=int(id))
    tema.delete()
    return HttpResponse('Registro Eliminado', mimetype='text/html')

def del_material(request, id):
    material = Material.objects.get(pk=int(id))
    material.delete()
    return HttpResponse('Registro Eliminado', mimetype='text/html')

def del_persona(request, id):
    persona = Persona.objects.get(pk=int(id))
    persona.delete()
    return HttpResponse('Registro Eliminado', mimetype='text/html')
