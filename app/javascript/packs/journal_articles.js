import Bulma from '@vizuaalog/bulmajs';

$(document).on('change', '.filter-select', function() {
  var status = $('#filter-status').val()
  var year = $('#filter-year').val()
  var url =  $(this).data('url') + '/muestra/' + status
  if (year != 'todos') {
    url = url + '/' + year;
  }
  window.location = url;
});

$(document).on('change', '#journal_article_status', function() {
  v = $(this).val();
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
    root: document.getElementById('select-journal-div'),
    title: 'Seleccionar revista',
    body: '<div class="search-controls"><input type="text" placeholder="Nombre de la revista..." id="journal-title-select" class="input"></div><div id="journal-list-select"></div>',
  });
});

$(document).on('click', '#select-journal', function() {
  $('#journal-title-select').val('');
  $('#journal-list-select').html('');
  modal.open();
});

$(document).on('keyup', '#journal-title-select', function() {
  var q = $('#journal-title-select').val();
  if (q.length > 4) {
    var url = '/revistas/buscar?q=' + q;
    $.get(url, function(data) {
      $('#journal-list-select').html(data);
    });
  }
});


$(document).on('click', '.journal-list-item', function() {
  var journal_id = $(this).data('id');
  $('#journal_article_journal_id').val(journal_id);
  var url = '/revistas/datos/' + journal_id;
    $.get(url, function(data) {
      $('#selected-journal').html(data);
      modal.close();
    });
});
 


