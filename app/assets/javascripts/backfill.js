// Allows legacy calls for usage with jquery3
jQuery.fn.load = function(callback){ $(window).on("load", callback) };
