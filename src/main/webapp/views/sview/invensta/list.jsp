<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>01_inven</title>

<link rel="stylesheet" href="/resources/css/template.css">
<style>
.inven {
	width : 100%;
}
</style>
</head>
<body>
<div>
<h1 align="center">재고현황</h1>

 	<div>
 	<button class="btn btn-success" onclick="location.href='/template/sview/invensta/refresh'">갱신</button>
	<table border="" class="table table-hover dd">
      <thead class="table-success">
          <tr align="center">

             <th scope="col" width="7%">제품코드</th>
             <th scope="col" width="10%">제품명</th>
             <th scope="col" width="7%">수량</th>
             <th scope="col" width="7%">단가</th>
             <th scope="col" width="7%">제품상세</th>
             <th scope="col" width="7%">거래처</th>
             <th scope="col" width="10%">등록일</th>          
             <th scope="col" width="7%">거래여부</th>                 
           
          </tr>
       </thead>
      <c:forEach items="${data }" varStatus="code" var="vo">
       <tbody>

          <tr align="center">
             <th>${vo.code }</th>                 
             <td>${vo.name }</td>                 
             <td>${vo.qtt }</td>                 
             <td>${vo.cost }</td>                 
             <td>${vo.content }</td>                 
             <td>${vo.client }</td>                 
             <td><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></td>                                  
             <td>${vo.possi }</td>
           
          </tr>         
      </tbody>
      </c:forEach>
	<thead class="table-success">
      <tr>
      <th colspan="8" align="center">
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
      </th>
   </tr>
   </thead>
    </table>
	 </div>
</div>
</body>
</html>