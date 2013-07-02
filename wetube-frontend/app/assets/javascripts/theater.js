$(document).ready(function() {
  $(".name-form input").focus();

  $(".name-form").submit(function(){
    $(this).hide();
    $("#message-text-area").focus();
  });

  $(".message-form").submit(function(){    
    $("#message-text-area").focus();
  });
});

