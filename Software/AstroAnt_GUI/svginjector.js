// I must inject this not only at flowiographic0, but at each new instance of flowiographic. Thus,
// Inside this file, I am going to invoke the function on the 0th instance, but then in my tabs.js
// file, I will invoke this function on other instances.

injectSVG('flowiographic0',0);

function injectSVG(elementID,i){
  let flowiographic = document.getElementById(elementID);
  flowiographic.innerHTML = `
  <center>
  <img src="ant.png" width="300">
</div><!--End SVG graphic-->
`
}
