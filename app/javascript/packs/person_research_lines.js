import Bulma from '@vizuaalog/bulmajs';

$(document).on('click', '.research-line-checkbox', function() {
  var person_id = $(this).data('person-id');
  var research_line_id = $(this).data('research-line-id');
  if ($(this).is(":checked")) {
    $.post( "/lineas-de-investigacion-por-persona/agrega",  { person_id: person_id, research_line_id: research_line_id})
    .done(function( data ) {
    
      Bulma.create('notification', {
        isDismissable: true,
        dismissInterval: 4000,
        color: 'success',
        body: 'Línea de investigación agregada.',
        parent: document.getElementById('notification-area'),
       }).show();

    });
  } else {
  	$.post( "/lineas-de-investigacion-por-persona/elimina", { person_id: person_id, research_line_id: research_line_id })
    .done(function( data ) {
      Bulma.create('notification', {
        isDismissable: true,
        dismissInterval: 4000,
        color: 'success',
        body: 'Línea de investigación eliminada.',
        parent: document.getElementById('notification-area'),
       }).show();

    });
  }
  
});

