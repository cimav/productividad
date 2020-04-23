import Bulma from '@vizuaalog/bulmajs';

$(document).on('change', '#upload_files', function() {
  document.getElementById("new_project_document").submit();
});

$(document).on('change', '#replace_file', function() {
  document.getElementById("replace-file-form").submit();
});

$(document).on('keyup', '#project_document_url', function() {
  var url = $(this).val();
  var icon = $("#google-icon").attr("src");
  if (url.includes('spreadsheet')) {
  	$('#google-sheet-radio').prop('checked', true);
    icon = $("#google-icon-sheet").val();
  } else if (url.includes('document')) {
  	$('#google-doc-radio').prop('checked', true);
  	icon = $("#google-icon-doc").val();
  } else if (url.includes('presentation')) {
  	$('#google-slide-radio').prop('checked', true);
  	icon = $("#google-icon-slide").val();
  } else {
  	$('#google-other-radio').prop('checked', true);
  }
  $("#google-icon").attr("src", icon);
});

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
