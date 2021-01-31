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
			list.push(td.eq(2).text());
							
				
			})
			$.ajax({
				url : 'deletetwo',
				type : 'POST',
				traditional : true,
				data : {list : list},
				success : function(data){
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
					
		$("#all_check").click(function() {/* 전체체크  */
			ck = $(this).is(":checked"); 
			
			if(ck)$("#test input").prop('checked',true);					
			else $("#test input").prop('checked',false);	
			
		})		
					
		$(".btn-sm.mo").click(function () {
			
			var btn = $(this);
			
			var tr = btn.parent().parent();
			var td = tr.children();		

			code = td.eq(2).text();
		
			location.href="modify?pdcode="+code;			
		})
		
		$(".btn-sm.ac").click(function () {
			var btn = $(this);
			var tr = btn.parent().parent();
			var td = tr.children();		
			var a = $('#authority').val()			

			code = td.eq(2).text();
				if(a=='부장'){
					$(".save").click(function () {				
					location.href="hisinsert?pdcode="+code;								
				})
				}else{
					alert('승인권한이 없습니다.')
					location.href="";
				}
	
			$(".btn-sm").click(function () {
				
				var btn = $(this);
				
				var tr = btn.parent().parent();
				var td = tr.children();		
				pdcode = td.eq(3).text();
				
				location.href="detail?pdcode="+pdcode;
				
						
			})
		})		
	})