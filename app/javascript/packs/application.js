// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("jquery")
require("jquery-ui")
require("@vizuaalog/bulmajs")
require("packs/projects")
require("packs/project_tasks")
require("packs/project_documents")
require("packs/journal_articles")
require("packs/conference_papers")
require("packs/conference_works")
require("packs/books")
require("packs/patents")
require("packs/event_organizers")
require("packs/association_members")
require("packs/awards")
require("packs/project_reviewers")
require("packs/journal_article_reviewers")
require("packs/popular_sciences")
require("packs/relevant_activities")
require("packs/product_participants")
require("packs/acknowledgements")
require("packs/product_files")
require("packs/product_cites")
require("packs/experiences")
require("packs/education")
require("packs/person_topics")
require("packs/person_research_lines")



// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)

window.bulmaCalendar = require('bulma-extensions/bulma-calendar/dist/js/bulma-calendar');


import Bulma from '@vizuaalog/bulmajs';

$(document).on("turbolinks:load", function() {
  Bulma.traverseDOM();

  // var calendars = bulmaCalendar.attach('[type="date"]', {
  //   dateFormat: 'YYYY-MM-DD',
  //   color: 'link'
  // });

  $('ul.menu-list li').each(function(i) {
  	var url = window.location.href
  	var c = $(this).attr('class').replace('li-','');
  	if (url.includes(c)) {
  	  $(this).addClass('active');	
  	}
  });

  $('.project-menu').each(function(i) {
    var url = window.location.href
    var c = $(this).attr('class').replace('project-menu-','').replace('project-menu','').replace(' ','');
    console.log(url + ' incluye *' + c + '*');
    if (url.includes(c)) {
      console.log('SIIIII');
      $(this).addClass('active'); 
    }
  });


});

window.showNotice = function(msg) {
  Bulma.create('notification', {
        isDismissable: true,
        dismissInterval: 4000,
        color: 'success',
        body: msg,
        parent: document.getElementById('notification-area'),
       }).show();
}








require("trix")
require("@rails/actiontext")