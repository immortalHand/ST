(function($){
	$(function(){
		$("#user_name").change(function(){
			var name = $(this).val();
			$.ajax({
				type:"post",
				url:"findUser",
				data:"name="+name,
				dataType:"text",
				success:function(data){
					if(data == "noexist"){
						$("#user_name").next().text("不存在");
					}else{
						$("#user_name").next().empty();
					}
				}
			});
		});
	});
})(jQuery);