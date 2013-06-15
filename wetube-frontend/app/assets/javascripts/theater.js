// $(function() {
//   loadItems = function(options) {
//     var url = options.url;
//     var destination = options.destination;
//     var template = options.template;

//     destination.html("Loading your big set of data ****");

//     $.getJSON( url, {}, function(data, textStatus, jqXHR) {
//       destination.html("");

//       jQuery.each(data,function(index, element) {
//         var source = template.html();
//         var feedItemTemplate = Handlebars.compile(source);
//         var htmlToAdd = feedItemTemplate(element);
//         destination.append(htmlToAdd);
//       });
//     } );
//   };
// });

$(function() {
  postItems = function(options) {
    var url = options.url;
    var destination = options.destination;
    var template = options.template;
    var value = options.value
    console.log(value);

      jQuery.each(data,function(index, element) {
        var source = template.html();
        var feedItemTemplate = Handlebars.compile(source);
        var htmlToAdd = feedItemTemplate(element);
        destination.append(htmlToAdd);
      });
    } );
  };
});