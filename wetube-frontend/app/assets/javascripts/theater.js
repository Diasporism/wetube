$(function() {
  var faye = new Faye.Client('http://localhost:9292/faye');
  var theaterId = $('#controls').data().theaterId;
  faye.subscribe(('/theaters/'+theaterId), function (data) {
    alert(data);
  });
});