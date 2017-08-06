// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//= require jquery3
//= require jquery_ujs
//= require cocoon
//= require gentelella
//= require gentelella-custom

function toggle_job_customization(){
  var conf_container = $("#custom-configuration");
  if ($("#job_customizable:checked").length == 0){
    conf_container.slideUp(); 
      conf_container.find("input:hidden, .configuration-field").prop("disabled", true);
  } else {
    conf_container.slideDown();
    conf_container.find("input:hidden, .configuration-field").prop("disabled", false);
  }
}


$(document).ready(function(){
  $("#job_customizable").on('click', toggle_job_customization);
  toggle_job_customization();
});
