(function(){this._arrays_diff=function(e,n){return n.filter(function(n){return!(e.indexOf(n)>-1)})},this.expandable_tree_hashchange=function(e){var n,a,t,r,h,i,_,s,c,d,o,f,l;if(window.skip_expandable_tree_hashchange)return window.skip_expandable_tree_hashchange=!1,!0;if(hash_and_cookie_accordance(),c=e.originalEvent,s=c.newURL,f=c.oldURL,_=s.split("#")[1],o=f.split("#")[1],!("#"+_).match(TSTconst.re())&&!("#"+o).match(TSTconst.re()))return!1;for(i=_nested_set_hash_arr(_),d=_nested_set_hash_arr(o),a=i.length>=d.length?_arrays_diff(d,i):_arrays_diff(i,d),l=[],r=0,h=a.length;r<h;r++)t=a[r],n=$("[data-node-id="+t+"] > .item .expand"),n.click(),l.push(setTimeout(function(){return window.skip_expandable_tree_hashchange=!1}));return l},$(window).bind("hashchange",function(e){return expandable_tree_hashchange(e)})}).call(this);