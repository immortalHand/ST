$(function(){
	$(".headerul a").click(function(){
		$(this).css({"background":"#FF4466","color":"white"});
		$(this).parents("li").siblings().children("a").css({"background":"#fff","color":"#FF4466"});
	});
});