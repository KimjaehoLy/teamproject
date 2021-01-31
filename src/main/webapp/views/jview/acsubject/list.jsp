<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>acsubject</title>
<style>
	table{
	text-align: center;
	}
	.table thead th {
	vertical-align: middle;
	text-align: center;
	}
	table,tr td:last-of-type {
	vertical-align: middle;
	text-align: left;
	}
	.lookup{
		background: rgba(252, 145, 58, 0.8);
		width: 100%;
		height: 50px;
		text-align: center;
	}
	#butgroup{
		width: 250px;
		float: left;
	}
	#formgroup{
		width: 500px;
		float: right;
	}
	.optio{
		display:inline-block;
		width: 500px;
		height: 40px;
		margin-left: auto;
	}
	#viewta{
		height: 90%;
		overflow: auto;
	}
	.atag{
		display: inline-block;
	}
	.off{
		display: none;
	}
	.inform{
		position: fixed; 
		bottom: 0; 
		height: 20%;
		background-color: rgba(252, 145, 58, 0.8);
	}
	table,tr:nth-last-child(1){
		text-align: center;
	}
	
	table,tr td:nth-of-type(1) {
	width: 5%
	}
	table,tr td:nth-of-type(2) {
	width: 10%
	}
	table,tr td:nth-of-type(3) {
	width: 10%
	}
	table,tr td:nth-of-type(4) {
	width: 10%
	}
	table,tr td:nth-of-type(5) {
	width: 10%
	}
	table,tr td:nth-of-type(6) {
	width: 50%
	}
	table,tr:nth-last-child(7) {
	text-align: center;
	}

</style>
<script type="text/javascript">
$(document).ready(function(){

})
</script>
</head>
<body>
<center><h2>회계 관리</h2></center>
<nav class="navbar navbar-light bg-light">
  <div class="container-fluid">
    <form class="d-flex" action="/template/jview/acsubject/search">
      <input class="form-control me-2" type="search" placeholder="거래처코드" aria-label="거래처코드" name="accsu_code">
      <button class="btn btn-outline-success" type="submit">Search</button>
    </form>
  </div>
</nav>
<div id="viewta">
<table class="table table-hover table-bordered table-warning">
 <thead class="thead-warning">
	<tr class="bg-warning">
		<th rowspan="2"> chk</th>
		<th rowspan="2">코드</th>
		<th rowspan="2">계정과목</th>
		<th colspan="2">구분</th>
		<th rowspan="2">상세 내용</th>
	</tr>
	<tr class="bg-warning">
		<th>차변</th>
		<th>대변</th>
	
	</tr>
</thead>
	<c:forEach items="${data}" varStatus="no" var="vo">
		<tr>
			<td><input type="radio" name="chkaccsu_code" value="${vo.accsu_code }"/></td>
			<td scope="col">${vo.accsu_code }</td>
			<td scope="col">${vo.accsu_subj }</td>
			<td scope="col">${vo.accsu_de }</td>
			<td scope="col">${vo.accsu_cre }</td>
			<td scope="col">${vo.accsu_detail }</td>
		</tr>
		
	</c:forEach>
	<tr>
      <td colspan="6" align="center" >
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


</body>
</html>