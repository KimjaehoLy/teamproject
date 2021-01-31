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
		height: 66%;
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

		      if($('input[name="sucode"]:checked').length==0){
		    	  alert('수정할 내용을 선택해 주세요.')
					return
			      } 
	    $("#moform").removeClass('off');
	    $("#inform").removeClass('off');
	    $("#inform").addClass('off');


			var rowData = new Array();
			var tdArr = new Array();
	    	  var radio = $('input[name="sucode"]:checked')
			
			// 체크된 체크박스 값을 가져온다
			radio.each(function(i) {
	
				// checkbox.parent() : checkbox의 부모는 <td>이다.
				// checkbox.parent().parent() : <td>의 부모이므로 <tr>이다.
				var tr = radio.parent().parent().eq(i);
				var td = tr.children();
				
				// 체크된 row의 모든 값을 배열에 담는다.
				rowData.push(tr.text());
				
				// td.eq(0)은 체크박스 이므로  td.eq(1)의 값부터 가져온다.
				var mojouno = td.eq(1).text()
				var mocode = td.eq(2).text()
				var regdate = td.eq(3).text()
				var modepri = td.eq(4).text()
				var modesu = td.eq(5).text()
				var mocrpri = td.eq(6).text()
				var mocrsu = td.eq(7).text()
				var moacc = td.eq(8).text()
				

				$("#mojouno").val(mojouno)
				$("#regdate").val(regdate)
				$("#modepri").val(modepri)
				$("#modesu").val(modesu)
				$("#mocrpri").val(mocrpri)
				$("#mocrsu").val(mocrsu)
				$("#mocode").val(mocode)
				$("#moacc").val(moacc)
			});
		
		});

    $('#deleteBut').click(function () {
        if($('input[name="sucode"]:checked').length==0){
	    	  alert('삭제할 내용을 선택해 주세요.')
				return
		      } 
        var radioVal = $('input[name="sucode"]:checked').val()
        location.href = "/template/jview/journal/delete?sucode="+radioVal
        
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
    <form class="d-flex" action="/template/jview/journal/search">
      <input class="form-control me-2" type="search" placeholder="거래처" aria-label="거래처" name="sucode">
      <button class="btn btn-outline-success" type="submit">Search</button>
    </form>
  </div>
</nav>
<div id="viewta">
<table class="table table-hover table table-bordered table-warning">
 <thead class="thead-warning">
	<tr class="bg-warning">
		<th scope="col" colspan="4">구 분</th>
		<th scope="col" colspan="2">차 변</th>
		<th scope="col" colspan="2">대 변</th>
		<th scope="col" colspan="1">거래처</th>
	</tr>
	<tr class="bg-warning">
		<th scope="col">체크</th>
		<th scope="col">번호</th>
		<th scope="col">코드</th>
		<th scope="col">년/월/일</th>
		<th scope="col">금액</th>
		<th scope="col">계정과목</th>
		<th scope="col">금액</th>
		<th scope="col">계정과목</th>
		<th scope="col">거래처명</th>
	</tr>
	</thead>
	
	
	<!-- 번호별 8개출력 -->
	<c:forEach items="${data}" varStatus="no" var="vo">
	<tr>
			<td><input type="radio" name="sucode" value="${vo.sucode }"/></td>
			<td scope="col">${no.index+1+pageLimit*(nowPage-1) }</td>
			<td scope="col">${vo.sucode }</td>
			<td><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd (E)"/></td>
			<td scope="col">${vo.deprice }</td>
			<td scope="col">${vo.desubj }</td>
			<td scope="col">${vo.creprice }</td>
			<td scope="col">${vo.cresubj }</td>
			<td scope="col">${vo.account }</td>
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
                  <li class="page-item"><a class="page-link" href="?nowPage=${i }&sucode=${param.sucode}">${i }</a></li>
               </c:otherwise>
            </c:choose>
         </c:forEach>
      	<c:if test="${endPage<lastPage }">
			<li class="page-item">
			      <a class="page-link" href="?nowPage=${endPage+1 }&sucode=${param.sucode}" aria-label="Next">
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
		<form action="/template/jview/journal/insertreg"  >
			<table >
				<tr>
					<th colspan="1" ><br>구분</th>
					<th colspan="2" ><br>차 변</th>
					<th colspan="2"><br>대 변</th>
					<th colspan="1"><br>거래처</th>
				</tr>
				<tr >
					<td width="10%">분개코드 <br><input type="text" name="sucode" placeholder="영문1글자+숫자3글자조합" pattern="^([a-zA-Z]){1}\d{3}" required maxlength="4"/></td>
					<td width="10%">금액 <br><input type="number" name="deprice"/></td>
					<td width="10%">계정과목 <br><input type="text" name="desubj" pattern="^([ㄱ-힣]){2,}"/></td>				
					<td width="10%">금액 <br><input type="number" name="creprice"/></td>
					<td width="10%">계정과목 <br><input type="text" name="cresubj" pattern="^([ㄱ-힣]){2,}"/></td>
					<td width="10%">거래처명 <br><input type="text" name="account" required/></td>
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
		<form action="/template/jview/journal/modify"  >
			<table >
				<tr>
					<th colspan="3" ><br>구 분</th>
					<th colspan="2" ><br>차 변</th>
					<th colspan="2"><br>대 변</th>
					<th colspan="2"><br>거래처</th>
				</tr>
				<tr >
					<td width="10%" >번호 <br><input id="mojouno" type="text" name="jou_no" readonly/></td>
					<td width="10%" >날짜 <br><input id="regdate" type="text" name="" readonly/></td>
					<td width="10%" >코드 <br><input id="mocode" type="text" name="sucode" placeholder="영문1글자+숫자3글자조합" pattern="^([a-zA-Z]){1}\d{3}" required maxlength="5"/></td>
					<td width="10%" >금액 <br><input id="modepri" type="text" name="deprice"/></td>
					<td width="10%" >계정과목 <br><input id="modesu" type="text" name="desubj" pattern="^([ㄱ-힣]){2,}"/></td>				
					<td width="10%" >금액 <br><input id="mocrpri" type="text" name="creprice"/></td>
					<td width="10%" >계정과목 <br><input id="mocrsu" type="text" name="cresubj" pattern="^([ㄱ-힣]){2,}"/></td>
					<td width="10%" >거래처명 <br><input id="moacc" type="text" name="account" required/></td>
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