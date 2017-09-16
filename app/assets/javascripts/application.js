// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require cocoon
//= require gentelella
//= require gentelella-custom
//= require jquery.mjs.nestedSortable.js
//= require recurring_select
//= require growl

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

function addLeaf(receiver, event, data){
  var item = data.item[0];
  var item_id = $(item).data('id');
  var step_id = $(event.target).data('step');
  var atom_id = $(item).data('id');
  var item_template = $(data.item[0]).find(".template li");  
  var rule_info = { step_id: step_id, atom_id: atom_id, order: data.item.index() };

  if (item.parentNode.parentElement.dataset.id !== undefined){
    rule_info['parent_id'] = item.parentNode.parentElement.dataset.id;
  }

  var post_data = {rule: rule_info}

  $(item_template).clone().addClass('added').appendTo(receiver);

  var request = $.ajax({
    url: "/rules/",
    method: "POST",
    data: post_data
  });

  request.done(function(response) {
    $('.added').attr("data-id", response.id).removeClass('added');
  });
 
  $(receiver).sortable('refresh');

  request.fail(function( jqXHR, textStatus ) {
    $.growl.error({ message: "An error occurred" + textStatus });
  });
}
function updateLeaf(rule){
  var item = $(rule).parents('.selected-rule');
  var item_id = $(item).data('id');
  var item_name = $(rule).attr('name');

  var rule_info = {};
  if (item_name !== undefined){
    rule_info[item_name] = $(rule).val();
  }
  var post_data = {rule: rule_info};

  var request = $.ajax({
    url: "/rules/" + item_id,
    method: "PATCH",
    data: post_data
  });

  request.fail(function( jqXHR, textStatus ) {
    $.growl.error({ message: "An error occurred" + textStatus });
  });
}

function moveLeaf(event, data){
  var item = data.item[0];
  var item_id = $(item).data('id');
  var order = $(item).data('id');
  var post_data = {rule: {parent_id: item.parentNode.parentElement.dataset.id || 0, order: data.item.index()}};

  var request = $.ajax({
    url: "/rules/" + item_id + "/move",
    method: "PATCH",
    data: post_data
  });

  request.fail(function( jqXHR, textStatus ) {
    $.growl.error({ message: "An error occurred" + textStatus });
  });
}

function removeLeaf(rule){
  var item = $(rule).closest('.selected-rule');
  var item_id = $(item).data('id');

  var request = $.ajax({
    url: "/rules/" + item_id,
    method: "DELETE",
  });
   
  request.done(function( msg ) {
    item.remove();
  });
   
  request.fail(function( jqXHR, textStatus ) {
    $.growl.error({ message: "An error occurred" + textStatus });
  });
}

function toggleLeaf(rule){
  var item = $(rule).closest('.selected-rule');
  var item_id = $(item).data('id');

  $(item).find("[name=toggle]").val($(item).find("[name=toggle]").val() == "false" ? true : false);

  $(rule).find("i").toggleClass("fa-eye-slash").toggleClass("fa-eye");
  $(item).toggleClass("disabled-rule");

  var post_data = {rule: {"enabled": $(item).find("[name=toggle]").val() }};

  var request = $.ajax({
    url: "/rules/" + item_id,
    method: "PATCH",
    data: post_data
  });
      
  request.fail(function( jqXHR, textStatus ) {
    $.growl.error({ message: "An error occurred" + textStatus });
  });
}

$(document).ready(function(){
  $("#job_customizable").on('click', toggle_job_customization);
  toggle_job_customization();

  $('.draggable').sortable({
    connectWith: '.connectedList',
    stop: function(ev, ui) {
      $(this).sortable("cancel");
    }
  }).disableSelection();

  $('.sortable').nestedSortable({
    dropOnEmpty: true,
    handle: 'div',
      items: 'li',
      toleranceElement: '> div',
    // They can only be re-ordered within theire current parent container.
    disableParentChange: false,
    // Set this to true if you don't want empty lists to be removed.
    doNotClear: false,
    // How long (in ms) to wait before expanding a collapsed node 
    // useful only if isTree: true
    expandOnHover: 700,
    // You can specify a custom function to verify if a drop location is allowed. 
    isAllowed: function() { return true; },
    // Set this to true if you want to use the new tree functionality. 
    isTree: true,
    // The list type used (ordered or unordered).
    listType: "ol",
    // The maximum depth of nested items the list can accept. 
    maxLevels: 0,
    // Whether to protect the root level
    protectRoot: false,
    // The id given to the root element 
    rootID: null,
    // Set this to true if you have a right-to-left page.
    rtl: false,
    // Set this to true if you want the plugin to collapse the tree on page load
    startCollapsed: false,
    // How far right or left (in pixels) the item has to travel in order to be nested or to be sent outside its current list. 
    tabSize: 20,
    // custom classes
    branchClass: "mjs-nestedSortable-branch",
    collapsedClass: "mjs-nestedSortable-collapsed",
    disableNestingClass: "mjs-nestedSortable-no-nesting",
    errorClass: "mjs-nestedSortable-error",
    expandedClass: "mjs-nestedSortable-expanded",
    hoveringClass: "mjs-nestedSortable-hovering",
    leafClass: "mjs-nestedSortable-leaf",
    disabledClass: "mjs-nestedSortable-disabled",
    stop: function(event, data){
      moveLeaf(event, data);
    },
    receive: function(event, data) {
      addLeaf(this, event, data);
      //copyHelper= null;
      data.sender.sortable("cancel");
      $(this).sortable('refresh');
    },
  }).disableSelection();

  $(".selected-rule .form-control").on('change', function(){
    updateLeaf(this);
  });
  $(document).on('click', ".selected-rule .delete-node", function(){
    removeLeaf(this);
  });
  $(document).on('click', ".selected-rule .hide-node", function(){
    toggleLeaf(this);
  });
});
