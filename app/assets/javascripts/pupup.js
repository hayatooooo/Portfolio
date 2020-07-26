//6×6のピース設定にしたが、デプロイ後、最下段のパネルがはみ出るため、6×5に変更
var numOfPieces = 6 * 5;

//大量の要素をDOMに追加する際→createDocumentFragment
var frag = document.createDocumentFragment();

function insertInnerPieces($el, innerPieces) {
  for (var i = 0; i < innerPieces; i++) {
    //divを作成し、popup_piece-innerを付与したものを各ピースごとに3つ作成
    var $inner = document.createElement('div');
    $inner.classList.add('popup_piece-inner');
    $el.appendChild($inner);
  }
}
//divを作成し、popup_pieceを付与したピースを作成
for (var i = 1; i <= numOfPieces; i++) {
  var $piece = document.createElement('div');
  $piece.classList.add('popup_piece');
  
  insertInnerPieces($piece, 3);
  frag.appendChild($piece);
}

//querySelector→HTML要素を検出・取得
//appendChild→特定の親ノードの子ノードの最後にノードを追加
document.querySelector('.popup_pieces').appendChild(frag);

var $popupsCont = document.querySelector('.popups-cont');
var $popup = document.querySelector('.popup');
var popupAT = 900;

//クリックされたら、activeを付与
document.addEventListener("turbolinks:load", function() {document.querySelector('.popup-btn').addEventListener('click', function() {
  $popupsCont.classList.add('s--popup-active');
  $popup.classList.add('s--active');
});});

//閉じるとき、active除去して、close付与
function closeHandler() {
  $popupsCont.classList.remove('s--popup-active');
  $popup.classList.remove('s--active');
  $popup.classList.add('s--closed');
  
  //遅延
  setTimeout(function() {
    $popup.classList.remove('s--closed');
  }, popupAT);
}

document.querySelector('.popup_close').addEventListener('click', closeHandler);
document.querySelector('.popups-cont_overlay').addEventListener('click', closeHandler);
