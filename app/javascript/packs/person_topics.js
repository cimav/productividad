import Bulma from '@vizuaalog/bulmajs';

$( function() {
    $( "#topic" ).autocomplete({
      source: function( request, response ) {
        $.ajax( {
          url: "/areas-de-interes/buscar",
          dataType: "json",
          data: {
            term: request.term
          },
          success: function( data ) {
            response(data);
            $('#topic-id').val(0)
          }
        } );
      },
      minLength: 2,
      select: function( event, ui ) {
        $('#topic-id').val(ui.item.id);
      }
    } );
  } );


$(document).on('click', '.topic-add', function() {
  
  var person_id = $(this).data('person-id');
  var name = $('#topic').val();
  var topic_id = $('#topic-id').val();

  $.post( "/areas-de-interes-por-persona/agrega",  { person_id: person_id, topic_id: topic_id, name: name })
    .done(function( data ) {
      var url = '/areas-de-interes-por-persona/lista/' + person_id
      $.get(url, function(data) {
        $('#topic').val("");
        $('#topic-list').html(data);
      });
    
      Bulma.create('notification', {
        isDismissable: true,
        dismissInterval: 4000,
        color: 'success',
        body: 'Área de interes agregada.',
        parent: document.getElementById('notification-area'),
       }).show();

    });
});

$(document).on('click', '.topic-delete', function() {

  var person_id = $(this).data('person-id');
  var person_topic_id = $(this).data('person-topic-id');
  
  $.post( "/areas-de-interes-por-persona/elimina", { id: person_topic_id })
    .done(function( data ) {
      var url = '/areas-de-interes-por-persona/lista/' + person_id
      $.get(url, function(data) {
        $('#topic').val("");
        $('#topic-list').html(data);
      });
    
      Bulma.create('notification', {
        isDismissable: true,
        dismissInterval: 4000,
        color: 'success',
        body: 'Área de interes eliminada.',
        parent: document.getElementById('notification-area'),
       }).show();

    });
});