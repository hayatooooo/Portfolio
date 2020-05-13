var a = anime.timeline({loop:2})
.add({
    targets: '.ml15 .word',
    scale: [20,1.1],
    opacity: [0,1],
    easing: "easeOutCirc",
    duration: 1000,
    delay: (el, i) => 1000 * i
  }).add({
    targets: '.ml15',
    opacity: 0,
    duration: 1000,
    easing: "easeOutExpo",
    delay: 5000
  });