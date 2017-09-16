$(document).ready(function(){
  $('.spinner').hide();
  $('.preview-button').closest('form').bind('ajax:beforeSend', function() {
    $('.spinner').show();
  });

  $('.preview-button').closest('form').bind('ajax:complete', function(e, data, status, xhr) {
    console.log(data.responseText);
    try { var response = JSON.parse(data.responseText); }
    catch(err) { var response = "An error occurred"; }
    $('.preview').append("<div>"+response.result+", "+response.date+"</div>");
    $('.spinner').hide();
  });
});
