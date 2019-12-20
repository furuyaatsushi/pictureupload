$(document).on('turbolinks:load', function(){

  var filefield = $('#tweet_images_attributes_0_url')
  var filefield1 = $('#tweet_images_attributes_1_url')

  $(filefield).on('change', filefield, function(e){
    file = e.target.files[0]
    reader = new FileReader(),
    preview = $("#0");

    reader.onload = (function(file) {
      return function(e) {
        preview.empty();
        preview.append($('<img>').attr({
          src: e.target.result,
          height: "100%",
          class: "preview",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);

  });

  $(filefield1).on('change', filefield, function(e){
    file = e.target.files[0]
    reader = new FileReader(),
    preview = $("#1");

    reader.onload = (function(file) {
      return function(e) {
        preview.empty();
        preview.append($('<img>').attr({
          src: e.target.result,
          height: "100%",
          class: "preview",
          title: file.name
        }));
      };
    })(file);
    reader.readAsDataURL(file);
  });
});