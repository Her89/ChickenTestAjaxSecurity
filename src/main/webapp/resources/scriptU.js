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
	
	$.getJSON("RoleList",
			
			function(data){
			fillModal(data);
		})
	
	
	
	$("table").on("click",".delete", function(){
		var url= "Delete/"+$(this).attr('id')	
		
		$.ajax({
			url: url,
			success: loadList
			})
				
		});
	
	});
	
	
	function loadList(){
	
	$.getJSON("List",
		
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
						$("<td>").append( data[index].username )
						)
				
				.append(
						$("<td>").append( "<button class=\"delete btn btn-danger\" id=\""+ data[index].id +"\">  <span class=\"glyphicon glyphicon-trash\" aria-hidden=\"true\"></span> </button> ")
						)
				.append($("<td>").append(
						$("<ul ulId=\""+index+"\">"))))
						
						$.each(data[index].roles, function(i,role){
						$( "<li> " + role.roleName + "</li>").appendTo("[ulId='"+index+"']");
						})
							
							
		}	
			
}

function fillModal(data){
	
	
	
	
	
	
}
	