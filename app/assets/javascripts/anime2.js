anime.timeline({loop: true})
  .add({
    //白色外枠フェードアウト
    targets: ".updateanime .circle-white",
    scale: [0, 3],
    opacity: [1, 0],
    easing: "easeInOutExpo",
    rotateZ: 360,
    duration: 1100
  }).add({
    //黄色外枠フェードイン
    targets: ".updateanime .circle-container",
    scale: [0, 1],
    duration: 1100,
    easing: "easeInOutExpo",
    offset: "-=1000"
  }).add({
    //黄色円フェードイン
    targets: ".updateanime .circle-dark",
    scale: [0, 1],
    duration: 1100,
    easing: "easeOutExpo",
    offset: "-=600"
  }).add({
    //文字1行目フェードイン
    targets: ".updateanime .letters-left",
    scale: [0, 1],
    duration: 1200,
    offset: "-=550"
  }).add({
    //文字2行目フェードイン
    targets: ".updateanime .bang",
    scale: [0, 1],
    rotateZ: [45, 10],
    duration: 1200,
    offset: "-=1000"
  }).add({
    //遅延
    targets: ".updateanime",
    opacity: 0,
    duration: 1000,
    easing: "easeOutExpo",
    delay: 1400
  });

anime({
  //回転
  targets: ".updateanime .circle-dark-dashed",
  rotateZ: 360,
  duration: 8000,
  easing: "linear",
  loop: true
});