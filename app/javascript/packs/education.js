import Bulma from '@vizuaalog/bulmajs';

$(document).on("turbolinks:load", function() {
  $('#education-form').hide();
});

$(document).on('click', '#education-show-add', function() {
  $('#education-form').show();
  $('#education-list').hide();
});

$(document).on('click', '#education-add', function() {

  var title = $('#education_title').val();
  var degree = $('#education_degree').val();
  var organization = $('#education_organization').val();
  var faculty = $('#education_faculty').val();
  var start_year = $('#education_start_year').val();
  var end_year = $('#education_end_year').val();
  var person_id = $(this).data('person-id');

  $.post( "/educacion/agrega",  { person_id: person_id, title: title, degree_id: degree, organization_id: organization, faculty: faculty, start_year: start_year, end_year: end_year})
    .done(function( data ) {
      var url = '/educacion/ui/' + person_id
      $.get(url, function(data) {
        $('#education-ui').html(data);
        $('#education-form').hide();
        $('#education-list').show();
        Bulma.traverseDOM();
      });
    
      Bulma.create('notification', {
        isDismissable: true,
        dismissInterval: 4000,
        color: 'success',
        body: 'Educación agregado.',
        parent: document.getElementById('notification-area'),
       }).show();
    });
});

$(document).on('click', '.education-edit', function() {
  var education_id = $(this).data('education-id');
  var person_id = $(this).data('person-id');

  var url = '/educacion/editar/' + person_id + '/' + education_id;
  $.get(url, function(data) {
    $('#education-form').html(data);
    $('#education-form').show();
    $('#education-list').hide();
  });
});

$(document).on('click', '#education-update', function() {
  var title = $('#education_title').val();
  var degree = $('#education_degree').val();
  var organization = $('#education_organization').val();
  var faculty = $('#education_faculty').val();
  var start_year = $('#education_start_year').val();
  var end_year = $('#education_end_year').val();
  var person_id = $(this).data('person-id');
  var person_id = $(this).data('person-id');
  var education_id = $(this).data('education-id');

  $.post( "/educacion/actualiza",  { id: education_id, person_id: person_id, title: title, degree_id: degree, organization_id: organization, faculty: faculty, start_year: start_year, end_year: end_year})
    .done(function( data ) {
      var url = '/educacion/ui/' + person_id
      $.get(url, function(data) {
        $('#education-ui').html(data);
        $('#education-form').hide();
        $('#education-list').show();
        Bulma.traverseDOM();
      });
    
      Bulma.create('notification', {
        isDismissable: true,
        dismissInterval: 4000,
        color: 'success',
        body: 'Educación actualizada.',
        parent: document.getElementById('notification-area'),
       }).show();
    });
});

$(document).on('click', '.education-delete', function() {
  var education_id = $(this).data('education-id');
  var person_id = $(this).data('person-id');

  $.post( "/educacion/elimina", { id: education_id })
    .done(function( data ) {
      var url = '/educacion/ui/' + person_id
      $.get(url, function(data) {
        $('#education-ui').html(data);
      });
    
      Bulma.create('notification', {
      	isDismissable: true,
      	dismissInterval: 4000,
      	color: 'success',
        body: 'Educación eliminado.',
        parent: document.getElementById('notification-area'),
       }).show();

    });
});