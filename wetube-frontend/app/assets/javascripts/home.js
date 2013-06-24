$(document).ready(function() {
   $("#home-list").find('img').on('mouseenter', function(){
      $(this).attr("src", 'assets/gif-filler.gif');
   });
   $("#home-list").find('img').on('mouseleave', function(){
      $(this).attr("src", 'assets/home-filler.jpg');
   });
});