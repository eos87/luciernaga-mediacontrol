# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Adding model 'Organizacion'
        db.create_table('core_organizacion', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('nombre', self.gf('django.db.models.fields.CharField')(max_length=100)),
        ))
        db.send_create_signal('core', ['Organizacion'])


    def backwards(self, orm):
        
        # Deleting model 'Organizacion'
        db.delete_table('core_organizacion')


    models = {
        'core.agregado': {
            'Meta': {'object_name': 'Agregado'},
            'cantidad': ('django.db.models.fields.IntegerField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'material': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['core.Material']"}),
            'solicitud': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['core.Solicitud']"})
        },
        'core.material': {
            'Meta': {'object_name': 'Material'},
            'autor': ('django.db.models.fields.CharField', [], {'max_length': '100', 'null': 'True', 'blank': 'True'}),
            'cantidad': ('django.db.models.fields.IntegerField', [], {}),
            'codigo': ('django.db.models.fields.CharField', [], {'unique': 'True', 'max_length': '100'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'tematica': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['core.Tematica']", 'symmetrical': 'False'}),
            'tipo': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['core.Tipo']"}),
            'titulo': ('django.db.models.fields.CharField', [], {'max_length': '200'})
        },
        'core.organizacion': {
            'Meta': {'object_name': 'Organizacion'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'nombre': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'core.persona': {
            'Meta': {'object_name': 'Persona'},
            'apellido': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75', 'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'nombre': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'organizacion': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'profesion': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['core.Profesion']", 'symmetrical': 'False'}),
            'sexo': ('django.db.models.fields.CharField', [], {'max_length': '10'}),
            'telefono': ('django.db.models.fields.CharField', [], {'max_length': '30', 'null': 'True', 'blank': 'True'})
        },
        'core.profesion': {
            'Meta': {'object_name': 'Profesion'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'nombre': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        },
        'core.solicitud': {
            'Meta': {'object_name': 'Solicitud'},
            'fecha': ('django.db.models.fields.DateTimeField', [], {}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'persona': ('django.db.models.fields.related.ForeignKey', [], {'to': "orm['core.Persona']"})
        },
        'core.tematica': {
            'Meta': {'object_name': 'Tematica'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'nombre': ('django.db.models.fields.CharField', [], {'max_length': '150'})
        },
        'core.tipo': {
            'Meta': {'object_name': 'Tipo'},
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'nombre': ('django.db.models.fields.CharField', [], {'max_length': '100'})
        }
    }

    complete_apps = ['core']
