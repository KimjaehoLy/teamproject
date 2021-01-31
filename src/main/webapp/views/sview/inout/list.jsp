<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04_inven</title>

<link rel="stylesheet" href="/resources/css/template.css">
<style>
.inven {
	width : 100%;
}
</style>
</head>
<body>
<script>

function re(){
	
	if(confirm("초기화하시겠습니까?\n입력한 내용은 저장되지 않습니다.")){
		frm.submit()
	}
}

</script>

<div>
<h1 align="center">출고 이력</h1>
<div align="right">
	<form>
	출고번호&nbsp;
		<input type="text" name="outno" />
	출고여부&nbsp;
		<select name="outch" id="outch">
			<option>
			<option>완료
			<option>대기
		</select>
					<input class="btn btn-success" type="submit" value="조회" />			
	</form>
</div>
<br>


 	<div>
	<table border="" class="table table-hover">
		<thead class="table-success">
		 	<tr align="center">
		 		<th width="10%" align="center">출고일</th>
		 		<th scope="col" width="10%">출고번호</th>
		 		<th scope="col" width="7%">제품코드</th>
		 		<th scope="col" width="12%">제품명</th>
		 		<th scope="col" width="7%">의뢰수량</th>	 		
		 		<th scope="col" width="7%">출고수량</th>	 				
		 		<th scope="col" width="7%">단가</th>	 				
		 		<th scope="col" width="7%">거래처</th>	 		
		 		<th scope="col" width="10%">제품상세</th>	 		 		 		 		
		 		<th scope="col" width="7%">출고여부</th>	 		 		 		 		
		 		<th scope="col" width="7%">등록일</th>	 		 		 		 		
		 	</tr>
		 </thead>
		<c:forEach items="${data }" varStatus="order_num2" var="vo">
		 <tbody>
		 	<tr align="center">
		 		<td>
		 			<fmt:parseDate value="${vo.outdate }" var="parse" pattern="yyyy-MM-dd"/>
		 			<fmt:formatDate value="${parse }" pattern="yyyy-MM-dd" />		 		
		 		</td>	 		 		
		 		<th>${vo.outno }</th>	 		 		
		 		<td>${vo.code }</td>	 		 		
		 		<td>${vo.name }</td>	 		 		 		 		
		 		<td>${vo.qtt }</td>	 		 		
		 		<td>${vo.outqtt }</td>	 		 		
		 		<td>${vo.cost }</td>	 		 		
		 		<td>${vo.client }</td>	 		 				 		 		 		
		 		<td>${vo.content }</td>	 		 				 		 		 				 				 			 		 				 		
		 		<td>${vo.outch }</td>	 		 				 		 		 				 				 			 		 				 		
		 		<td><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></td>	 		 				 		 		 				 				 			 		 				 		
		 	</tr>
		</tbody>
		</c:forEach>
		
		<thead class="table-success">
      <tr>
      <th colspan="11" align="center">
       	<nav aria-label="Page navigation example">
  			<ul class="pagination">
      	<c:if test="${startPage>1 }">
   			<li class="page-item">
    			<a class="page-link" href="?nowPage=${startPage-1 }&outno=${vo.search}&outch=${vo.search1}" aria-label="Previous">
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
                  <li class="page-item"><a class="page-link" href="?nowPage=${i }&outno=${vo.search}&outch=${vo.search1}">${i }</a></li>
               </c:otherwise>
            </c:choose>
         </c:forEach>
      	<c:if test="${endPage<lastPage }">
			<li class="page-item">
			      <a class="page-link" href="?nowPage=${endPage+1 }&outno=${vo.search}&outch=${vo.search1}" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
   		 	</li>
       	</c:if>
 			 </ul>
		</nav>
      </th>
   </tr>
   </thead>
	 </table>
	 </div>
</div>
</body>
</html>