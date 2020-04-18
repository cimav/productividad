import Bulma from '@vizuaalog/bulmajs';

$(document).on('click', '.task-checkbox', function() {
  var url = $(this).data('url');
  var url_lista = $(this).data('url-list');
  $.post( url )
    .done(function( data ) {
      
      $.get(url_lista, function(data) {
        $('#tasks-area').html(data);
      });
    
      Bulma.create('notification', {
        isDismissable: true,
        dismissInterval: 4000,
        color: 'success',
        body: 'Tarea marcada.',
        parent: document.getElementById('notification-area'),
       }).show();

    });
  
});
