
var url = window.location.href.toString();
var parts = url.split("/");
var farmId = parts[parts.length-1];


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
		$("#title").text($.i18n.prop('NewChicken'));
		$("#name").val("");
		$("#nameError").hide();


		
	});
	
	$("#Form").on("submit", function(e){
		
		
		
		e.preventDefault();
		
		
		if($("#Form").hasClass("New")){
		
		
		
		if(isNameOk()){
			
					
		var chicken = {
				name: $("#name").val(),


				}
		
			
		$.ajax({
			url: "New/"+farmId,
			type: "POST",
			data: chicken,
			success: function(data){
				loadList()
				$("#name").val("")
				$('#myModal').modal('toggle');	

			}
		})
					
					
		}}
		
		if($("#Form").hasClass("Update")){
			
			if(isNameOk()){
			
			
			var chicken = {
				
					id: $("#name").attr("chickenId"),
					name: $("#name").val()
					}
			
				
			$.ajax({
				url: "Update/"+farmId,
				type: "POST",
				data: chicken,			

				
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
		$("#title").text($.i18n.prop('ModifyChicken'));

		$("#nameError").hide();

		$("#name").val($(this).attr('name'));
		$("#name").attr('chickenID', $(this).attr('id'));


	});
	
});	
	
function isNameOk(){
	
	var name = $("#name").val();
	
	if(name.length >15){
			
		$("#nameError").html($.i18n.prop('eNameLength'));
		$("#nameError").show();
		
		return false;
		}else{
	
			
	if ($.trim(name).length == 0) {
			  
			  $("#nameError").html($.i18n.prop('eNameNull'));
				$("#nameError").show();
				
				return false;
			  			  
			  
		  }else{
		$("#nameError").hide();
		return true;
	}
	
	}}
		
		


function loadList(){
	
	var url= "list/"+farmId;
	
	$.getJSON(url,
		
		function(data){
		
		$('#titleTop').html($.i18n.prop('Farm')+": "+data.name);
		if(data.chickenList.length == 0){
			$("table").hide();

			$("#noInfo").html($.i18n.prop('eNoInfo'));
			$("#noInfo").show();
			
		}else{
			fillTable(data);
			$("table").show();
			$("#noInfo").hide();
		
		
	}})
};

function fillTable (data){
	$("#results").empty();

	for(var index in data.chickenList){
		$("#results").append(
				$('<tr>')
				.append(
						$("<td>").append( data.chickenList[index].name )
						)
				.append(
						$("<td>").append( data.chickenList[index].eggList.length )
						)
				.append(
						$('<td>').append( "<a href=\"../Eggs/"+ data.chickenList[index].id +"?language="+lang+"\">"+$.i18n.prop('List')+" </a> ")
						)
				.append(
						$("<td>").append( "<button class=\"update btn btn-success \" data-toggle=\"modal\" data-target=\"#myModal\" name=\""+data.chickenList[index].name+"\" id=\""+ data.chickenList[index].id +"\"> <span class=\"glyphicon glyphicon-pencil\" aria-hidden=\"true\"></span> </button> ")
						)
				.append(
						$("<td>").append( "<button class=\"delete btn btn-danger \" id=\""+ data.chickenList[index].id +"\">  <span class=\"glyphicon glyphicon-trash\" aria-hidden=\"true\"></span> </button> ")
						))
	}
}
		

	