function getCookie(cname) {
  var name = cname + "=";
  var decodedCookie = decodeURIComponent(document.cookie);
  var ca = decodedCookie.split(';');
  for(var i = 0; i <ca.length; i++) {
    var c = ca[i];
    while (c.charAt(0) == ' ') {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return "";
}

$(document).on('click', '#hide-sidebar', function() {
	$('.profile-sidebar').hide();
	$('.profile-small-sidebar').show();
	document.cookie = "profile_sidebar=hide";
});

$(document).on('click', '#show-sidebar', function() {
	$('.profile-sidebar').show();
	$('.profile-small-sidebar').hide();
	document.cookie = "profile_sidebar=show";
});

$(document).on("turbolinks:load", function() {
  var profile_sidebar = getCookie('profile_sidebar');
  if (profile_sidebar == 'hide') {
    $('.profile-sidebar').hide();
	$('.profile-small-sidebar').show();
  } else {
  	$('.profile-sidebar').show();
	$('.profile-small-sidebar').hide();
  }
});