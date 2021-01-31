/**
 * 
 */
$(document).ready(function() {
		
		$("#select1").click(function(){
			 var goUrl = "/ajax/eview/information/graph"
			 var ss = "데이터입니다.";
			$.ajax({
				url:goUrl,
				type:'GET',
				success : function(data){
					$("#aj").load(goUrl);
					
				},
				error:function(e){
					alert(e.responseText)
				}
			})
		})
	
		$("#select2").click(function(){
			 var goUrl = "/ajax/eview/information/info"
			$.ajax({
				url:goUrl,
				type:"GET",
				success : function(){
					$("#aj").load(goUrl);
				},
				error:function(e){
					alert(e.responseText)
				}
			})
		})    
	})