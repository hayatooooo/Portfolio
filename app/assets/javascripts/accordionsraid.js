$(".option").click(function(){
   //クリック時点で他のスライドについているactiveを削除
   $(".option").removeClass("active");
   //クリックしたスライドにactive付与   
   $(this).addClass("active");
});