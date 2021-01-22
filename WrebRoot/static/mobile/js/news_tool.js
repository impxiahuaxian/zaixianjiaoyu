document.addEventListener("touchstart", function(){}, true);
var $$ = document.querySelectorAll.bind(document);
Element.prototype.on = Element.prototype.addEventListener;
Element.prototype.off = Element.prototype.removeEventListener;
var ForEach = function (array, fn) {
  [].forEach.call(array, fn);
};
function disableScroll(e){e.preventDefault();}


document.addEventListener("DOMContentLoaded", function(){

(function(){
  ForEach($$(".piclist .cut"), function (el){
    el.style.height = el.clientWidth + "px";
  });
	ForEach($$(".picclose"),function (el){
		el.addEventListener("click", function(){
			var picLi = closest(this,".piclist>li");
			picLi.parentNode.removeChild(picLi);
		});
	});
})();


// select
ForEach($$(".dtsel"),function (el){
  el.addEventListener("change", function(){
    var dtWrap = closest(this,".dtbox");
    dtWrap.querySelector(".dtlabel").value = this.options[this.options.selectedIndex].text;
  });
});
// end select



(function(){
	ForEach($$(".coursel .dt"),function (el){
		el.addEventListener("click", function(){
			this.parentNode.classList.toggle("open");
		});
	});
	ForEach($$(".coursel .dd>li"),function (el){
		el.addEventListener("click", function(){
			this.classList.toggle("sel");
		});
	});
})();






// 筛选
(function(){
  var body = document.querySelector("body"),
      filterDrop = $$(".filter_drop");
  ForEach($$(".filter_th>li"), function (el){
    el.addEventListener("click", function(){
      if (this.classList.contains("active")) {
        this.classList.remove("active");
        body.classList.remove("show_filter")
        body.off("touchmove", disableScroll);
      }else{
        var filterAttr = this.getAttribute("data-filter");
        radioClass(this,"active");
        body.classList.add("show_filter");
        body.on("touchmove", disableScroll);
        for (var i = filterDrop.length - 1; i >= 0; i--) {
          filterDrop[i].style.display = "none";
          if (filterDrop[i].getAttribute("data-filter") == filterAttr) {
            filterDrop[i].style.display = "block";
            filterDrop[i].on("touchmove", function(e){e.stopPropagation()});
          };
        };
      }
    });
  });
  // 
  listClass($$(".filter_sel>li"),"sel");
})();
// end 筛选

// 底部二级菜单
(function(){
  var Bmenu = document.getElementById("b_menu"),
      Bmenulist = document.getElementById("b_menulist");
      if (Bmenu != null) {
        Bmenu.addEventListener("click", function(){
          Bmenulist.classList.toggle("open_bmenu");
        });
      };
})();
// end 底部二级菜单



// 删除教员编号
ForEach($$(".booklab_close"), function (el){
  el.addEventListener("click", function(){
    var booklab = this.parentNode;
      booklab.parentNode.removeChild(booklab);
  });
});
// end 删除教员编号




});


// 
function radioClass(el,cls){
  ForEach(el.parentNode.children, function (sib){
    sib.classList.remove(cls);
  });
  el.classList.add(cls);
}
function listClass(els,cls){
  ForEach(els, function (el){
    el.addEventListener("click", function(){
      ForEach(this.parentNode.children, function (sib){
        sib.classList.remove(cls);
      });
      this.classList.add(cls);
    });
  });
}
// 


function closest(el, selector) {
  const matchesSelector = el.matches || el.webkitMatchesSelector || el.mozMatchesSelector || el.msMatchesSelector;

  while (el) {
    if (matchesSelector.call(el, selector)) {
      return el;
    } else {
      el = el.parentElement;
    }
  }
  return null;
}


function parentsUntil(el, selector, filter) {
  const result = [];
  const matchesSelector = el.matches || el.webkitMatchesSelector || el.mozMatchesSelector || el.msMatchesSelector;

  // match start from parent
  el = el.parentElement;
  while (el && !matchesSelector.call(el, selector)) {
    if (!filter) {
      result.push(el);
    } else {
      if (matchesSelector.call(el, filter)) {
        result.push(el);
      }
    }
    el = el.parentElement;
  }
  return result;
}