import Bulma from '@vizuaalog/bulmajs';

$(document).on('click', '#add-new-folder', function() {
  var url = $(this).data('url');
  $.get(url, function(data) {
    $('#new-folder').html(data);
  });
});


$(document).on('click', '#cancel-new-folder', function() {
  $('#new-folder').html('');
});
