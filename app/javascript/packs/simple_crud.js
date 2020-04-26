function crud_search() {
  var url = $("#crud-index-url").val() + '?';
  
  $( ".crud-filter" ).each(function( index ) {
  	url = url + $(this).data('id') + '=' + $(this).val() + '&'
  });

  url = url + 'page=' + $('#crud-index-page').val() + '&search=true'
  console.log(url);
  $.get(url, function(data) {
    $('#crud-index-table').html(data);
  });
}

$(document).on("keyup", ".crud-filter-text", function() {
  $('#crud-index-page').val(1);
  if ($(this).val().length > 3) {
  	crud_search();
  }
});

$(document).on("change", ".crud-filter-select", function() {
  $('#crud-index-page').val(1);
  crud_search();
});

$(document).on("click", ".crud-goto", function() {
  var page = $(this).data('page');
  console.log(page);
  $('#crud-index-page').val(page);
  crud_search();
});