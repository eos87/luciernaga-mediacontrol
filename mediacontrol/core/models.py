# -*- coding: UTF-8 -*-

from django.db import models

class Profesion(models.Model):
    nombre = models.CharField(max_length=100)
    
    def __unicode__(self):
        return self.nombre
    
    class Meta:
        verbose_name = 'Profesion'
        verbose_name_plural = 'Profesiones'

class Organizacion(models.Model):
    nombre = models.CharField(max_length=100)

    def __unicode__(self):
        return self.nombre

    class Meta:
        verbose_name_plural = 'Organizaciones'

SEXOS = (('femenino', 'Femenino'), ('masculino', 'Masculino'))

class Persona(models.Model):
    nombre = models.CharField(max_length=100)
    apellido = models.CharField(max_length=100)
    sexo = models.CharField(max_length=10, choices=SEXOS)
    email = models.EmailField(blank=True, null=True)
    telefono = models.CharField(max_length=30, null=True, blank=True)
    organizacion = models.CharField(max_length=200)
    org2 = models.ForeignKey(Organizacion)
    profesion = models.ManyToManyField(Profesion)

    def __unicode__(self):
        return '%s %s' % (self.nombre, self.apellido)

    class Meta:
        verbose_name = 'Persona'
        verbose_name_plural = 'Personas'

class Tipo(models.Model):
    nombre = models.CharField(max_length=100)

    def __unicode__(self):
        return self.nombre

    class Meta:
        verbose_name = 'Tipo'
        verbose_name_plural = 'Tipos'

class Tematica(models.Model):
    nombre = models.CharField(max_length=150)

    def __unicode__(self):
        return self.nombre

    class Meta:
        verbose_name = 'Tematica'
        verbose_name_plural = 'Tematicas'

class Material(models.Model):
    codigo = models.CharField(max_length=100, unique=True)
    titulo = models.CharField(max_length=200)
    autor = models.CharField(max_length=100, null=True, blank=True)
    tematica = models.ManyToManyField(Tematica)
    tipo = models.ForeignKey(Tipo)
    cantidad = models.IntegerField()

    def __unicode__(self):
        return self.codigo + '-' + self.titulo

    class Meta:
        verbose_name = 'Material'
        verbose_name_plural = 'Materiales'

class Solicitud(models.Model):
    persona = models.ForeignKey(Persona)    
    fecha = models.DateTimeField()

    def __unicode__(self):
        return self.persona.nombre

    class Meta:
        verbose_name = 'Solicitud'
        verbose_name_plural = 'Solicitudes'    

class Agregado(models.Model):
    solicitud = models.ForeignKey(Solicitud)
    material = models.ForeignKey(Material)
    cantidad = models.IntegerField()

    def __unicode__(self):
        return ''
    
    class Meta:
        verbose_name_plural = 'Agregados'