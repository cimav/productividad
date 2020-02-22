import Bulma from '@vizuaalog/bulmajs';

$(document).on('click', '#add-book', function() {
  var user = $(this).data('shortname');
  var url = '/perfiles/' + user + '/libros';
  var valid = true;
  var title = $('#book_title').val();
  var sent_date = $('#book_sent_date').val();
  var authors = $('#book_authors').val();
  var book_type = $('#book_book_type').val();
  var publisher = $('#book_publisher').val();
  var country_id = $('#book_country_id').val();
  var is_refereed = $('#book_is_refereed').val();
  var errors = '';
  if (title.length < 5) {
    errors += "Necesitas especificar el título del libro\n";
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

  if (!valid) {
    alert(errors);
  } else {
     $.post( url, { title: title, 
                 sent_date: sent_date,
                 authors:  authors,
                 book_type:  book_type,
                 publisher:  publisher,
                 country_id:  country_id,
                 is_refereed: is_refereed
               })
    .done(function( data ) {
      var book_id = data.id;
      url = url + '/' + book_id + '/editar';
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

$(document).on('change', '#book_status', function() {
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


$(document).on('click', '#add-new-book', function() {
  var url = '/libros/nueva/'
    $.get(url, function(data) {
      $('#search-workarea').html(data);
    });
});

$(document).on('click', '#submit-new-book', function() {
  $.post( "/libros/agregar-nueva", { name: $('#book_name').val(), country_id: $('#book_country_id').val() })
    .done(function( data ) {
      var book_id = data.id;
      $('#book_book_id').val(book_id);
      var url = '/libros/datos/' + book_id;
        $.get(url, function(data) {
          $('#selected-book').html(data);
          modal.close();
        });
    })
});



 


