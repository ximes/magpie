!function(){var e=function(e){return e.replace(/(^\s*)|(\s*$)/gi,"").replace(/\s+/gi," ").split(" ").length};window.Parsley.addValidator("minwords",function(r,d){return e(r)>=d},32).addMessage("en","minwords","This value needs more words"),window.Parsley.addValidator("maxwords",function(r,d){return e(r)<=d},32).addMessage("en","maxwords","This value needs fewer words"),window.Parsley.addValidator("words",function(r,d){var a=e(r);return a>=d[0]&&a<=d[1]},32).addMessage("en","words","This value has the incorrect number of words")}();