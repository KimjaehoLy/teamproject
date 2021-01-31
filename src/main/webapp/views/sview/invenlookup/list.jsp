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
         
         code = td.eq(0).text();
         console.log(code);
         
         alert('삭제하시겠습니까?\n삭제 후 복구되지 않습니다.');
         location.href="delete?code="+code;
         
      })
      $(".modify").click(function(){
         var btn = $(this);
         var tr = btn.parent().parent();
         var td = tr.children();
         code = td.eq(0).text();
         console.log(code);
         
         alert('수정하시겠습니까?');
         location.href="modify?code="+code;

         })
      
   })
   
/* $(document).ready(function() {
   
   $("#delete").click(function () {
      var table = $('.dd');
      var tr = table.children().children();
      var td = tr.children();

      code = td.eq(0).text();
      
      location.href="/template/sview/invenlookup/delete?code="+code;
      
   }) 
})

})
 */
</script>
<div>
<h1 align="center">재고 조회</h1>

<div>
<div align="right">
   <form>
   코드&nbsp;
      <input type="text" name="code" />
   제품명&nbsp;
      <input type="text" name="name" />
	거래여부&nbsp;
		<select name="possi">
			<option>
			<option>가능
			<option>대기			
			<option>불가능
		</select>
			<input class="btn btn-success" type="submit" value="조회" />			
	</form>   
</div>
<br>
<form name="inven_modify/delete">
    <div>
   <table border="" class="table table-hover dd">
      <thead class="table-success">
          <tr align="center">

             <th scope="col" width="10%">제품코드</th>
             <th scope="col" width="10%">제품명</th>
             <th scope="col" width="5%">수량</th>
             <th scope="col" width="7%">단가</th>
             <th scope="col" width="12%">제품상세</th>
             <th scope="col" width="7%">거래여부</th>                 
             <th scope="col" width="7%">거래처</th>                 
             <th scope="col" width="10%">등록일</th>          
             <th scope="col" width="7%">수정</th>                 

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
             <td>${vo.possi }</td>
             <td>${vo.client }</td>
             <td><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></td>                                  
            <td>
               <input class="btn btn-success modify" type="button"  value="수정" />
          
             </td>
          </tr>         
      </tbody>
      
      </c:forEach>
      <thead class="table-success">
      <tr>
      <th colspan="9" align="center">
       	<nav aria-label="Page navigation example">
  			<ul class="pagination">
      	<c:if test="${startPage>1 }">
   			<li class="page-item">
    			<a class="page-link" href="?nowPage=${startPage-1 }&code=${vo.search}&name=${vo.search1}&possi=${vo.search2}" aria-label="Previous">
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
                  <li class="page-item"><a class="page-link" href="?nowPage=${i }&code=${vo.search}&name=${vo.search1}&possi=${vo.search2}">${i }</a></li>
               </c:otherwise>
            </c:choose>
         </c:forEach>
      	<c:if test="${endPage<lastPage }">
			<li class="page-item">
			      <a class="page-link" href="?nowPage=${endPage+1 }&code=${vo.search}&name=${vo.search1}&possi=${vo.search2}" aria-label="Next">
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
</body>
</html>
