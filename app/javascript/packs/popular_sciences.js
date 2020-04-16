import Bulma from '@vizuaalog/bulmajs';

$(document).on('click', '#add-popular-science', function() {
  var user = $(this).data('shortname');
  var url = '/perfiles/' + user + '/difusion-y-divulgacion';
  var valid = true;
  var name = $('#popular_science_name').val();
  var activity_type = $('#popular_science_activity_type').val();
  var start_date = $('#popular_science_start_date').val();
  var end_date = $('#popular_science_end_date').val();
  var description = $('#popular_science_description').val();
  var location = $('#popular_science_location').val();
  var country_id = $('#popular_science_country_id').val();


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
                 activity_type: activity_type,
                 description: description,
                 location: location,
                 name:  name,
                 country_id:  country_id
               })
    .done(function( data ) {
      var popular_science_id = data.id;
      url = url + '/' + popular_science_id + '/editar';
      window.location = url;
    })
  }
 
});


$(document).on('change', '.filter-select', function() {
  var year = $('#filter-year').val()
  var url =  $(this).data('url') + '/muestra/' + year;
  window.location = url;
});

