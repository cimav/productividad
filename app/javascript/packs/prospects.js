import Bulma from '@vizuaalog/bulmajs';

$(document).on('click', '#add-prospect', function() {
  var user = $(this).data('shortname');
  var url = '/perfiles/' + user + '/prospectos';
  var valid = true;
  var subject = $('#prospect_subject').val();
  var organization = $('#prospect_organization').val();
  var contact_date = $('#prospect_contact_date').val();
  var contact = $('#prospect_contact').val();
  var decision_type = $('#prospect_decision_type').val();
  var phone = $('#prospect_phone').val();
  var email = $('#prospect_email').val();
  var address = $('#prospect_address').val();
  var country_id = $('#prospect_country_id').val();
  var source = $('#prospect_source').val();
  var needs = $('#prospect_needs').val();


  var errors = '';
  if (subject.length < 5) {
    errors += "Necesitas especificar el asunto\n";
    valid = false
  }

  if (!valid) {
    alert(errors);
  } else {
     $.post( url, { 
     	           subject: subject,
                   organization: organization,
                   contact_date: contact_date,
                   contact: contact,
                   decision_type: decision_type,
                   phone: phone,
                   prospect_email: email,
                   address: address,
                   country_id: country_id,
                   source: source,
                   needs: needs
               })
    .done(function( data ) {
      var prospect_id = data.id;
      url = url + '/' + prospect_id;
      window.location = url;
    })
  }
 
});



$(document).on('ajax:success', '#new_prospect_participant', function(data){
  var url = $('#new_prospect_participant').attr('action')
  $.get(url, function(data) {
    $('#prospect-participants-ui').html(data);
  });
    
  Bulma.create('notification', {
    isDismissable: true,
    dismissInterval: 4000,
    color: 'success',
    body: 'Participante agregado.',
    parent: document.getElementById('notification-area'),
   }).show();

  $('#prospect_participant_person_id').val('');
  $('#prospect_participant_suggester_comments').val('');
});



$(document).on('change', '#prospect_status', function() {
  var v = $(this).val();
  if (v == 1) {
    // SENT
    $('.accepted-status').hide();
    $('.published-status').hide();
  } else if (v == 2) {
    // ACCEPTED
    $('.accepted-status').show();
    $('.published-status').hide();
  } else if (v == 3) {
    // PUBLISHED
    $('.accepted-status').show();
    $('.published-status').show();
  } else if (v == 99) {
    // REJECTED
    $('.accepted-status').hide();
    $('.published-status').hide();
  }
});

