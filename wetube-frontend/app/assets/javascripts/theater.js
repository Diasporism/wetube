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