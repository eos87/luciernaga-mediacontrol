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
        var s = url.search(id+':');       
        if (s!=-1){
            var sub = url.substring(s,s+3);            
            var cant = sub.split(':')[1];
            var cant2 = parseInt(cant) + 1;            
            url = url.replace(id+':'+cant, id+':'+cant2);
            $.cookie('url', url);
        }else{
            if (url == '?q='){
                url += ''+id+':1';
                $.cookie('url', url);
            }else{
                url += ','+id+':1';
                $.cookie('url', url);
            }
        }        
        var lista = '<tr><td><a href="" onclick="$(this).parent().parent().remove(); Remove('+data[5]+'); return false;"><img src="/files/images/borrar.png" alt="borrar">Borrar</a></td>';
        lista += '<td>'+data[1]+'</td><td>'+data[2]+'</td><td>'+data[3]+'</td><td>'+data[4]+'</td></td>';
        $('.mostrar tbody').append(lista);        
        $('#id_material').val('');        
    });
    $('#submit').click(function(){
        var url = $.cookie('url');
        var user = $('#id_userid').val();
        var fecha = $('#id_fecha').val();
        if ((user=='') || (fecha=='')){
            alert('El campo y fecha son obligatorios.');
        }else{
            url += '&user='+user+'&date='+fecha;
        }
        alert(url);
        return false;
    });
});

function Remove(id){
    var url = $.cookie('url');
    var s = url.search(id+':');
    var sub = url.substring(s,s+3);
    var cant = sub.split(':')[1];
    if (parseInt(cant) > 1){
        var cant2 = parseInt(cant) - 1;
        url = url.replace(id+':'+cant, id+':'+cant2);
    }else{
        if ((url.search(id+':'+cant+','))!=-1){
            url = url.replace(id+':'+cant+',', '');
        }
        else if((url.search(','+id+':'+cant))!=-1){
            url = url.replace(','+id+':'+cant, '');
        }
        else{
            url = url.replace(id+':'+cant, '');
        }
    }
    $.cookie('url', url);
}

function getDateTime(){
    var date = new Date();
    var anio = date.getFullYear();
    var mes = date.getMonth();
    var dia = date.getDate();
    var hours = date.getHours();
    var mins = date.getMinutes();
    var secs = date.getSeconds();

    var fecha = anio+'-0'+mes+'-0'+dia+' '+hours+':'+mins+':'+secs;
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
