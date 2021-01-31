/**
 *

			
 */
		function deleteGo(){
			var cnt = $("input[name='chk']:checked").length;
			var list = [];
			$("input[name='chk']:checked").each(function(){	
				var chkbox = $(this)
				var tr = chkbox.parent().parent();
				var td = tr.children()
				list.push(td.eq(3).text());
								
					console.log(list); 
				})
				$.ajax({
					url : 'deletetwo',
					type : 'POST',
					traditional : true,
					data : {list : list},
					success : function(data){
						console.log("컨트롤러에서받은"+data)
					},
					error : function(request, status, error){
						
					}
				})
				if(cnt==0){
					alert('아무것도 선택되지 않았습니다.');
				}
				location.href="list";
			}		
			
	$(document).ready(function () {
			
			$(".btn-sm").click(function () {
				
				var btn = $(this);
				
				var tr = btn.parent().parent();
				var td = tr.children();		
				console.log(td.eq(3).text())
				pdcode = td.eq(3).text();
				
				location.href="detail?pdcode="+pdcode;
				
						
			})
			$(function () {
				$("#all_check").click(function() {
					ck = $(this).is(":checked"); 
									
					if(ck)$("#test input").prop('checked',true);										
					else $("#test input").prop('checked',false);	
					
			})		
		})
	}) 

