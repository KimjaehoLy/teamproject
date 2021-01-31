<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
   


 <script type="text/javascript" src="/resources/js/history.js"></script>


<center><h2>품질관리(검사이력관리)</h2></center>
<div id="wrapper">
		<div id="searchform" align="right">
		<input class="btn btn-secondary" type="button" id="delete" onclick="deleteGo()" value="삭제" />
			<div class="search">
				제품번호&nbsp
				<form action="">
					<input type="text" name="pdcode"/>			
				제품명&nbsp				
					<input type="text" name="qlpdname"/>				
				진행상태&nbsp			
					<select name="qlstate" id="state">
						<option>
						<option>대기
						<option>합격
						<option>불합격
					</select>
					<input class="btn btn-secondary" type="submit" id="btns_3" value="조회" />			
				</form>
			</div>
		</div>		
		<div class="hbig">	
			<table class="table table-hover" >
				  <thead class="thead-dark"  >
				    <tr align="center">
				        <th scope="col" width="11%" id="no">No</th>
				        <th scope="col" width="12%" id="no">등록날짜</th>
				        <th width="7%"><input type="checkbox" id="all_check" /></th>
				 		<th scope="col" width="12%">제품코드</th>
				 		<th scope="col" width="12%">제품명</th>
				 		<th scope="col" width="11%">제품수량</th>
				 		<th scope="col" width="11%">검사자명</th>
				 		<th scope="col" width="12%">검사결과</th>
				 		<th scope="col" width="11%">상세</th>
				 		<th scope="col" width="2%"></th> 	
				    </tr>
				  </thead>
			</table>		
			<div class="hsmall">	
				<table class="table table-hover" id="test" >
					<tbody>
						  <c:forEach items="${data }" var="vo" varStatus="no">
							    <tr align="center">
								    <th scope="row" width="11%">${no.index+1 }</th>
								    <th scope="row" width="12%">${vo.regdate }</th>
								    <td width="7%"><input type="checkbox" name="chk" id="gg" /></td>
								    <td width="12%">${vo.pdcode }</td>
							 		<td width="12.5%">${vo.qlpdname }</td>
							 		<td width="11%">${vo.qlcnt }</td>
							 		<td width="11%">${vo.testername }</td>
							 		<td width="11.5%">${vo.qlstate }</td>
							 		<td width="12%">						 		
							 		<button type="button" class="btn btn-secondary btn-sm">상세</button>
									</td>			
							    </tr>					  						  
						  </c:forEach>
						  <tr align="center">
							  <td colspan="9">
							  	<nav aria-label="Page navigation example" id="num">
						  			<ul class="pagination">
						      	<c:if test="${startPage>1 }">
						   			<li class="page-item">
						    			<a class="page-link" href="?nowPage=${startPage-1 }&pdcode=${vo.search1}&qlpdname=${vo.search2}&qlstate=${vo.search3}" aria-label="Previous">
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
						                  <li class="page-item"><a class="page-link" href="?nowPage=${i }&pdcode=${vo.search1}&qlpdname=${vo.search2}&qlstate=${vo.search3}">${i }</a></li>
						               </c:otherwise>
						            </c:choose>
						         </c:forEach>
						      	<c:if test="${endPage<lastPage }">
									<li class="page-item">
									      <a class="page-link" href="?nowPage=${endPage+1 }&pdcode=${vo.search1}&qlpdname=${vo.search2}&qlstate=${vo.search3}" aria-label="Next">
									        <span aria-hidden="true">&raquo;</span>
									      </a>
						   		 	</li>
						       	</c:if>
						 			 </ul>
								</nav>
							  </td>
						  </tr>
					  </tbody>
				</table>
			</div>	
			
	  </div>	
</div>