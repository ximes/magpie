!function(t){"use strict";var e=function(e){var n=t.Deferred(),a=new FileReader;return a.onload=function(t){n.resolve(t.target.result)},a.onerror=n.reject,a.onprogress=n.notify,a.readAsDataURL(e),n.promise()};t.fn.cleanHtml=function(e){if(!0===t(this).data("wysiwyg-html-mode")&&(t(this).html(t(this).text()),t(this).attr("contenteditable",!0),t(this).data("wysiwyg-html-mode",!1)),!0===e&&t(this).parent().is("form")){var n=t(this).html;if(t(n).has("img").length){var a=t("img",t(n)),o=[],i=t(this).parent();t.each(a,function(e,n){t(n).attr("src").match(/^data:image\/.*$/)&&(o.push(a[e]),t(i).prepend("<input value='"+t(n).attr("src")+"' type='hidden' name='postedimage/"+e+"' />"),t(n).attr("src","postedimage/"+e))})}}var r=t(this).html();return r&&r.replace(/(<br>|\s|<div><br><\/div>|&nbsp;)*$/,"")},t.fn.wysiwyg=function(n){var a,o,i,r=this,l=function(){o.activeToolbarClass&&t(o.toolbarSelector).find(i).each(function(){var e=t(this).data(o.commandRole).split(" "),n=e[0];e.length>1&&document.queryCommandEnabled(n)&&document.queryCommandValue(n)===e[1]?t(this).addClass(o.activeToolbarClass):1===e.length&&document.queryCommandEnabled(n)&&document.queryCommandState(n)?t(this).addClass(o.activeToolbarClass):t(this).removeClass(o.activeToolbarClass)})},s=function(t,e){var n=t.split(" "),a=n.shift(),o=n.join(" ")+(e||""),i=t.split("-");1===i.length?document.execCommand(a,!1,o):"format"===i[0]&&2===i.length&&document.execCommand("formatBlock",!1,i[1]),r.trigger("change"),l()},d=function(e){t.each(e,function(t,e){r.keydown(t,function(t){r.attr("contenteditable")&&r.is(":visible")&&(t.preventDefault(),t.stopPropagation(),s(e))}).keyup(t,function(t){r.attr("contenteditable")&&r.is(":visible")&&(t.preventDefault(),t.stopPropagation())})}),r.keyup(function(){r.trigger("change")})},c=function(){var t,e;return window.getSelection?(t=window.getSelection(),t.getRangeAt&&t.rangeCount&&(e=t.getRangeAt(0))):document.selection&&(e=document.selection.createRange()),e},u=function(){a=c()},m=function(){var t;if(window.getSelection||document.createRange){if(t=window.getSelection(),a){try{t.removeAllRanges()}catch(t){document.body.createTextRange().select(),document.selection.empty()}t.addRange(a)}}else document.selection&&a&&a.select()},h=function(){if(!0!==t(r).data("wysiwyg-html-mode")){var e=t(r).html(),n=t("<pre />");t(n).append(document.createTextNode(e)),t(n).attr("contenteditable",!0),t(r).html(" "),t(r).append(t(n)),t(r).attr("contenteditable",!1),t(r).data("wysiwyg-html-mode",!0),t(n).focus()}else t(r).html(t(r).text()),t(r).attr("contenteditable",!0),t(r).data("wysiwyg-html-mode",!1),t(r).focus()},f=function(n){r.focus(),t.each(n,function(n,a){/^image\//.test(a.type)?t.when(e(a)).done(function(t){s("insertimage",t),r.trigger("image-inserted")}).fail(function(t){o.fileUploadError("file-reader",t)}):o.fileUploadError("unsupported-file-type",a.type)})},p=function(t,e){m(),document.queryCommandSupported("hiliteColor")&&document.execCommand("hiliteColor",!1,e||"transparent"),u(),t.data(o.selectionMarker,e)},g=function(e,n){e.find(i).click(function(){m(),r.focus(),"html"===t(this).data(n.commandRole)?h():s(t(this).data(n.commandRole)),u()}),e.find("[data-toggle=dropdown]").click(m),e.find("input[type=text][data-"+n.commandRole+"]").on("webkitspeechchange change",function(){var e=this.value;this.value="",m(),e&&(r.focus(),s(t(this).data(n.commandRole),e)),u()}).on("focus",function(){var e=t(this);e.data(n.selectionMarker)||(p(e,n.selectionColor),e.focus())}).on("blur",function(){var e=t(this);e.data(n.selectionMarker)&&p(e,!1)}),e.find("input[type=file][data-"+n.commandRole+"]").change(function(){m(),"file"===this.type&&this.files&&this.files.length>0&&f(this.files),u(),this.value=""})},y=function(){r.on("dragenter dragover",!1).on("drop",function(t){var e=t.originalEvent.dataTransfer;t.stopPropagation(),t.preventDefault(),e&&e.files&&e.files.length>0&&f(e.files)})};return o=t.extend(!0,{},t.fn.wysiwyg.defaults,n),i="a[data-"+o.commandRole+"],button[data-"+o.commandRole+"],input[type=button][data-"+o.commandRole+"]",d(o.hotKeys),""!==t(this).attr("placeholder")&&(t(this).addClass("placeholderText"),t(this).html(t(this).attr("placeholder")),t(this).bind("focus",function(){""!==t(this).attr("placeholder")&&t(this).text()===t(this).attr("placeholder")&&(t(this).removeClass("placeholderText"),t(this).html(""))}),t(this).bind("blur",function(){""!==t(this).attr("placeholder")&&""===t(this).text()&&(t(this).addClass("placeholderText"),t(this).html(t(this).attr("placeholder")))})),o.dragAndDropImages&&y(),g(t(o.toolbarSelector),o),r.attr("contenteditable",!0).on("mouseup keyup mouseout",function(){u(),l()}),t(window).bind("touchend",function(t){var e=r.is(t.target)||r.has(t.target).length>0,n=c();n&&n.startContainer===n.endContainer&&n.startOffset===n.endOffset&&!e||(u(),l())}),this},t.fn.wysiwyg.defaults={hotKeys:{"Ctrl+b meta+b":"bold","Ctrl+i meta+i":"italic","Ctrl+u meta+u":"underline","Ctrl+z":"undo","Ctrl+y meta+y meta+shift+z":"redo","Ctrl+l meta+l":"justifyleft","Ctrl+r meta+r":"justifyright","Ctrl+e meta+e":"justifycenter","Ctrl+j meta+j":"justifyfull","Shift+tab":"outdent",tab:"indent"},toolbarSelector:"[data-role=editor-toolbar]",commandRole:"edit",activeToolbarClass:"btn-info",selectionMarker:"edit-focus-marker",selectionColor:"darkgrey",dragAndDropImages:!0,keypressTimeout:200,fileUploadError:function(t,e){console.log("File upload error",t,e)}}}(window.jQuery);