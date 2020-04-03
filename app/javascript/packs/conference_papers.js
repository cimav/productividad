import Bulma from '@vizuaalog/bulmajs';

$(document).on('click', '#add-conference-paper', function() {
  var user = $(this).data('shortname');
  var url = '/perfiles/' + user + '/articulos-en-conferencias';
  var valid = true;
  var title = $('#conference_paper_title').val();
  var sent_date = $('#conference_paper_sent_date').val();
  var authors = $('#conference_paper_authors').val();
  var conference_id = $('#conference_paper_conference_id').val();
  var errors = '';
  if (title.length < 5) {
    errors += "Necesitas especificar el título del artículo\n";
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
    errors += "Necesitas especificar la conferencia\n";
    valid = false
  }

  if (!valid) {
    alert(errors);
  } else {
     $.post( url, { title: title, 
                 sent_date: sent_date,
                 authors:  authors,
                 conference_id:  conference_id
               })
    .done(function( data ) {
      var conference_paper_id = data.id;
      url = url + '/' + conference_paper_id + '/editar';
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

$(document).on('change', '#conference_paper_status', function() {
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


var modal;
$(document).on("turbolinks:load", function() {
  modal = Bulma.create('modal', {
    root: document.getElementById('select-conference-div'),
    title: 'Seleccionar conferencia',
    body: '<div id="search-conference-workarea"><div class="search-controls"><input type="text" placeholder="Nombre de la conferencia..." id="conference-title-select" class="input"></div><div id="conference-list-select"></div></div>',
  });
});

$(document).on('click', '#select-conference', function() {
  $('#conference-title-select').val('');
  $('#conference-list-select').html('');
  modal.open();
});

$(document).on('keyup', '#conference-title-select', function() {
  var q = $('#conference-title-select').val();
  if (q.length > 4) {
    var url = '/conferencias/buscar?q=' + q;
    $.get(url, function(data) {
      $('#conference-list-select').html(data);
    });
  }
});


$(document).on('click', '.conference-list-item', function() {
  var conference_id = $(this).data('id');
  $('#conference_paper_conference_id').val(conference_id);
  $('#conference_work_conference_id').val(conference_id);
  $('#invited_conference_conference_id').val(conference_id);
  $('#product_cite_conference_id').val(conference_id);
  var url = '/conferencias/datos/' + conference_id;
    $.get(url, function(data) {
      $('#selected-conference').html(data);
      modal.close();
    });
});

$(document).on('click', '#add-new-conference', function() {
  var url = '/conferencias/nueva/';
    $.get(url, function(data) {
      $('#search-conference-workarea').html(data);
    });
});

$(document).on('click', '#submit-new-conference', function() {
  $.post( "/conferencias/agregar-nueva", { name: $('#conference_name').val(), country_id: $('#conference_country_id').val() })
    .done(function( data ) {
      var conference_id = data.id;
      $('#conference_paper_conference_id').val(conference_id);
      $('#conference_work_conference_id').val(conference_id);
      $('#product_cite_conference_id').val(conference_id);
      $('#invited_conference_conference_id').val(conference_id);
      var url = '/conferencias/datos/' + conference_id;
        $.get(url, function(data) {
          $('#selected-conference').html(data);
          modal.close();
        });
    })
});



 


