from django.conf.urls.defaults import *
from django.contrib import admin
admin.autodiscover()

import os
PROJECT_DIR = os.path.dirname(__file__)

urlpatterns = patterns('',
                       (r'^files/(?P<path>.*)$', 'django.views.static.serve', {'document_root': PROJECT_DIR + '/files'}),
                       (r'^$', 'mediacontrol.core.views.index'),
                       (r'^add/solicitud/$', 'mediacontrol.core.views.add_solicitud'),
                       (r'^add/persona/$', 'mediacontrol.core.views.add_persona'),
                       (r'^edit/persona/(?P<id>[-\w]+)/$', 'mediacontrol.core.views.edit_persona'),
                       (r'^add/material/$', 'mediacontrol.core.views.add_material'),
                       (r'^edit/material/(?P<id>[-\w]+)/$', 'mediacontrol.core.views.edit_material'),
                       (r'^add/otros/$', 'mediacontrol.core.views.add_otros'),
                       (r'^add/otros/tipo/$', 'mediacontrol.core.views.add_otros_tipo'),
                       (r'^add/otros/tipo/(?P<id>[-\w]+)/$', 'mediacontrol.core.views.add_otros_tipo_edit'),
                       (r'^add/otros/tematica/$', 'mediacontrol.core.views.add_otros_tematica'),
                       (r'^add/otros/tematica/(?P<id>[-\w]+)/$', 'mediacontrol.core.views.add_otros_tematica_edit'),
                       (r'^add/otros/(?P<id>[-\w]+)/$', 'mediacontrol.core.views.add_otros_edit'),
                       (r'^load/$', 'mediacontrol.core.views.load'),
                       (r'^load/registrar/$', 'mediacontrol.core.views.registrar'),
                       (r'^reporte/(?P<id>[-\w]+)/$', 'mediacontrol.core.views.reportar'),
                       (r'^reportes/$', 'mediacontrol.core.views.reportes'),
                       (r'^reportes/materiales/$', 'mediacontrol.core.views.material_report'),
                       (r'^graficos/$', 'mediacontrol.core.views.graficos'),

                       #vistas para busqueda
                       (r'^buscar/solicitud/$', 'mediacontrol.core.views.buscar_solicitud'),

                       #URLs para las vistas relacionadas con ajax
                       (r'^ajax/profesion/$', 'mediacontrol.core.views.get_profesiones'),
                       (r'^ajax/personas/$', 'mediacontrol.core.views.get_materiales'),
                       (r'^ajax/org2/$', 'mediacontrol.core.views.get_orgs'),
                       (r'^ajax/tematica/$', 'mediacontrol.core.views.get_tematicas'),
                       (r'^ajax/tipos/$', 'mediacontrol.core.views.get_tipos'),
                       (r'^ajax/borrar-profesion/(?P<id>[-\w]+)/$', 'mediacontrol.core.views.del_profesiones'),
                       (r'^ajax/borrar-tipo/(?P<id>[-\w]+)/$', 'mediacontrol.core.views.del_tipo'),
                       (r'^ajax/borrar-tematica/(?P<id>[-\w]+)/$', 'mediacontrol.core.views.del_tematica'),
                       (r'^ajax/borrar-material/(?P<id>[-\w]+)/$', 'mediacontrol.core.views.del_material'),
                       (r'^ajax/borrar-solicitante/(?P<id>[-\w]+)/$', 'mediacontrol.core.views.del_persona'),

                       (r'^login/$', 'django.contrib.auth.views.login', {'template_name': 'login.html'}),
                       (r'^logout/$', 'django.contrib.auth.views.logout', {'template_name': 'logout.html'}),
                       (r'^admin/', include(admin.site.urls)),
                       )
