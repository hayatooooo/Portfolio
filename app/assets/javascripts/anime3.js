//HTML要素を検出・取得
var textWrapper = document.querySelector(".talkanime");
//html要素の中身を変更
textWrapper.innerHTML = textWrapper.textContent.replace(/\S/g, "<span class='letter'>$&</span>");

anime.timeline({loop: false})
  .add({
    //ダウン
    targets: ".talkanime .letter",
    translateY: [-100,0],
    easing: "easeOutExpo",
    duration: 1400,
    delay: (el, i) => 30 * i
  });