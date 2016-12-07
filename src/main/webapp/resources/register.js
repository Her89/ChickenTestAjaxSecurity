	var token = $("meta[name='_csrf']").attr("content");
	var header = $("meta[name='_csrf_header']").attr("content");
	
	$(document).ajaxSend(function(e, xhr, options) {
	    xhr.setRequestHeader(header, token);
	}); 
	
	$(document).ready(function(){
	
	$("#btn_register").on("click",function(e){
		
	
		
	
		
	checkUsername().done(function(r){
		
		
		if(userCheck(r) && checkPassword()){
			
			var user={
					username: $("#username").val(),
					password: $("#password").val()
					
			}
			
		
			$.ajax({
				url: "register",
				type: "POST",
				 data: user,
				 success: function(){
					 
					 $('#myModal').modal('toggle');
				 }
									
			})
			
		
		}		
		})
			
				
				
				
			
			
			
		})
	});
		
		
		
	
	
	
	function checkPassword(){
		
		var password = $("#password").val();
		var confPassword=  $("#password_again").val();
		
		if($.trim(password).length == 0 || $.trim(confPassword).length == 0  ){
			
			$("#pass_again_group").addClass("has-error");
			$("#password_group").addClass("has-error");
			$("#passwordError").html("Passwords can't be empty");
			$("#passwordError").show();
			return false;
		}
		
		
		
		if(password==confPassword){
			$("#passwordError").hide();
			$("#pass_again_group").removeClass("has-error");
			$("#password_group").removeClass("has-error");
			$("#pass_again_group, #password_group").addClass("has-success");

			
			return true;
			
		}else{
			$("#pass_again_group, #password_group").removeClass("has-success");

			$("#pass_again_group, #password_group").addClass("has-error");
			$("#passwordError").html("Passwords don't match");
			$("#passwordError").show();
			
			return false;

		}
		
	}
	
	function checkUsername(){
		
	user={username: $("#username").val()};
	
	
	return $.ajax({
			url: "checkUser",
			type: "POST",
			 data: user,
								
		})
			
			
	}
	
	
	function userCheck(result){
		var username= $("#username").val()
		
		if(result == "available"){
			
			if($.trim(username).length == 0){
				$("#user_group").addClass("has-error");

				$("#userError").show();
				$("#userError").html("Username can't be empty");
				
				return false;
			}else{
			
			$("#userError").hide();
			$("#user_group").removeClass("has-error");
			$("#user_group").addClass("has-success");

			return true;
			
		}}
		
		
		if(result == "N/A"){
			
			$("#user_group").addClass("has-error");

			$("#userError").show();
			$("#userError").html("Username already exists");

			return false;
		
		
		
	}
	}