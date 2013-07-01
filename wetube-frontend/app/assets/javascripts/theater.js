$(document).ready(function() {
  $(".name-form").submit(function(){
    $(this).hide();
  });

  $(".message-form").submit(function(){    
    $("#message-text-area").focus();
  });
});

