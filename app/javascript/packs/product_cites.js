import Bulma from '@vizuaalog/bulmajs';

$(document).on('click', '.get-cites', function() {
  var product_class = $(this).data('product-class');
  var product_id = $(this).data('product-id');
  var url = '/citas/ui/' + product_class + '/' + product_id
  $.get(url, function(data) {
    $("#cites-workarea").html(data);
  });
})

$(document).on('change', '#filter-year-cite', function() {
  var product_class = $('#product-class').val();
  var product_id = $('#product-id').val();
  var year = $(this).val();
  var url = '/citas/ui/' + product_class + '/' + product_id + '?year=' + year
  $.get(url, function(data) {
    $("#cites-workarea").html(data);
  });
})

$(document).on('click', '#add-cite-link', function() {
  var product_class = $(this).data('product-class');
  var product_id = $(this).data('product-id');
  var url = '/citas/nueva/' + product_class + '/' + product_id
  $.get(url, function(data) {
    $('.cites-ui').html(data);
  });
})

$(document).on('click', '.edit-cite', function() {
  var id = $(this).data('cite-id');
  var url = '/citas/editar/' + id
  $.get(url, function(data) {
    $('.cites-ui').html(data);
  });
})

$(document).on('click', '.delete-cite', function() {
  var product_class = $('#product-class').val();
  var product_id = $('#product-id').val();
  var id = $(this).data('cite-id');
  var url = '/citas/elimina/' 
  $.post( url, { 
                 product_class: product_class,
                 product_id: product_id,
     	         id: id, 
               })
    .done(function( data ) {
      var url = '/citas/ui/' + product_class + '/' + product_id
      $.get(url, function(data) {
        $('.cites-ui').html(data);
      });
    })
})

$(document).on('click', '#add-cite', function() {
  var valid = true;
  var product_class = $('#product_class').val();
  var product_id = $('#product_id').val();
  var title = $('#product_cite_title').val();
  var pub_date = $('#product_cite_published_date').val();
  var authors = $('#product_cite_authors').val();
  var journal_id = $('#product_cite_journal_id').val();
  var volume = $('#product_cite_volume').val();
  var issue = $('#product_cite_issue').val();
  var pages = $('#product_cite_pages').val();
  var doi = $('#product_cite_doi').val();
  var errors = '';
  if (title.length < 5) {
    errors += "Necesitas especificar el título del artículo\n";
    valid = false
  }

  if (pub_date.length != 10) {
    errors += "Necesitas especificar la fecha de publicación\n";
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
  	var url = '/citas/agrega';
     $.post( url, { 
                 product_class: product_class,
                 product_id: product_id,
     	         title: title, 
                 published_date: pub_date,
                 authors:  authors,
                 journal_id:  journal_id,
                 volume: volume,
                 issue: issue,
                 pages: pages,
                 doi: doi 

               })
    .done(function( data ) {
      var cite_id = data.id;
      var url = '/citas/ui/' + product_class + '/' + product_id
      $.get(url, function(data) {
        $('.cites-ui').html(data);
      });
    })
  }
 
});

$(document).on('click', '#update-cite', function() {
  var valid = true;
  var product_class = $('#product_class').val();
  var product_id = $('#product_id').val();
  var id = $('#cite_id').val();
  var title = $('#product_cite_title').val();
  var pub_date = $('#product_cite_published_date').val();
  var authors = $('#product_cite_authors').val();
  var journal_id = $('#product_cite_journal_id').val();
  var volume = $('#product_cite_volume').val();
  var issue = $('#product_cite_issue').val();
  var pages = $('#product_cite_pages').val();
  var doi = $('#product_cite_doi').val();
  var errors = '';
  if (title.length < 5) {
    errors += "Necesitas especificar el título del artículo\n";
    valid = false
  }

  if (pub_date.length != 10) {
    errors += "Necesitas especificar la fecha de publicación\n";
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
  	var url = '/citas/actualiza';
     $.post( url, { 
     	         id: id,
                 product_class: product_class,
                 product_id: product_id,
     	         title: title, 
                 published_date: pub_date,
                 authors:  authors,
                 journal_id:  journal_id,
                 volume: volume,
                 issue: issue,
                 pages: pages,
                 doi: doi 

               })
    .done(function( data ) {
      var cite_id = data.id;
      var url = '/citas/ui/' + product_class + '/' + product_id
      $.get(url, function(data) {
        $('.cites-ui').html(data);
      });
    })
  }
 
});

