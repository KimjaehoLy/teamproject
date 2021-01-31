<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03_inven</title>

<!-- <link rel="stylesheet" href="/resources/css/template.css"> -->
<style>
.inven {
	width : 100%;
}
</style>
</head>
<body>
<c:set var="vo" value="${data }"/>
<script type="text/javascript">
$(document).ready(function() {
      
   $(".delete").click(function () {
        var btn = $(this);
        var tr = btn.parent().parent();
        var td = tr.children();
        
        order_num2 = td.eq(0).text();
        console.log(order_num2);
        
        alert('삭제 후 복구되지 않습니다.');         
       location.href="delete?order_num2="+order_num2;
         
      })
      $(".modify").click(function(){
         var btn = $(this);
         var tr = btn.parent().parent();
         var td = tr.children();

       order_num2 = td.eq(0).text();
       name = td.eq(1).text();
       chk = td.eq(4).text();
         console.log(order_num2);
         console.log(chk);

      if(chk!='승인완료'){
         alert('승인완료된 제품만 출고 가능합니다.');
            return;
      }
         
         alert('제픔을 출고하시겠습니까?');
         
      location.href="modify?order_num2="+order_num2+"&search="+name;

         })
      
   })

</script>
<div>
<h1 align="center">출고의뢰 조회</h1>

<div>
<div align="right">
	<form>
	의뢰번호&nbsp;
		<input type="text" name="order_num2" />
	제품이름&nbsp;
		<input type="text" name="kind" />
			<input class="btn btn-success" type="submit" value="조회" />			
	</form>
</div>
<br>
<form name="inven_modify/delete">
 	<div>
	<table border="" class="table table-hover dd">
		<thead class="table-success">
		 	<tr align="center">
		 		<!-- <th width="150px" align="center">출고예정일</th> -->
		 		<th scope="col" width="12%">출고번호</th>
		 		<!-- <th scope="col" width="12%">제품코드</th> -->
		 		<th scope="col" width="12%">제품명</th>
		 		<th scope="col" width="7%">의뢰수량</th>	 		
		 		<!-- <th scope="col" width="7%">단가</th>	 --> 		
		 		<th scope="col" width="12%">거래처</th>	 		
		 		<!-- <th scope="col" width="12%">제품상세</th> -->	 		
		 		<th width="10%">의뢰승인여부</th>	 		
		 		<th width="10%">담당자</th>	 		
		 		<th width="12%" align="center">등록일</th>
		 		<th scope="col" width="12%">출고</th> 		
		 		 		
		 	</tr>
		 </thead>
		<c:forEach items="${data }" varStatus="order_num2" var="vo">
		 <tbody>
		 	<tr align="center">
		 		<%-- <th>
		 			<fmt:parseDate value="${vo.outdate }" var="parse" pattern="yyyy-MM-dd"/>
		 			<fmt:formatDate value="${parse }" pattern="yyyy-MM-dd" />		 		
		 		</th> --%>	 		 		
		 		<th>${vo.order_num2 }</th>	 		 		
		 		<td>${vo.kind }</td>	 		 		
		 		<%-- <td>${vo.name }</td> --%>	 		 		
		 		<td>${vo.cnt }</td>	 		 		
		 		<%-- <td>${vo.cost }</td> --%>	 		 		
		 		<td>${vo.customer }</td>	 		 		
		 		<td>${vo.chk }</td>	 		 		
		 		<td>${vo.leader }</td>	 		 		
		 		<td>${vo.regdate }</td>	 		 
		 		<td>
					<input class="btn btn-success modify" type="button" value="출고" />

		 		</td>		
		 		<%-- <td><fmt:formatDate value="${vo.regdate }" pattern="YYYY-MM-dd"/></td> --%>	 		 			 		 				 		
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
	    			<a class="page-link" href="?nowPage=${startPage-1 }&order_num2=${vo.search}&kind=${vo.search1}" aria-label="Previous">
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
	                  <li class="page-item"><a class="page-link" href="?nowPage=${i }&order_num2=${vo.search}&kind=${vo.search1}">${i }</a></li>
	               </c:otherwise>
	            </c:choose>
	         </c:forEach>
	      	<c:if test="${endPage<lastPage }">
				<li class="page-item">
				      <a class="page-link" href="?nowPage=${endPage+1 }&order_num2=${vo.search}&kind=${vo.search1}" aria-label="Next">
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

</form>
</div>
</div>
</body>
</html>