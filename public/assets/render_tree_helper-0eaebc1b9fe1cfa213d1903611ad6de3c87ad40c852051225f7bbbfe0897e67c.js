(function() {
  this._escape = function(str) {
    return str.replace(/&/g, '&amp;').replace(/>/g, '&gt;').replace(/</g, '&lt;').replace(/"/g, '&quot;');
  };

  this._unescape = function(str) {
    return str.replace(/&amp;/g, '&').replace(/&gt;/g, '>').replace(/&lt;/g, '<').replace(/&quot;/g, '"');
  };

  this.render_tree = function(tree, options) {
    var boost, children, children_html, elem, html, i, item, j, k, l, len, len1, len2, len3, len4, m, min_elem, node, num, opts, roots;
    if (options == null) {
      options = {};
    }
    html = '';
    opts = {
      id: 'id',
      node: null,
      root: false,
      level: 0,
      boost: []
    };
    $.extend(opts, options);
    if (opts['boost'].length !== 0) {
      boost = [];
      for (i = 0, len = tree.length; i < len; i++) {
        node = tree[i];
        num = node.parent_id || 0;
        item = boost[num];
        if (!(item instanceof Array)) {
          boost[num] = [];
        }
        boost[num].push(node);
      }
      opts['boost'] = boost;
    }
    if (!opts.node) {
      roots = opts['boost'][0];
      min_elem = tree[0];
      if (roots.length === 0 && tree.length !== 0) {
        for (j = 0, len1 = tree.length; j < len1; j++) {
          elem = tree[j];
          if (elem.parent_id < min_elem.parent_id) {
            min_elem = elem;
          }
        }
        for (k = 0, len2 = tree.length; k < len2; k++) {
          elem = tree[k];
          if (elem.parent_id === min_elem.parent_id) {
            roots.push(elem);
          }
        }
      }
      for (l = 0, len3 = roots.length; l < len3; l++) {
        node = roots[l];
        $.extend(opts, {
          node: node,
          root: false,
          level: opts.level + 1
        });
        children_html = render_tree(tree, opts);
        html += opts.render_node(node, children_html, opts);
      }
    } else {
      children = [];
      children_html = '';
      children = boost[opts.node.id];
      for (m = 0, len4 = children.length; m < len4; m++) {
        node = children[m];
        $.extend(opts, {
          node: node,
          root: false,
          level: opts.level + 1
        });
        children_html = render_tree(tree, opts);
        html += opts.render_node(node, children_html, opts);
      }
    }
    return html;
  };

}).call(this);
