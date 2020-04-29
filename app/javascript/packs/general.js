$(document).on('change', '.filter-select', function() {
  var status = $('#filter-status').val()
  var year = $('#filter-year').val()
  var url =  $(this).data('url') + '/muestra'
  if (typeof status !== 'undefined') {
   url = url + '/' + status
  }
  //if (year != 'todos') {
    url = url + '/' + year;
  //}
  window.location = url;
});


$(document).on('click', '.profile-menu a', function() {
  $('#loading').show();
});
