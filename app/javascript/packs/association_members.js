import Bulma from '@vizuaalog/bulmajs';

$(document).on('click', '#add-association-member', function() {
  var user = $(this).data('shortname');
  var url = '/perfiles/' + user + '/asociaciones-y-redes';
  var valid = true;
  var start_date = $('#association_member_start_date').val();
  var activities = $('#association_member_activities').val();
  var association_id = $('#association_member_association_id').val();
  var errors = '';
  if (activities.length < 5) {
    errors += "Necesitas especificar la actividad realizada\n";
    valid = false
  }

  if (!(association_id > 0)) {
    errors += "Necesitas especificar la asociación\n";
    valid = false
  }

  if (!valid) {
    alert(errors);
  } else {
     $.post( url, { start_date: start_date, 
                 activities: activities,
                 association_id:  association_id
               })
    .done(function( data ) {
      var association_member_id = data.id;
      url = url + '/' + association_member_id + '/editar';
      window.location = url;
    })
  }
 
});


$(document).on('change', '#association_member_status', function() {
  $("#association-end").toggle();
});


var modal;
$(document).on("turbolinks:load", function() {
  modal = Bulma.create('modal', {
    root: document.getElementById('select-association-div'),
    title: 'Seleccionar asociación/red',
    body: '<div id="search-association-workarea"><div class="search-controls"><input type="text" placeholder="Nombre de la asociación o red..." id="association-title-select" class="input"></div><div id="association-list-select"></div></div>',
  });
});

$(document).on('click', '#select-association', function() {
  $('#association-title-select').val('');
  $('#association-list-select').html('');
  modal.open();
});

$(document).on('keyup', '#association-title-select', function() {
  var q = $('#association-title-select').val();
  if (q.length > 4) {
    var url = '/asociaciones/buscar?q=' + q;
    $.get(url, function(data) {
      $('#association-list-select').html(data);
    });
  }
});


$(document).on('click', '.association-list-item', function() {
  var association_id = $(this).data('id');
  $('#association_member_association_id').val(association_id);
  var url = '/asociaciones/datos/' + association_id;
    $.get(url, function(data) {
      $('#selected-association').html(data);
      modal.close();
    });
});

$(document).on('click', '#add-new-association', function() {
  var url = '/asociaciones/nueva/';
    $.get(url, function(data) {
      $('#search-association-workarea').html(data);
    });
});

$(document).on('click', '#submit-new-association', function() {
  $.post( "/asociaciones/agregar-nueva", { name: $('#association_name').val(), country_id: $('#association_country_id').val() })
    .done(function( data ) {
      var association_id = data.id;
      $('#association_member_association_id').val(association_id);
      var url = '/asociaciones/datos/' + association_id;
        $.get(url, function(data) {
          $('#selected-association').html(data);
          modal.close();
        });
    })
});



