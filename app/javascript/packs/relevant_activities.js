import Bulma from '@vizuaalog/bulmajs';

$(document).on('click', '#add-relevant-activity', function() {
  var user = $(this).data('shortname');
  var url = '/perfiles/' + user + '/actividades-relevantes';
  var valid = true;
  var name = $('#relevant_activity_name').val();
  var start_date = $('#relevant_activity_start_date').val();
  var end_date = $('#relevant_activity_end_date').val();
  var description = $('#relevant_activity_description').val();
  var location = $('#relevant_activity_location').val();
  var country_id = $('#relevant_activity_country_id').val();


  var errors = '';

  if (name.length < 5) {
    errors += "Necesitas especificar la actividad\n";
    valid = false
  }

  if (description.length < 5) {
    errors += "Necesitas especificar el objetivo\n";
    valid = false
  }

  if (location.length < 2) {
    errors += "Necesitas especificar el lugar\n";
    valid = false
  }


  if (!valid) {
    alert(errors);
  } else {
     $.post( url, { start_date: start_date, 
                 end_date: end_date,
                 description: description,
                 location: location,
                 name:  name,
                 country_id:  country_id
               })
    .done(function( data ) {
      var relevant_activity_id = data.id;
      url = url + '/' + relevant_activity_id + '/editar';
      window.location = url;
    })
  }
 
});



