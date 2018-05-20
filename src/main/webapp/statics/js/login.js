
$(function(){
	
	
	
	//点击提交的时候所有的不能为空
	$("#submit").click(function(){
		
		var name=document.getElementById("name");
		if(name.validity.valueMissing){
			name.setCustomValidity("用户名不能为空！");
		}else{
			name.setCustomValidity("");
		}
		var password=document.getElementById("password");
		if(password.validity.valueMissing){
			password.setCustomValidity("密码不能为空！");
		}else{
			password.setCustomValidity("");
		}
		var yanzheng=document.getElementById("yanzheng");
		if(yanzheng.validity.valueMissing){
			yanzheng.setCustomValidity("验证码不能为空！");
		}else{
			yanzheng.setCustomValidity("");
		}
		
	});
	
	
	$("#yanzheng").blur(function(){
			var yanzheng=$("#yanzheng").val();
			 $.ajax({
				url:"tianyz2?yanzheng="+yanzheng,
				type:"get",
				dataType:"text",
				success:function(data){
					if(data=="n"){
						alert("验证码错误，请重新输入");
					}
					
				}
			});
		});
	
});

