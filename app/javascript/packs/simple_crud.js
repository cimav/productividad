function crud_search() {
  var url = $("#crud-index-url").val() + '?';
  
  $( ".crud-filter" ).each(function( index ) {
  	url = url + $(this).data('id') + '=' + $(this).val() + '&';
  });

  url = url + 'page=' + $('#crud-index-page').val();

  if ($('#crud-index-order-field').val() != '') {
    url = url + '&order=' + $('#crud-index-order-field').val() + '&sorted=' + $('#crud-index-order-sorted').val();
  }

  url = url + '&search=true';

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

$(document).on("click", ".crud-th", function() {
  
  if ($('#crud-index-order-field').val() != $(this).data('field')) {
    prev = $('#crud-th-' + $('#crud-index-order-field').val())
    prev.html(prev.data('label'));
    $('#crud-index-order-sorted').val('');
  }

  $('#crud-index-order-field').val($(this).data('field'));

  if ($('#crud-index-order-sorted').val() == '') {
    $(this).html('▼ ' + $(this).data('label'));
    $('#crud-index-order-sorted').val('ASC');
  } else {
    if ($('#crud-index-order-sorted').val() == 'ASC') {
      $(this).html('▲ ' + $(this).data('label'));
      $('#crud-index-order-sorted').val('DESC');
    } else {
      $(this).html('▼ ' + $(this).data('label'));
      $('#crud-index-order-sorted').val('ASC');
    }
  }
  crud_search();
});

