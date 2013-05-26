$(document).ready(function(){
  $(".container-info-light").click(function(){
    window.location=$(this).find("a").attr("href");
  });
  $(".gobtn").click(function(){
    window.location=$(this).find("a").attr("href");
  });
});
