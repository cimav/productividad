import Bulma from '@vizuaalog/bulmajs';

$(document).on('click', '#add-project', function() {
  var user = $(this).data('shortname');
  var url = '/perfiles/' + user + '/proyectos';
  var valid = true;
  var name = $('#project_name').val();
  var start_date = $('#project_start_date').val();
  var source_type = $('#project_source_type').val();
  var source = $('#project_source').val();
  var research_type = $('#project_research_type').val();
  var errors = '';
  if (name.length < 5) {
    errors += "Necesitas especificar el nombre del proyecto\n";
    valid = false
  }

  if (!valid) {
    alert(errors);
  } else {
     $.post( url, { name: name, 
                 start_date: start_date,
                 source_type:  source_type,
                 source:  source,
                 research_type: research_type
               })
    .done(function( data ) {
      var project_id = data.id;
      url = url + '/' + project_id + '/editar';
      window.location = url;
    })
  }
 
});


$(document).on('change', '.filter-select', function() {
  var status = $('#filter-status').val()
  var year = $('#filter-year').val()
  var url =  $(this).data('url') + '/muestra/' + status
  if (year != 'todos') {
    url = url + '/' + year;
  }
  window.location = url;
});

$(document).on('change', '#project_status', function() {
  var v = $(this).val();
  if (v == 1) {
    // SENT
    $('.accepted-status').hide();
    $('.published-status').hide();
  } else if (v == 2) {
    // ACCEPTED
    $('.accepted-status').show();
    $('.published-status').hide();
  } else if (v == 3) {
    // PUBLISHED
    $('.accepted-status').show();
    $('.published-status').show();
  } else if (v == 99) {
    // REJECTED
    $('.accepted-status').hide();
    $('.published-status').hide();
  }
});

