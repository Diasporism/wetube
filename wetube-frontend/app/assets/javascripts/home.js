$(document).ready(function() {
   $("#home-list").find('img').on('mouseenter', function(){
      var gif = $(this).parent('a').data('gif');
      $(this).attr("src", 'assets/'+gif);
   });
   $("#home-list").find('img').on('mouseleave', function(){
      var image = $(this).parent('a').data('image');
      $(this).attr("src", 'assets/'+image);
   });
});