import Bulma from '@vizuaalog/bulmajs';

$(document).on('click', '#add-invited-conference', function() {
  var user = $(this).data('shortname');
  var url = '/perfiles/' + user + '/conferencias-por-invitacion';
  var valid = true;
  var title = $('#invited_conference_title').val();
  var conference_date = $('#invited_conference_conference_date').val();
  var conference_id = $('#invited_conference_conference_id').val();
  var errors = '';
  if (title.length < 5) {
    errors += "Necesitas especificar el título del trabajo\n";
    valid = false
  }

  if (conference_date.length != 10) {
    errors += "Necesitas especificar la fecha de la conferencia\n";
    valid = false
  }

  if (!(conference_id > 0)) {
    errors += "Necesitas especificar el evento\n";
    valid = false
  }

  if (!valid) {
    alert(errors);
  } else {
     $.post( url, { title: title, 
                 conference_date: conference_date,
                 conference_id:  conference_id
               })
    .done(function( data ) {
      var invited_conference_id = data.id;
      url = url + '/' + invited_conference_id + '/editar';
      window.location = url;
    })
  }
 
});



