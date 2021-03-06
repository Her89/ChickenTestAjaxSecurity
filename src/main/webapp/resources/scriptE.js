
var url = window.location.href.toString();
var parts = url.split("/");
var chickenId = parts[parts.length-1];

var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
}); 

$(document).ready(function(){
	 $.ajaxSetup({ cache: false });
	 
	 jQuery.i18n.properties({
		    name: 'messages', 
		    path: contextPath+'/resources/messages/', 
		    mode: 'both',
		    language: lang
		     
		});

	$("table").hide();
	
	loadList();	
	
	
	
	$("#nameError").hide();
	
	$("#cancel").on("click", function(){
		$("#FormDiv").hide()});
	
	$("table").on("click",".delete", function(){
		var url= "Delete/"+$(this).attr('id')	
		
		$.ajax({
			url: url,
			success: loadList
			})
				
		});
	
	$("#new").on("click", function(){
		$("#Form").removeClass("Update").addClass("New");
		$("#title").text($.i18n.prop('NewEgg'));
		$("#name").val("");

		
	});
	
	$("#Form").on("submit", function(e){
		
		
		
		e.preventDefault();
		$("#nameError").hide();

		
		if($("#Form").hasClass("New")){
		
		
		
		if(isNameOk()){
			
					
		var egg = {
				color: $("#name").val(),


				}
		
			
		$.ajax({
			url: "New/"+chickenId,
			type: "POST",
			data: egg,
			success: function(data){
				loadList()
				
				$("#name").val("")
				$('#myModal').modal('toggle');	

			}
		})
					
					
		}}
		
		if($("#Form").hasClass("Update")){
			
			if(isNameOk()){
			
			
			var egg = {
				
					id: $("#name").attr("eggId"),
					color: $("#name").val()
					}
			
				
			$.ajax({
				url: "Update/"+chickenId,
				type: "POST",
				data: egg,			

				
				success: function(data){
					loadList()
					$("#name").val("");
					$('#myModal').modal('toggle');	


				}

			})
						
						
			}}})
		
		

	
	$("#name").blur(function(){
		
		isNameOk();
		});
	
	
	//UPDATE
	
	$("table").on("click",".update", function(){
		$("#Form").removeClass("New").addClass("Update");
		$("#title").text($.i18n.prop('ModifyEgg'));
		$("#nameError").hide();

		
		$("#name").val($(this).attr('name'));
		$("#name").attr('eggID', $(this).attr('id'));


	});
	
});	
	
	
	function isNameOk(){
		
		var name = $("#name").val();
		
		if(name.length >15){
				
			$("#nameError").html($.i18n.prop('eColorLength'));
			$("#nameError").show();
			
			return false;
			}else{
		
		if ($.trim(name).length == 0) {
				  
				  $("#nameError").html($.i18n.prop('eColorNull'));
					$("#nameError").show();
					
					return false;
				  			  
				  
			  }else{
			$("#nameError").hide();
			return true;
		}
		
		}}
		
		


function loadList(){
	
	var url= "list/"+chickenId;
	
	$.getJSON(url,
		
		function(data){
		var chickenUrl = contextPath+"/Chickens/"+data.farm.id+"?language="+lang;
		$('#return').attr("href",chickenUrl);
		
		if(data.eggList.length == 0){
			$("table").hide();

			$("#noInfo").html($.i18n.prop('eNoInfo'));
			$("#noInfo").show();
			
		}else{
			fillTable(data);
			$("table").show();
			$("#noInfo").hide();
			
			
		}
		
	
		
		
	})
};

function fillTable (data){
	$("#results").empty();

	for(var index in data.eggList){
		$("#results").append(
				$('<tr>')
				.append(
						$("<td>").append( data.eggList[index].color )
						)
				.append(
						$("<td>").append( "<button class=\"update btn btn-success \"  data-toggle=\"modal\" data-target=\"#myModal\" name=\""+data.eggList[index].color+"\" id=\""+ data.eggList[index].id +"\"> <span class=\"glyphicon glyphicon-pencil\" aria-hidden=\"true\"></span> </button> ")
						)
				.append(
						$("<td>").append( "<button class=\"delete btn btn-danger \" id=\""+ data.eggList[index].id +"\"> <span class=\"glyphicon glyphicon-trash\" aria-hidden=\"true\"></span> </button> ")
						))
	}
}
		