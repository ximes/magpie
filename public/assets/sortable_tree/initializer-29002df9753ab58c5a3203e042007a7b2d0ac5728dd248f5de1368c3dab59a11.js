(function(){this.rebuild_sortable_tree=function(e,t,r,a,n){return $.ajax({type:"POST",dataType:"script",url:e,data:{id:t,parent_id:r,prev_id:a,next_id:n},beforeSend:function(){return $(".sortable_tree i.handle").hide()},success:function(){return $(".sortable_tree i.handle").show()},error:function(e,t,r){return console.log(r)}})},this.init_sortable_tree=function(){var e,t,r;return r=$("ol.sortable_tree"),0!==r.length&&(t=r.data("rebuild_url")||r.data("rebuild-url"),e=r.data("max_levels")||r.data("max-levels"),r.nestedSortable({items:"li",helper:"clone",handle:"i.handle",tolerance:"pointer",maxLevels:e,revert:250,tabSize:25,opacity:.6,placeholder:"placeholder",disableNesting:"no-nest",toleranceElement:"> div",forcePlaceholderSize:!0}),r.on("sortupdate",function(){return function(e,r){var a,n,l,i,o,d;return n=r.item,a="node-id",l=n.data(a),d=n.prev().data(a),i=n.next().data(a),o=n.parent().parent().data(a),rebuild_sortable_tree(t,l,o,d,i)}}()),!0)},$(function(){return init_sortable_tree()})}).call(this);