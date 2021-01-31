<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <style>
	table{
		text-align: center;
		width: 100%;
		overflow: auto;
	}
	.lookup{
		background: rgba(252, 145, 58, 0.8);
		width: 100%;
		height: 40px;
		text-align: center;
	}
	.inform{
		position: fixed; 
		bottom: 0; 
		height: 20%;
		background-color: rgba(252, 145, 58, 0.8);
	}
	.off{
		display: none;
	}
	#viewta{
		height: 61%;
		overflow: auto;
	}
	.inform>form>table{
		border-spacing: 10px;
	}
	.optio{
		display:inline-block;
		width: 500px;
		height: 40px;
		margin-left: auto;
	}
	#butgroup{
		width: 250px;
		float: left;
	}
	#formgroup{
		width: 500px;
		float: right;
	}
	.atag{
		display: inline-block;
	}
	
</style>
<script type="text/javascript">
$(document).ready(function(){
	
		$("#insertBut").click(function(){
		    $("#inform").removeClass("off");
		    $("#moform").removeClass("off");
			$("#moform").addClass('off');
		});
		$("#incolseBut").click(function(){		
		    $("#inform").addClass("off");
		});
		$("#mocolseBut").click(function(){		
		    $("#moform").addClass("off");
		});
	
	      $("#modifyBut").click(function(){ 
		      console.log($('input[name="crre_code"]:checked'))
		      if($('input[name="crre_code"]:checked').length==0){
		    	  alert('수정할 내용을 선택해 주세요.')
					return
			      }
	    	$("#moform").removeClass('off');
	    	$("#inform").removeClass('off');
	    	$("#inform").addClass('off');


			var rowData = new Array();
			var tdArr = new Array();
	    	  var radio = $('input[name="crre_code"]:checked')
			
			// 체크된 체크박스 값을 가져온다
			radio.each(function(i) {
	
				// checkbox.parent() : checkbox의 부모는 <td>이다.
				// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
				var tr = radio.parent().parent().eq(i);
				var td = tr.children();
				
				// 체크된 row의 모든 값을 배열에 담는다.
				rowData.push(tr.text());
				
				// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
				var crre_name = td.eq(2).text()
				var crre_code = td.eq(3).text()
				var crre_number = td.eq(4).text()
				var crre_detail = td.eq(5).text()

				$("#mocrre_name").val(crre_name)
				$("#mocrre_code").val(crre_code)
				$("#mocrre_number").val(crre_number)
				$("#mocrre_detail").val(crre_detail)
			});
		
		});

    $('#deleteBut').click(function () {
        if($('input[name="crre_code"]:checked').length==0){
	    	  alert('삭제할 내용을 선택해 주세요.')
				return
		}
        var crre_name =''
        var radio = $('input[name="crre_code"]:checked')
        		radio.each(function(i) {
				var tr = radio.parent().parent().eq(i);
				var td = tr.children();
				crre_name = td.eq(2).text()
			});
        $.ajax({
            type: "get", 
            url: "/ajax/jview/correpondent/deletechk", 
            dataType: "json", 
            contentType : "application/x-www-form-urlencoded; charset=UTF-8",
            data: {goco : crre_name},
            error : function(error) {
            	console.log("error");
            },
            success : function(data) {

	        	if(data[0].chk=='실패'){
	            	alert('사용중인 거래처입니다.')
	            }else{
		         var radioVal = $('input[name="crre_code"]:checked').val()
		        location.href = "/template/jview/correpondent/delete?crre_code="+radioVal 
	            }
            	
            }
         
      	});

	       
        
      });
    $('#informfo').submit(function () {
        var form = $('#informfo')
  
    	$.ajax({
    	    dataType: 'json', 
    	    type : 'get',
    		url: '/ajax/jview/correpondent/insertchk', // <<-- 처리 요청 URL
    		data: form.serialize(),
    		success : function(data) {
        		
        		if(data[0].chk=='실패'){
					alert('중복된 내용이 존재합니다.')
	    			return false;
                }else{
					location.href = '/template/jview/correpondent/insertreg'
                }
    		},error : function(error) {
            	console.log("error");
            	return false;
            }
        });
        return false;
      });

	   
})
</script>
</head>
<body>
<center><h2>회계 관리</h2></center>

<nav class="navbar navbar-light bg-light">
  <div class="container-fluid">
  	<div id="butgroup">
	    <input class="btn btn-secondary" type="button" id= "modifyBut"value="수정" />
		<input class="btn btn-secondary" type="button" id="insertBut" value="입력" />
		<input class="btn btn-secondary" type="button" id = "deleteBut"value="삭제" />
  	 </div>
    <form class="d-flex" action="/template/jview/correpondent/search">
      <input class="form-control me-2" type="search" placeholder="거래처코드" aria-label="거래처코드" name="crre_code">
      <button class="btn btn-outline-success" type="submit">Search</button>
    </form>
  </div>
</nav>
<div id="viewta">
<table class="table table-hover table table-bordered table-warning">
 <thead class="thead-warning">
	<tr class="bg-warning">
		<th scope="col">체크</th>
		<th scope="col">No.</th>
		<th scope="col">거래처명</th>
		<th scope="col">거래처 코드</th>
		<th scope="col">사업자번호</th>
		<th scope="col">상 세</th>
	</tr>
	</thead>
	
	<c:forEach items="${data}" varStatus="no" var="vo">
	<tr>
			<td><input type="radio" name="crre_code" value="${vo.crre_code }"/></td>
			<td scope="col">${no.index+1+pageLimit*(nowPage-1) }</td>
			<td scope="col">${vo.crre_name }</td>
			<td scope="col">${vo.crre_code }</td>
			<td scope="col">${vo.crre_number }</td>
			<td scope="col">${vo.crre_detail }</td>
		</tr>
	</c:forEach>
	   <tr>
      <td colspan="5" align="center">
       	<nav aria-label="Page navigation example">
  			<ul class="pagination">
      	<c:if test="${startPage>1 }">
   			<li class="page-item">
    			<a class="page-link" href="?nowPage=${startPage-1 }" aria-label="Previous">
     			   <span aria-hidden="true">&laquo;</span>
     			</a>
    		</li>	
      	</c:if>
         <c:forEach begin="${startPage }" end="${endPage }" step="1" var="i">
            <c:choose>
               <c:when test="${nowPage==i }">
                  <li class="page-item active"><a class="page-link ">${i }</a></li>
               </c:when>
               <c:otherwise>
                  <li class="page-item"><a class="page-link" href="?nowPage=${i }">${i }</a></li>
               </c:otherwise>
            </c:choose>
         </c:forEach>
      	<c:if test="${endPage<lastPage }">
			<li class="page-item">
			      <a class="page-link" href="?nowPage=${endPage+1 }" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
   		 	</li>
       	</c:if>
 			 </ul>
		</nav>
      </td>
   </tr>
</table>
</div>



<!-- 입력, 수정 폼 -->
	<div class="off inform" id="inform">
		<form id="informfo">
			<table >
				<tr >
					<td width="25%">거래처명<br><input type="text" name="crre_name" required maxlength="10"/></td>
					<td width="25%">거래처 코드<br><input  type="text" name="crre_code" placeholder="영문2글자+숫자3글자조합" pattern="^([a-zA-Z]){2}\d{3}" required maxlength="5"/></td>				
					<td width="25%">사업자번호<br><input type="text" name="crre_number" pattern="\d{3}-\d{2}-\d{5}" maxlength="12" required/></td>
					<td width="25%">상 세<br><input type="text" name="crre_detail" required/></td>
				</tr>
				<tr><td></td></tr>
				<tr height="5%">
					<td colspan="4" align="center">
						<input class="btn btn-secondary" type="submit" value="입력" />
					</td>
					<td colspan="3" align="left">
						<input class="btn btn-secondary" type="button" value="닫기" id="incolseBut" />
					</td>
				</tr>
			</table>
		</form>
	</div>
	<div class="off inform" id="moform">
		<form action=""  >
			<table >
				<tr >
					<td width="25%">거래처명<br><input id="mocrre_name" type="text" name="crre_name" required maxlength="10"/></td>
					<td width="25%">거래처 코드<br><input id="mocrre_code" type="text" name="crre_code" required readonly/></td>				
					<td width="25%">사업자번호<br><input id="mocrre_number" type="text" name="crre_number" placeholder="숫자 3-2-5 형식" pattern="\d{3}-\d{2}-\d{5}" required maxlength="12" /></td>
					<td width="25%">상 세<br><input id="mocrre_detail" type="text" name="crre_detail" maxlength="50" required/></td>
				</tr>
				<tr><td></td></tr>
				<tr height="5%">
					<td colspan="4" align="center">
						<input class="btn btn-secondary" type="submit" value="수정" />
					</td>
					<td colspan="3" align="left">
						<input class="btn btn-secondary" type="button" value="닫기" id="mocolseBut"/>
					</td>
				</tr>
			</table>
		</form>
	</div>



</body>
</html>