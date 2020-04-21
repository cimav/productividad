import Bulma from '@vizuaalog/bulmajs';

$(document).on('change', '#upload_files', function() {
  document.getElementById("new_project_document").submit();
});

$(document).on('change', '#file-upload', function() {
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
