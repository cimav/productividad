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
