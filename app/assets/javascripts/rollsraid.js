document.addEventListener("turbolinks:load", function() {
var carousel = $(".carousel"),
    currdeg  = 0;

//ボタンを押下したら、回転する
$(".snext").on("click", { d: "n" }, rotate);
$(".sprev").on("click", { d: "p" }, rotate);

//60刻みで回転
function rotate(e){
  if(e.data.d == "n"){
    currdeg = currdeg - 60;
  }
  if(e.data.d == "p"){
    currdeg = currdeg + 60;
  }
  //ブラウザ・サポートごとに設定
  carousel.css({
    //Chrome
    "-webkit-transform": "rotateY("+currdeg+"deg)",
    //Firefox
    "-moz-transform": "rotateY("+currdeg+"deg)",
    //Opera
    "-o-transform": "rotateY("+currdeg+"deg)",
    //その他
    "transform": "rotateY("+currdeg+"deg)"
  });
}});