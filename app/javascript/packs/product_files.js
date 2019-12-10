import Bulma from '@vizuaalog/bulmajs';

$(document).on('ajax:beforeSend', '#item-upload-file-form', function(evt, xhr, settings) {
  console.log('before send...');
});
   
$(document).on('ajax:success', '#item-upload-file-form', function(evt, data, status, xhr){
  var product_class = $('#product_file_product_class').val();
  var product_id = $('#product_file_product_id').val();
  var url = '/archivos-producto/ui/' + product_class + '/' + product_id;
  $.get(url, function(data) {
    $('#product-file-ui').html(data);
  });
    
  Bulma.create('notification', {
    isDismissable: true,
    dismissInterval: 4000,
    color: 'success',
    body: 'Archivo agregado.',
    parent: document.getElementById('notification-area'),
   }).show();

});
    

$(document).on('ajax:error', '#item-upload-file-form', function(evt, xhr, status, error) {
  Bulma.create('notification', {
    isDismissable: true,
    dismissInterval: 4000,
    color: 'error',
    body: 'Archivo no pudo ser agregado.',
    parent: document.getElementById('notification-area'),
   }).show();
});


$(document).on('click', '.product-file-delete', function() {
  var file_id = $(this).data('product-file-id');
  var product_id = $(this).data('product-id');
  var product_class = $(this).data('product-class');
  $.post( "/archivos-producto/elimina", { id: file_id })
    .done(function( data ) {
      var url = '/archivos-producto/ui/' + product_class + '/' + product_id;
      $.get(url, function(data) {
        $('#product-file-ui').html(data);
      });
    
      Bulma.create('notification', {
      	isDismissable: true,
      	dismissInterval: 4000,
      	color: 'success',
        body: 'Archivo eliminado.',
        parent: document.getElementById('notification-area'),
       }).show();

    });
});