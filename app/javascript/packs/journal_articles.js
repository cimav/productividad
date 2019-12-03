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
