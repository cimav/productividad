import Bulma from '@vizuaalog/bulmajs';

$(document).on('click', '#add-project-reviewer', function() {
  var user = $(this).data('shortname');
  var url = '/perfiles/' + user + '/evaluador-de-proyectos';
  var valid = true;
  var name = $('#project_reviewer_name').val();
  var description = $('#project_reviewer_description').val();
  var review_date = $('#project_reviewer_review_date').val();
  var announcement = $('#project_reviewer_announcement').val();
  var country_id = $('#project_reviewer_country_id').val();

  var errors = '';

  if (name.length < 5) {
    errors += "Necesitas especificar el nombre\n";
    valid = false
  }

  if (announcement.length < 5) {
    errors += "Necesitas especificar la convocatoria\n";
    valid = false
  }


  if (!valid) {
    alert(errors);
  } else {
     $.post( url, { review_date: review_date, 
                 announcement: announcement,
                 description: description,
                 name:  name,
                 country_id:  country_id
               })
    .done(function( data ) {
      var project_reviewer_id = data.id;
      url = url + '/' + project_reviewer_id + '/editar';
      window.location = url;
    })
  }
 
});



