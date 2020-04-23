import Bulma from '@vizuaalog/bulmajs';

$(document).on('click', '#add-patent', function() {
  var user = $(this).data('shortname');
  var url = '/perfiles/' + user + '/patentes';
  var valid = true;
  var title = $('#patent_title').val();
  var register_date = $('#patent_register_date').val();
  var authors = $('#patent_authors').val();
  var errors = '';
  if (title.length < 5) {
    errors += "Necesitas especificar el título de la patente\n";
    valid = false
  }

  if (register_date.length != 10) {
    errors += "Necesitas especificar la fecha de envío\n";
    valid = false
  }

  if (authors.length < 5) {
    errors += "Necesitas especificar los autores\n";
    valid = false
  }

  if (!valid) {
    alert(errors);
  } else {
     $.post( url, { title: title, 
                 register_date: register_date,
                 authors:  authors
               })
    .done(function( data ) {
      var patent_id = data.id;
      url = url + '/' + patent_id + '/editar';
      window.location = url;
    })
  }
 
});



