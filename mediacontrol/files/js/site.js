$(document).ready(function(){
    $.cookie('url', '?q=');
    $('#view_pro').click(function(){
        getProfesion();
        return false;
    });
    $('#view_tipos').click(function(){
        getTipos();
        return false;
    });
    $('#view_temas').click(function(){
        getTematicas();
        return false;
    });
    $('#id_fecha').val(getDateTime());

    //Load modal window
    $('#id_persona').click(function(){
        openWindow('load');
    });
    $('#id_material').autocomplete('/ajax/personas/').result(function(evt, data, formatted){
        var url = $.cookie('url');
        var id = data[5];
        var cant = data[6];
        //$('#osx-modal-title').html('Cantidad | ' + data[2] + ' | Máx.'+ data[6]);
        //$('#osx-modal-data').InitOSX(); sustituido por javascript prompt
        if(url.search(id+':')!=-1){
            alert('Ya has agregado ese material');
            $('#id_material').val('');
        }else{
            var cant2 = getCant(cant);
            if (cant2 != null){
                var lista = '<tr><td><a href="" onclick="$(this).parent().parent().remove(); Remove('+data[5]+','+cant2+'); return false;"><img src="/files/images/borrar.png" alt="borrar">Borrar</a></td>';
                lista += '<td>'+data[1]+'</td><td>'+data[2]+'</td><td>'+data[3]+'</td><td>'+data[4]+'</td><td>'+cant2+' </td></tr>';
                $('.mostrar tbody').append(lista);
                $('#id_material').val('');
                add2URL(id, cant2);
            }
        }
    });
    $('#submit, #submit_reporte').click(function(){
        var url = $.cookie('url');
        var user = $('#id_userid').val();
        var fecha = $('#id_fecha').val();
        
        if ((user=='') || (fecha=='')){
            alert('El campo y fecha son obligatorios.');
        }else if(url=='?q='){
            alert('Debes agregar al menos un material.');
        }
        else{
            if($(this).attr('id')=='submit_reporte'){
                url += '&user='+user+'&date='+fecha+'&r=1';
            }else{
                url += '&user='+user+'&date='+fecha;
            }
        }        
        if(url!='?q='){
            $.getJSON(url,
                function(data){
                    window.location.href = data;
                });
            }
        return false;
        
    });
});

function getCant(cant){
    var cant2 = prompt('Introduzca una cantidad. Máx '+cant,'');
    if (cant2 == null){
        
    }else if(cant2 == ''){
        alert('Debes ingresar una cantidad');
        return getCant(cant);
    }else if(parseInt(cant2) > parseInt(cant)){
        alert('Limite excedido');
        return getCant(cant);
    }else{
        return cant2;
    }
}

function add2URL(id, cant2){
    var url = $.cookie('url');
    if (url == '?q='){
        url += ''+id+':'+ cant2;
        $.cookie('url', url);
    }else{
        url += ','+id+':'+ cant2;
        $.cookie('url', url);
    }
}

function Remove(id, cant2){
    var url = $.cookie('url');
    var a = url.search(','+id+':'+cant2+',');
    if (a != -1){
        url = url.replace(','+id+':'+cant2, '');
    }else if(url.search('='+id+':'+cant2+',')!=-1){
        url = url.replace(id+':'+cant2+',', '');
    }else if(url.search(','+id+':'+cant2)!=-1){
        url = url.replace(','+id+':'+cant2, '');
    }else{
        url = url.replace(id+':'+cant2, '');
    }
    $.cookie('url', url);
}

function getDateTime(){
    var date = new Date();
    var anio = date.getFullYear();
    var mes = date.getMonth();
    if(parseInt(mes)<10){
        mes = '0'+mes;
    }
    var dia = date.getDate();
    if(parseInt(dia)<10){
        dia = '0'+dia;
    }
    var hours = date.getHours();
    if(parseInt(hours)<10){
        hours = '0'+hours;
    }
    var mins = date.getMinutes();
    if(parseInt(mins)<10){
        mins = '0'+mins;
    }
    var secs = date.getSeconds();
    if(parseInt(secs)<10){
        secs = '0'+secs;
    }
    var fecha = anio+'-'+mes+'-'+dia+' '+hours+':'+mins+':'+secs;
    return fecha;
}

function Borrar(id){
    if (confirm("Deseas eliminar este registro?")) {
        $.get("/ajax/borrar-profesion/"+ id + '/',
            function(data){
                alert(data);
                getProfesion();
            }
            );
    }
}

function Borrar_tipo(id){
    if (confirm("Deseas eliminar este registro?")) {
        $.get("/ajax/borrar-tipo/"+ id + '/',
            function(data){
                alert(data);
                getTipos();
            }
            );
    }
}

function Borrar_tema(id){
    if (confirm("Deseas eliminar este registro?")) {
        $.get("/ajax/borrar-tematica/"+ id + '/',
            function(data){
                alert(data);
                getTematicas();
            }
            );
    }
}

function Borrar_material(id){
    if (confirm("Deseas eliminar este registro?")) {
        $.get("/ajax/borrar-material/"+ id + '/',
            function(data){
                alert(data);
                window.location.reload();
            }
            );
    }
}

function Borrar_persona(id){
    if (confirm("Deseas eliminar este registro?")) {
        $.get("/ajax/borrar-solicitante/"+ id + '/',
            function(data){
                alert(data);
                window.location = '/add/persona/';
            }
            );
    }
}

function getProfesion(){
    $.getJSON("/ajax/profesion/",
        function(data){
            var lista = '<table class="mostrar"><caption>Profesiones</caption><thead><tr><th>Id</th><th>Nombre</th><th>Acciones</th></tr></thead><tbody>';
            for(i=0; i< data.length; i++){
                lista += '<tr><td>'+ data[i][0] +'</td><td>'+ data[i][1] +'</td><td><a href="/add/otros/'+ data[i][0] +'/" style="color: #069;"><img src="/files/images/editar2.png">Editar</a> | <a href="javascript:Borrar('+ data[i][0] +');" style="color: #069;"><img src="/files/images/borrar.png" alt="borrar">Borrar</a></td></tr>';
            }
            lista += '</tbody></table>';
            $('#resultado').html(lista);
        });
}	

function getTipos(){
    $.getJSON("/ajax/tipos/",
        function(data){
            var lista = '<table class="mostrar"><caption>Tipos de Material</caption><thead><tr><th>Id</th><th>Nombre</th><th>Acciones</th></tr></thead><tbody>';
            for(i=0; i< data.length; i++){
                lista += '<tr><td>'+ data[i][0] +'</td><td>'+ data[i][1] +'</td><td><a href="/add/otros/tipo/'+ data[i][0] +'/" style="color: #069;"><img src="/files/images/editar2.png">Editar</a> | <a href="javascript:Borrar_tipo('+ data[i][0] +');" style="color: #069;"><img src="/files/images/borrar.png" alt="borrar">Borrar</a></td></tr>';
            }
            lista += '</tbody></table>';
            $('#resultado').html(lista);
        });
}

function getTematicas(){
    $.getJSON("/ajax/tematica/",
        function(data){
            var lista = '<table class="mostrar"><caption>Tematica</caption><thead><tr><th>Id</th><th>Nombre</th><th>Acciones</th></tr></thead><tbody>';
            for(i=0; i< data.length; i++){
                lista += '<tr><td>'+ data[i][0] +'</td><td>'+ data[i][1] +'</td><td><a href="/add/otros/tematica/'+ data[i][0] +'/" style="color: #069;"><img src="/files/images/editar2.png">Editar</a> | <a href="javascript:Borrar_tema('+ data[i][0] +');" style="color: #069;"><img src="/files/images/borrar.png" alt="borrar">Borrar</a></td></tr>';
            }
            lista += '</tbody></table>';
            $('#resultado').html(lista);
        });
}

//Funcion para abri el modal window
function openWindow(id){
    $('#'+id).modal({
        opacity:60,
        onOpen: function (dialog) {
            dialog.overlay.fadeIn('fast', function () {
                dialog.data.hide();
                dialog.container.fadeIn('fast', function () {
                    dialog.data.slideDown('fast');
                });
            });
        },
        containerCss:{
            height:430,
            width:670
        },
        onClose: function (dialog) {
            dialog.data.fadeOut('slow', function () {
                dialog.container.hide('slow', function () {
                    dialog.overlay.slideUp('slow', function () {
                        $.modal.close();
                    });
                });
            });
        }
    })
}
