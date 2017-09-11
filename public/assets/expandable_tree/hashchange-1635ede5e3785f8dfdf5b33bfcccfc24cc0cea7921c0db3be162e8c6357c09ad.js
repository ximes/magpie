(function() {
  this._arrays_diff = function(a, b) {
    return b.filter(function(i) {
      return !(a.indexOf(i) > -1);
    });
  };

  this.expandable_tree_hashchange = function(hash_event) {
    var btn, diff_ids, id, j, len, new_arr, new_hash, new_url, oEvent, old_arr, old_hash, old_url, results;
    if (window.skip_expandable_tree_hashchange) {
      window.skip_expandable_tree_hashchange = false;
      return true;
    }
    hash_and_cookie_accordance();
    oEvent = hash_event.originalEvent;
    new_url = oEvent.newURL;
    old_url = oEvent.oldURL;
    new_hash = new_url.split('#')[1];
    old_hash = old_url.split('#')[1];
    if (!(('#' + new_hash).match(TSTconst.re()) || ('#' + old_hash).match(TSTconst.re()))) {
      return false;
    }
    new_arr = _nested_set_hash_arr(new_hash);
    old_arr = _nested_set_hash_arr(old_hash);
    diff_ids = new_arr.length >= old_arr.length ? _arrays_diff(old_arr, new_arr) : _arrays_diff(new_arr, old_arr);
    results = [];
    for (j = 0, len = diff_ids.length; j < len; j++) {
      id = diff_ids[j];
      btn = $("[data-node-id=" + id + "] > .item .expand");
      btn.click();
      results.push(setTimeout(function() {
        return window.skip_expandable_tree_hashchange = false;
      }));
    }
    return results;
  };

  $(window).bind('hashchange', function(hash_event) {
    return expandable_tree_hashchange(hash_event);
  });

}).call(this);
