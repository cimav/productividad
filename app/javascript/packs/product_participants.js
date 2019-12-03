import Bulma from '@vizuaalog/bulmajs';

$(document).on("turbolinks:load", function() {
  $('#participant_author_is').hide();
});

$(document).on('change', '.participant-type-select', function() {
  var participant_id = $(this).data('participant-id');
  var type_id = $(this).val();
  var select_id = '#select_person_' + participant_id;
  if (type_id == 9999) {
    $(select_id).html('');
    $(select_id).hide();
  } else {
    var url = '/participantes/select/' + participant_id + '/' + type_id
    $.get(url, function(data) {
      $(select_id).html(data); 
      $(select_id).show();
    });
  }
});

$(document).on('change', '#participant_type_new', function() {
  if ($(this).val() == 9999) {
    // External
    $('#select_person_new').hide();
    $('#participant_author_is').show();
  } else {
    // From organization
    $('#select_person_new').show();
    $('#participant_author_is').hide();
  }
});


$(document).on('change', '.participant-select', function() {
  var participant_id = $(this).data('participant-id');
  var person_id = $('#person_id_' + participant_id).val();
  var participation = $('#participation_' + participant_id).val();
  $.post( "/participantes/actualiza", { id: participant_id, person_id: person_id, participant_type: participant_type, participation: participation })
    .done(function( data ) {
      Bulma.create('notification', {
      	isDismissable: true,
      	dismissInterval: 4000,
      	color: 'success',
        body: 'Participante actualizado.',
        parent: document.getElementById('notification-area'),
       }).show();
    });
});

$(document).on('click', '.participant-assign', function() {
  var participant_id = $(this).data('participant-id');
  var person_id = $('#person_id_' + participant_id).val();
  var participation = $('#participation_' + participant_id).val();
  var product_class = $(this).data('product-class');
  var product_id = $(this).data('product-id');
  $.post( "/participantes/actualiza", { id: participant_id, person_id: person_id, participation: participation, product_class: product_class })
    .done(function( data ) {
      var url = '/participantes/ui/' + product_class + '/' + product_id
      $.get(url, function(data) {
        $('#product-participants-ui').html(data);
        $('#participant_author_is').hide();
      });
    
      Bulma.create('notification', {
        isDismissable: true,
        dismissInterval: 4000,
        color: 'success',
        body: 'Participante asignado.',
        parent: document.getElementById('notification-area'),
       }).show();

    });
});




$(document).on('click', '.participant-add', function() {
  var participant_type = $('#participant_type_new').val();
  var person_id = $('#person_id_new').val();
  var author_is = $('#participant_author_is').val();
  var participation = $('#participation_new').val();
  var product_class = $(this).data('product-class');
  var product_id = $(this).data('product-id');

  $.post( "/participantes/agrega",  { product_class: product_class, product_id: product_id, person_id: person_id, participant_type: participant_type, participation: participation, author_is: author_is  })
    .done(function( data ) {
      var url = '/participantes/ui/' + product_class + '/' + product_id
      $.get(url, function(data) {
        $('#product-participants-ui').html(data);
        $('#participant_author_is').hide();
      });
    
      Bulma.create('notification', {
        isDismissable: true,
        dismissInterval: 4000,
        color: 'success',
        body: 'Participante agregado.',
        parent: document.getElementById('notification-area'),
       }).show();

    });
});


$(document).on('click', '.participant-delete', function() {
  var participant_id = $(this).data('participant-id');
  var product_id = $(this).data('product-id');
  var product_class = $(this).data('product-class');
  $.post( "/participantes/elimina", { id: participant_id })
    .done(function( data ) {
      var url = '/participantes/ui/' + product_class + '/' + product_id
      $.get(url, function(data) {
        $('#product-participants-ui').html(data);
        $('#participant_author_is').hide();
      });
    
      Bulma.create('notification', {
      	isDismissable: true,
      	dismissInterval: 4000,
      	color: 'success',
        body: 'Participante eliminado.',
        parent: document.getElementById('notification-area'),
       }).show();

    });
});