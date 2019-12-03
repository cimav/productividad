import Bulma from '@vizuaalog/bulmajs';

$(document).on('change', '.acknowledgement-type-select', function() {
  var acknowledgement_id = $(this).data('acknowledgement-id');
  var type_id = $(this).val();
  
  var url = '/agradecimientos/select/' + type_id
  $.get(url, function(data) {
    $('#select-acknowledgement-new').html(data); 
  });
  
});



$(document).on('click', '.acknowledgement-add', function() {
  var person_id = $('#acknowledgement_person_id_new').val();
  var notes = $('#acknowledgement_notes').val();
  var product_class = $(this).data('product-class');
  var product_id = $(this).data('product-id');

  $.post( "/agradecimientos/agrega",  { product_class: product_class, product_id: product_id, person_id: person_id, notes: notes  })
    .done(function( data ) {
      var url = '/agradecimientos/ui/' + product_class + '/' + product_id
      $.get(url, function(data) {
        $('#acknowledgments-ui').html(data);
      });
    
      Bulma.create('notification', {
        isDismissable: true,
        dismissInterval: 4000,
        color: 'success',
        body: 'Agradecimiento agregado.',
        parent: document.getElementById('notification-area'),
       }).show();

    });
});


$(document).on('click', '.acknowledgement-delete', function() {
  var acknowledgement_id = $(this).data('acknowledgement-id');
  var product_id = $(this).data('product-id');
  var product_class = $(this).data('product-class');
  $.post( "/agradecimientos/elimina", { id: acknowledgement_id })
    .done(function( data ) {
      var url = '/agradecimientos/ui/' + product_class + '/' + product_id
      $.get(url, function(data) {
        $('#acknowledgments-ui').html(data);
      });
    
      Bulma.create('notification', {
      	isDismissable: true,
      	dismissInterval: 4000,
      	color: 'success',
        body: 'acknowledgemente eliminado.',
        parent: document.getElementById('notification-area'),
       }).show();

    });
});