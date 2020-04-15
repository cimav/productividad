import Bulma from '@vizuaalog/bulmajs';

$(document).on('click', '#add-award', function() {
  var user = $(this).data('shortname');
  var url = '/perfiles/' + user + '/reconocimientos';
  var valid = true;
  var name = $('#award_name').val();
  var award_type = $('#award_type').val();
  var grant_date = $('#award_grant_date').val();
  var granted_by = $('#award_granted_by').val();
  var country_id = $('#award_country_id').val();
  var errors = '';

  if (name.length < 5) {
    errors += "Necesitas especificar el nombre\n";
    valid = false
  }

  if (granted_by.length < 5) {
    errors += "Necesitas especificar quién otorga\n";
    valid = false
  }


  if (!valid) {
    alert(errors);
  } else {
     $.post( url, { grant_date: grant_date, 
                 granted_by: granted_by,
                 award_type: award_type,
                 name:  name,
                 country_id:  country_id
               })
    .done(function( data ) {
      var award_id = data.id;
      url = url + '/' + award_id + '/editar';
      window.location = url;
    })
  }
 
});


$(document).on('change', '.filter-select', function() {
  var year = $('#filter-year').val()
  var url =  $(this).data('url') + '/muestra/' + year;
  window.location = url;
});

