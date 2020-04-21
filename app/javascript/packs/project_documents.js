import Bulma from '@vizuaalog/bulmajs';

$(document).on('change', '#documents-order', function() {
  window.location = window.location.href.split(/[?#]/)[0] + '?orden=' + $(this).val();
});


$(document).on('click', '#add-new-folder', function() {
  var url = $(this).data('url');
  $.get(url, function(data) {
    $('#new-folder').html(data);
  });
});


$(document).on('click', '#cancel-new-folder', function() {
  $('#new-folder').html('');
});
