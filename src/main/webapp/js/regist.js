function isAgree(){//没点击我同意不能提交表单，给提交按钮设一个禁用
		if(document.getElementById("agree").checked == true){
			document.getElementById("submit").disabled=false;
		}else{
			document.getElementById("submit").disabled=true;
		}
}

  

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
		var repassword=document.getElementById("repassword");
		if(repassword.validity.valueMissing){
			repassword.setCustomValidity("密码不能为空！");
		}else{
			repassword.setCustomValidity("");
		}
		var sclass=document.getElementById("sclass");
		if(sclass.validity.valueMissing){
			sclass.setCustomValidity("班级不能为空！");
		}else{
			sclass.setCustomValidity("");
		}
		var stuno=document.getElementById("stuno");
		if(stuno.validity.valueMissing){
			stuno.setCustomValidity("学号不能为空！");
		}else{
			stuno.setCustomValidity("");
		}
		var phone=document.getElementById("phone");
		if(phone.validity.valueMissing){
			phone.setCustomValidity("手机号不能为空！");
		}else if(phone.validity.patternMismatch){
			phone.setCustomValidity("手机号格式不正确！");
		}else{
			phone.setCustomValidity("");
		}
		var yanzheng=document.getElementById("yanzheng");
		if(yanzheng.validity.valueMissing){
			yanzheng.setCustomValidity("验证码不能为空！");
		}else{
			yanzheng.setCustomValidity("");
		}
	});
	
	//验证两次密码是否一致
	$("#repassword").blur(function(){//失去焦点
			var pwd=$("#password").val();//获得文本框的值
		var pwd2=$("#repassword").val();
		if(pwd!=pwd2){
			alert("两次密码不正确");
		}
		
	});
	
	$("#yanzheng").change(function(){
			var yanzheng=$("#yanzheng").val();
			 $.ajax({
				url:"tianyz?yanzheng="+yanzheng,
				type:"get",
				dataType:"text",
				success:function(data){
					if(data=="n"){
						alert("验证码错误，请重新输入");
					}
					
				}/* ,
				error:function(){
				
				} */
			});
		});
	
});

