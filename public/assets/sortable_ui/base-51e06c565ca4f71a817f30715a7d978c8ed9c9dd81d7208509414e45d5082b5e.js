(function() {
  this.TheSortableTree || (this.TheSortableTree = {});

  this.TheSortableTree.SortableUI = (function() {
    return {
      init: function() {
        var max_levels, rebuild_url, sortable_tree;
        sortable_tree = $('.the-sortable-tree');
        if (sortable_tree.length === 0) {
          return false;
        }
        rebuild_url = sortable_tree.data('rebuild_url') || sortable_tree.data('rebuild-url');
        max_levels = sortable_tree.data('max_levels') || sortable_tree.data('max-levels');
        sortable_tree.nestedSortable({
          tabSize: 25,
          listType: 'ol',
          disableNesting: 'the-sortable-tree--no-nest',
          listClass: 'the-sortable-tree--nested-set',
          errorClass: 'the-sortable-tree--sortable-error',
          maxLevels: max_levels,
          placeholder: 'the-sortable-tree--placeholder',
          handle: '.the-sortable-tree--handler',
          toleranceElement: '> div',
          items: 'li',
          helper: 'clone',
          tolerance: 'pointer',
          revert: 250,
          opacity: 0.6,
          forcePlaceholderSize: true
        });
        sortable_tree.on("sortupdate", (function(_this) {
          return function(event, ui) {
            var attr_name, item, item_id, next_id, parent_id, prev_id;
            item = ui.item;
            attr_name = 'node-id';
            item_id = item.data(attr_name);
            prev_id = item.prev().data(attr_name);
            next_id = item.next().data(attr_name);
            parent_id = item.parent().parent().data(attr_name);
            return TheSortableTree.SortableUI.rebuild_sortable_tree(rebuild_url, item_id, parent_id, prev_id, next_id);
          };
        })(this));
        return true;
      },
      rebuild_sortable_tree: function(rebuild_url, item_id, parent_id, prev_id, next_id) {
        return $.ajax({
          type: 'POST',
          dataType: 'script',
          url: rebuild_url,
          data: {
            id: item_id,
            parent_id: parent_id,
            prev_id: prev_id,
            next_id: next_id
          },
          beforeSend: function(xhr) {
            return $('.the-sortable-tree--handler').css({
              opacity: 0
            });
          },
          success: function(data, status, xhr) {
            return $('.the-sortable-tree--handler').css({
              opacity: 1
            });
          },
          error: function(xhr, status, error) {
            return log(error);
          }
        });
      }
    };
  })();

}).call(this);
