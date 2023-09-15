/**
 * 
 */
/**
 * 
 */
// 내 페이지 js 
let tabHeader = document.getElementsByClassName("tab-header")[0];
let tabIndicator = document.getElementsByClassName("tab-indicator")[0];
let tabBody = document.getElementsByClassName("tab-body")[0];

let tabsPane = tabHeader.getElementsByTagName("div");

for(let i=0;i<tabsPane.length;i++){
  tabsPane[i].addEventListener("click",function(){
    tabHeader.getElementsByClassName("active")[0].classList.remove("active");
    tabsPane[i].classList.add("active");
    tabBody.getElementsByClassName("active")[0].classList.remove("active");
    tabBody.getElementsByTagName("div")[i].classList.add("active");
    
    tabIndicator.style.left = `calc(calc(100% / 4) * ${i})`;
  });
}
// 

// NAV js 
/*let highlight;

function addClass(target) {
    const items = document.querySelectorAll('.selector-item');
    items.forEach(el => el.classList.remove('selector-item--active'));
    target.classList.add('selector-item--active');
}

function selectItem(event) {
  const target = event.target;
  const items = document.querySelectorAll('.selector-item');
  const parent = document.querySelector('.selector');
  const targetRect = target.getBoundingClientRect();
  const parentRect = parent.getBoundingClientRect();
  
  items.forEach(el => el.classList.remove('selector-item--active'));

  highlight.style.left = `${targetRect.left - parentRect.left}px`;
  
  addClass(target);
  setHighlightWidth(target);
}
setHighlightWidth();*/




 