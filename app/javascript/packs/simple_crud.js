function crud_search() {
  var url = $("#crud-index-url").val() + '?';
  
  $( ".crud-filter" ).each(function( index ) {
  	url = url + $(this).data('id') + '=' + $(this).val() + '&'
  });

  url = url + 'search=true'

  $.get(url, function(data) {
    $('#crud-index-table').html(data);
  });
}

$(document).on("keyup", ".crud-filter-text", function() {
  if ($(this).val().length > 3) {
  	crud_search();
  }
});