import Bulma from '@vizuaalog/bulmajs';

$(document).on('click', '#add-event-organizer', function() {
  var user = $(this).data('shortname');
  var url = '/perfiles/' + user + '/organizador-de-eventos';
  var valid = true;
  var organizer_type = $('#event_organizer_organizer_type').val();
  var activity = $('#event_organizer_activity').val();
  var conference_id = $('#event_organizer_conference_id').val();
  var errors = '';
  if (activity.length < 5) {
    errors += "Necesitas especificar la actividad realizada\n";
    valid = false
  }

  if (!(conference_id > 0)) {
    errors += "Necesitas especificar el evento\n";
    valid = false
  }

  if (!valid) {
    alert(errors);
  } else {
     $.post( url, { organizer_type: organizer_type, 
                 activity: activity,
                 conference_id:  conference_id
               })
    .done(function( data ) {
      var event_organizer_id = data.id;
      url = url + '/' + event_organizer_id + '/editar';
      window.location = url;
    })
  }
 
});


$(document).on('change', '.filter-select', function() {
  var year = $('#filter-year').val()
  var url =  $(this).data('url') + '/muestra/' + year;
  window.location = url;
});



