import Bulma from '@vizuaalog/bulmajs';

$(document).on('click', '#add-journal-article', function() {
  var user = $(this).data('shortname');
  var url = '/perfiles/' + user + '/articulos-en-revistas';
  var valid = true;
  var title = $('#journal_article_title').val();
  var sent_date = $('#journal_article_sent_date').val();
  var authors = $('#journal_article_authors').val();
  var journal_id = $('#journal_article_journal_id').val();
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

  if (!(journal_id > 0)) {
    errors += "Necesitas especificar la revista\n";
    valid = false
  }

  if (!valid) {
    alert(errors);
  } else {
     $.post( url, { title: title, 
                 sent_date: sent_date,
                 authors:  authors,
                 journal_id:  journal_id
               })
    .done(function( data ) {
      var journal_article_id = data.id;
      url = url + '/' + journal_article_id + '/editar';
      window.location = url;
    })
  }
 
});


$(document).on('change', '#journal_article_status', function() {
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
    root: document.getElementById('select-journal-div'),
    title: 'Seleccionar revista',
    body: '<div id="search-workarea"><div class="search-controls"><input type="text" placeholder="Nombre de la revista..." id="journal-title-select" class="input"></div><div id="journal-list-select"></div></div>',
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
  $('#product_cite_journal_id').val(journal_id);
  $('#journal_article_reviewer_journal_id').val(journal_id);
  var url = '/revistas/datos/' + journal_id;
    $.get(url, function(data) {
      $('#selected-journal').html(data);
      modal.close();
    });
});

$(document).on('click', '#add-new-journal', function() {
  var url = '/revistas/nueva/'
    $.get(url, function(data) {
      $('#search-workarea').html(data);
    });
});

$(document).on('click', '#submit-new-journal', function() {
  $.post( "/revistas/agregar-nueva", { name: $('#journal_name').val(), country_id: $('#journal_country_id').val() })
    .done(function( data ) {
      var journal_id = data.id;
      $('#journal_article_journal_id').val(journal_id);
      $('#product_cite_journal_id').val(journal_id);
      $('#journal_article_reviewer_journal_id').val(journal_id);
      var url = '/revistas/datos/' + journal_id;
        $.get(url, function(data) {
          $('#selected-journal').html(data);
          modal.close();
        });
    })
});



 


