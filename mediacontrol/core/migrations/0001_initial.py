# encoding: utf-8
import datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models

class Migration(SchemaMigration):

    def forwards(self, orm):
        
        # Adding model 'Profesion'
        db.create_table('core_profesion', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('nombre', self.gf('django.db.models.fields.CharField')(max_length=100)),
        ))
        db.send_create_signal('core', ['Profesion'])

        # Adding model 'Persona'
        db.create_table('core_persona', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('nombre', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('apellido', self.gf('django.db.models.fields.CharField')(max_length=100)),
            ('email', self.gf('django.db.models.fields.EmailField')(max_length=75, null=True, blank=True)),
            ('telefono', self.gf('django.db.models.fields.CharField')(max_length=30, null=True, blank=True)),
            ('organizacion', self.gf('django.db.models.fields.CharField')(max_length=200)),
        ))
        db.send_create_signal('core', ['Persona'])

        # Adding M2M table for field profesion on 'Persona'
        db.create_table('core_persona_profesion', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('persona', models.ForeignKey(orm['core.persona'], null=False)),
            ('profesion', models.ForeignKey(orm['core.profesion'], null=False))
        ))
        db.create_unique('core_persona_profesion', ['persona_id', 'profesion_id'])

        # Adding model 'Tipo'
        db.create_table('core_tipo', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('nombre', self.gf('django.db.models.fields.CharField')(max_length=100)),
        ))
        db.send_create_signal('core', ['Tipo'])

        # Adding model 'Tematica'
        db.create_table('core_tematica', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('nombre', self.gf('django.db.models.fields.CharField')(max_length=150)),
        ))
        db.send_create_signal('core', ['Tematica'])

        # Adding model 'Material'
        db.create_table('core_material', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('codigo', self.gf('django.db.models.fields.CharField')(unique=True, max_length=100)),
            ('titulo', self.gf('django.db.models.fields.CharField')(max_length=200)),
            ('autor', self.gf('django.db.models.fields.CharField')(max_length=100, null=True, blank=True)),
            ('tipo', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['core.Tipo'])),
            ('cantidad', self.gf('django.db.models.fields.IntegerField')()),
        ))
        db.send_create_signal('core', ['Material'])

        # Adding M2M table for field tematica on 'Material'
        db.create_table('core_material_tematica', (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('material', models.ForeignKey(orm['core.material'], null=False)),
            ('tematica', models.ForeignKey(orm['core.tematica'], null=False))
        ))
        db.create_unique('core_material_tematica', ['material_id', 'tematica_id'])

        # Adding model 'Solicitud'
        db.create_table('core_solicitud', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('persona', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['core.Persona'])),
            ('fecha', self.gf('django.db.models.fields.DateTimeField')()),
        ))
        db.send_create_signal('core', ['Solicitud'])

        # Adding model 'Agregado'
        db.create_table('core_agregado', (
            ('id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('solicitud', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['core.Solicitud'])),
            ('material', self.gf('django.db.models.fields.related.ForeignKey')(to=orm['core.Material'])),
            ('cantidad', self.gf('django.db.models.fields.IntegerField')()),
        ))
        db.send_create_signal('core', ['Agregado'])


    def backwards(self, orm):
        
        # Deleting model 'Profesion'
        db.delete_table('core_profesion')

        # Deleting model 'Persona'
        db.delete_table('core_persona')

        # Removing M2M table for field profesion on 'Persona'
        db.delete_table('core_persona_profesion')

        # Deleting model 'Tipo'
        db.delete_table('core_tipo')

        # Deleting model 'Tematica'
        db.delete_table('core_tematica')

        # Deleting model 'Material'
        db.delete_table('core_material')

        # Removing M2M table for field tematica on 'Material'
        db.delete_table('core_material_tematica')

        # Deleting model 'Solicitud'
        db.delete_table('core_solicitud')

        # Deleting model 'Agregado'
        db.delete_table('core_agregado')


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
        'core.persona': {
            'Meta': {'object_name': 'Persona'},
            'apellido': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'email': ('django.db.models.fields.EmailField', [], {'max_length': '75', 'null': 'True', 'blank': 'True'}),
            'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'nombre': ('django.db.models.fields.CharField', [], {'max_length': '100'}),
            'organizacion': ('django.db.models.fields.CharField', [], {'max_length': '200'}),
            'profesion': ('django.db.models.fields.related.ManyToManyField', [], {'to': "orm['core.Profesion']", 'symmetrical': 'False'}),
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
