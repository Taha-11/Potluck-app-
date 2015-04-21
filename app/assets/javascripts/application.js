// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery_ujs
//= require underscore
//= require gmaps/google
//= require turbolinks
//= require_tree .
//= gmaps4rails/googlemaps.js




$(function() {
  $('.button-to-add-photo').click(function() {
    $(this).parents('form').first().submit()
  })
})


$(document).ready(function(){
  $('.image_template2 img').click(function () {
    $('.image_template3 img').add($('.divOverlay')).fadeIn();
});
  $('.image_template3 img').add($('.divOverlay')).click(function () {
    $('.image_template3 img').add($('.divOverlay')).fadeOut(); 
});

 });
  
  $(document).ready(function(){
    $('#friendship').click(function(){
      $('.friends').toggle("slow");
    });
  });

$(document).ready(function(){
  $(".friend-notification ").click(function(){
    $(".friends-requestes").slideDown("slow");
  });
});

$(document).ready(function(){
  $(".notifications").mouseenter(function(){
    $(".friends-requestes").fadeOut("slow");
  });
});

  

