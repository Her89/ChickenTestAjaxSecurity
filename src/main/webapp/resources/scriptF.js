var url = window.location.href.toString();
var langParts = url.split("=");
var lang = langParts[1];
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
}); 

$(document).ready(function(){

	jQuery.i18n.properties({
	    name: 'messages', 
	    path: contextPath+'/resources/messages/', 
	    mode: 'both',
	    language: lang
	     
	});

	
	 $.ajaxSetup({ cache: false });
	 
	loadList();	
	
	

	$("#nameError").hide();
	
	
	$("table").on("click",".delete", function(){
		var url= "Delete/"+$(this).attr('id')	
		
		$.ajax({
			url: url,
			success: loadList
			})
				
		});
	
	$("#new").on("click", function(){
		$("#Form").removeClass("Update").addClass("New");
		$("#title").text($.i18n.prop('NewFarm'));
		$("#name").val("");
		$("#nameError").hide();


		
	});
	
	$("#Form").on("submit", function(e){
		
		
		
		e.preventDefault();
		
		
		if($("#Form").hasClass("New")){
		
		
		
		if(isNameOk()){
			
					
		var farm = {
				name: $("#name").val()
				}
		
			
		$.ajax({
			url: "New",
			type: "POST",
			data: farm,
			success: function(data){
				loadList()
				$("#name").val("")
				$('#myModal').modal('toggle');			}
		})
					
					
		}}
		
		if($("#Form").hasClass("Update")){
			
			if(isNameOk()){
			
			
			var farm = {
					
					id: $("#name").attr('FarmID'),
					name: $("#name").val()
					}
			
				
			$.ajax({
				url: "Update",
				type: "POST",
				data: farm,
				success: function(data){
					loadList()
					$("#name").val("");
					$('#myModal').modal('toggle');	
				}
			})
						
						
			}}});
		
			
	$("#name").blur(function(){
		
		isNameOk();
		});
	
	
	//UPDATE
	
	$("table").on("click",".update", function(){
		$("#Form").removeClass("New").addClass("Update");
		$("#title").text($.i18n.prop('ModifyFarm'));

		$("#nameError").hide();

		$("#name").val($(this).attr('name'));
		$("#name").attr('FarmID', $(this).attr('id'));


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
	
	$.getJSON("list",
		
		function(data){
		fillTable(data);
	})
}

function fillTable (data){
	$("#results").empty();
	for(var index in data){
		$("#results").append(
				$('<tr>')
				.append(
						$("<td>").append( data[index].name )
						)
				.append(
						$('<td>').append( "<a href=\"../Chickens/"+ data[index].id +"?language="+lang+"\">"+$.i18n.prop('List')+" </a> ")
						)
				.append(
						$("<td>").append( "<button class=\"update  btn btn-success\" data-toggle=\"modal\" data-target=\"#myModal\" name=\""+data[index].name+"\" id=\""+ data[index].id +"\"><span class=\"glyphicon glyphicon-pencil\" aria-hidden=\"true\"></span> </button> ")
						)
				.append(
						$("<td>").append( "<button class=\"delete btn btn-danger\" id=\""+ data[index].id +"\">  <span class=\"glyphicon glyphicon-trash\" aria-hidden=\"true\"></span> </button> ")
						))
	}
}
		

