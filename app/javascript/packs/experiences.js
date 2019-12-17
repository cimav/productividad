import Bulma from '@vizuaalog/bulmajs';

$(document).on("turbolinks:load", function() {
  $('#experience-form').hide();
});

$(document).on('click', '#experience-show-add', function() {
  $('#experience-form').show();
  $('#experience-list').hide();
});

$(document).on('click', '#experience-add', function() {
  var title = $('#experience_title').val();
  var experience_type = $('#experience_type').val();
  var company = $('#experience_company').val();
  var description = $('#experience_description').val();
  var location = $('#experience_location').val();
  var start_date = $('#experience_start_date').val();
  var end_date = $('#experience_end_date').val();
  var person_id = $(this).data('person-id');

  $.post( "/experiencia/agrega",  { person_id: person_id, title: title, description:description, experience_type: experience_type, company: company, location: location, start_date: start_date, end_date: end_date})
    .done(function( data ) {
      var url = '/experiencia/ui/' + person_id
      $.get(url, function(data) {
        $('#experience-ui').html(data);
        $('#experience-form').hide();
        $('#experience-list').show();
        Bulma.traverseDOM();
      });
    
      Bulma.create('notification', {
        isDismissable: true,
        dismissInterval: 4000,
        color: 'success',
        body: 'Experiencia agregada.',
        parent: document.getElementById('notification-area'),
       }).show();
    });
});

$(document).on('click', '.experience-edit', function() {
  var experience_id = $(this).data('experience-id');
  var person_id = $(this).data('person-id');

  var url = '/experiencia/editar/' + person_id + '/' + experience_id;
  $.get(url, function(data) {
    $('#experience-form').html(data);
    $('#experience-form').show();
    $('#experience-list').hide();
  });
});

$(document).on('click', '#experience-update', function() {
  var title = $('#experience_title').val();
  var experience_type = $('#experience_type').val();
  var company = $('#experience_company').val();
  var description = $('#experience_description').val();
  var location = $('#experience_location').val();
  var start_date = $('#experience_start_date').val();
  var end_date = $('#experience_end_date').val();
  var person_id = $(this).data('person-id');
  var experience_id = $(this).data('experience-id');

  $.post( "/experiencia/actualiza",  { id: experience_id, person_id: person_id, title: title, description:description, experience_type: experience_type, company: company, location: location, start_date: start_date, end_date: end_date})
    .done(function( data ) {
      var url = '/experiencia/ui/' + person_id
      $.get(url, function(data) {
        $('#experience-ui').html(data);
        $('#experience-form').hide();
        $('#experience-list').show();
        Bulma.traverseDOM();
      });
    
      Bulma.create('notification', {
        isDismissable: true,
        dismissInterval: 4000,
        color: 'success',
        body: 'Experiencia actualizada.',
        parent: document.getElementById('notification-area'),
       }).show();
    });
});

$(document).on('click', '.experience-delete', function() {
  var experience_id = $(this).data('experience-id');
  var person_id = $(this).data('person-id');

  $.post( "/experiencia/elimina", { id: experience_id })
    .done(function( data ) {
      var url = '/experiencia/ui/' + person_id
      $.get(url, function(data) {
        $('#experience-ui').html(data);
      });
    
      Bulma.create('notification', {
      	isDismissable: true,
      	dismissInterval: 4000,
      	color: 'success',
        body: 'Experiencia eliminada.',
        parent: document.getElementById('notification-area'),
       }).show();

    });
});