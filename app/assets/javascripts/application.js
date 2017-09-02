// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
//= require jquery
//= require jquery_ujs
//= require jquery-ui
//= require cocoon
//= require gentelella
//= require gentelella-custom
//= require jquery.mjs.nestedSortable.js

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

function addLeaf(event, data){
  console.log("add!")
  console.log(data)
  let item = data.item[0];
  let item_id = $(item).data('id');
  let step_id = $(event.target).data('step');
  let atom_id = $(item).data('id');

  
  let rule_info = { step_id: step_id, atom_id: atom_id, order: data.item.index() };
  if (item.parentNode.parentElement.dataset.id !== undefined){
    rule_info['parent_id'] = item.parentNode.parentElement.dataset.id;
  }

  let post_data = {rule: rule_info}
  //console.log(data.item.index());

  var request = $.ajax({
    url: "/rules/",
    method: "POST",
    data: post_data
  });
   
  request.done(function(response) {
    $(data.item[0]).data("id", response.id);
    $.growl({ message: "yeeeee" });
  });
   
  request.fail(function( jqXHR, textStatus, msg ) {
    $.growl.error({ message: jqXHR });
    console.log(msg)
    console.log(textStatus)
  });
}
function updateLeaf(event, data){
  console.log("update!")
  //update leaf

  let item = data.item[0];
  let item_id = $(item).data('id');
  let order = $(item).data('id');
  console.log(data)
  let rule_info = {order: data.item.index()};
  if (item.parentNode.parentElement.dataset.id !== undefined){
    rule_info['parent_id'] = item.parentNode.parentElement.dataset.id;
  }
  let post_data = {rule: rule_info};
  
  console.log(post_data)
  console.log(item_id)

  var request = $.ajax({
    url: "/rules/" + item_id,
    method: "PATCH",
    data: post_data
  });
   
  request.done(function( msg ) {
    $.growl({ message: "yeeeee" });
  });
   
  request.fail(function( jqXHR, textStatus ) {
    $.growl.error({ message: "The kitten is attacking!" + textStatus });
  });
}

function moveLeaf(event, data){
  console.log("move!!")
  //update leaf

  let item = data.item[0];
  let item_id = $(item).data('id');
  let order = $(item).data('id');
  
  let post_data = {rule: {parent_id: item.parentNode.parentElement.dataset.id || 0, order: data.item.index()}};
  
  console.log(item_id)
  console.log(post_data)
  console.log(data)

  var request = $.ajax({
    url: "/rules/" + item_id + "/move",
    method: "PATCH",
    data: post_data
  });
   
  request.done(function( msg ) {
    $.growl({ message: "yeeeee" });
  });
   
  request.fail(function( jqXHR, textStatus ) {
    $.growl.error({ message: "The kitten is attacking!" + textStatus });
  });
}

$(document).ready(function(){
  $("#job_customizable").on('click', toggle_job_customization);
  toggle_job_customization();

  $('.draggable').sortable({
    connectWith: '.connectedList',
    helper: function(e, li) {
        copyHelper= li.clone().insertAfter(li);
        return li.clone();
    },
    stop: function() {
        copyHelper && copyHelper.remove();
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
      addLeaf(event, data);
      copyHelper= null;
    }
  }).disableSelection();

});
