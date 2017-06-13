//后台主界面
var viewH = document.body.clientHeight;
console.log(viewH);
var right = document.getElementById("right");
right.style.height = (viewH - 80)+"px";
