import Bulma from '@vizuaalog/bulmajs';

$(document).on('click', '#add-conference-work', function() {
  var user = $(this).data('shortname');
  var url = '/perfiles/' + user + '/trabajos';
  var valid = true;
  var title = $('#conference_work_title').val();
  var sent_date = $('#conference_work_sent_date').val();
  var authors = $('#conference_work_authors').val();
  var conference_id = $('#conference_work_conference_id').val();
  var work_type = $('#conference_work_work_type').val();
  var errors = '';
  if (title.length < 5) {
    errors += "Necesitas especificar el título del trabajo\n";
    valid = false
  }

  if (sent_date.length != 10) {
    errors += "Necesitas especificar la fecha de envío\n";
    valid = false
  }

  if (authors.length < 5) {
    errors += "Necesitas especificar los autores\n";
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
                 sent_date: sent_date,
                 authors:  authors,
                 conference_id:  conference_id,
                 work_type: work_type
               })
    .done(function( data ) {
      var conference_work_id = data.id;
      url = url + '/' + conference_work_id + '/editar';
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

$(document).on('change', '#conference_work_status', function() {
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



