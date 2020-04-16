import Bulma from '@vizuaalog/bulmajs';

$(document).on('click', '#add-journal-article-reviewer', function() {
  var user = $(this).data('shortname');
  var url = '/perfiles/' + user + '/evaluador-de-articulos';
  var valid = true;
  var title = $('#journal_article_reviewer_title').val();
  var authors = $('#journal_article_reviewer_authors').val();
  var review_date = $('#journal_article_reviewer_review_date').val();
  var journal_id = $('#journal_article_reviewer_journal_id').val();

  var errors = '';

  if (title.length < 5) {
    errors += "Necesitas especificar el títulos\n";
    valid = false
  }

  if (authors.length < 5) {
    errors += "Necesitas especificar los autores\n";
    valid = false
  }


  if (!valid) {
    alert(errors);
  } else {
     $.post( url, { review_date: review_date, 
                 authors: authors,
                 authors: authors,
                 title:  title,
                 journal_id:  journal_id
               })
    .done(function( data ) {
      var journal_article_reviewer_id = data.id;
      url = url + '/' + journal_article_reviewer_id + '/editar';
      window.location = url;
    })
  }
 
});


$(document).on('change', '.filter-select', function() {
  var year = $('#filter-year').val()
  var url =  $(this).data('url') + '/muestra/' + year;
  window.location = url;
});

