<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

 <script type="text/javascript" src="/resources/js/searchlist.js"></script>

 
<center><h2>품질관리(검사현황조회)</h2></center>
<body>
<div id="wrapper">
<input type="hidden" id="authority"  value="${authority }" />
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
						<option>진행중
						<option>합격
						<option>불합격
					</select>
					<input class="btn btn-secondary" type="submit" id="btns_3" value="조회" />			
				</form>
			</div>
		</div>		
	 <table class="table" >
	 	<thead class="thead-dark"  >
		 	<tr align="center">
		 		<th width="7.6%">등록날짜</th>
				<th width="4.6%"><input type="checkbox" id="all_check" /></th>
				<th width="6.6%">제품코드</th>
				<th width="6.6%">검사코드</th>
				<th width="7.6%">제품명</th>
				<th width="6.6%">수량</th>
				<th width="6.6%">단가</th>
				<th width="6.6%">시료수량</th>
				<th width="6.6%">적격수량</th>
				<th width="8%">부적격수량</th>
				<th width="6.6%">검사자명</th>
				<th width="6.6%">검사구분</th>
				<th width="6.6%">진행상태</th>
				<th width="6.8%">거래처명</th>
				<th width="5.7%">비고</th>
				<th width="0.1%"></th>		
		 	</tr>	
		 </thead>
	 </table>
	<div class="small">
	 <table class="table table-hover " id="test" >
	 	<c:forEach items="${data }" var="vo" varStatus="no">
	 	<c:set var="sample" value="${vo.qlway }"/>
	 	<c:set var="state" value="${vo.qlstate }"/>
		 <tr align="center">
	 		<td width="7.4%">${vo.regdate }</td>
			<td width="4.6%"><input type="checkbox" name="chk" /></td>
			<td width="6.4%"><a href="detail?pdcode=${vo.pdcode }">${vo.pdcode }</a></td>
			<td width="6.4%">${vo.qlcode }</td>
			<td width="7.3%">${vo.qlpdname }</td>
			<td width="6.5%">${vo.qlcnt }</td>
			<td width="6.4%">${vo.qlprice }</td>
			<td width="6.4%">
					${vo.qlsamplecnt }					
			</td>
			<td width="6.6%">
						${vo.qlsuccnt }
			</td>
			<td width="8%">
						${vo.qlfailcnt }
			</td>
			<td width="6.6%">${vo.testername }</td>
			<td width="6.4%">${vo.qlway }</td>
			<td width="6.4%">${state }</td>
			<td width="6.6%">${vo.customer }</td>						
			<td width="6.2%">
			<c:choose>
				<c:when test="${state=='합격' || state=='불합격'}">
<!-- 					<button type="button" class="btn btn-secondary btn-sm ac">승인</button> -->
					<button type="button" class="btn btn-primary btn-sm ac" data-toggle="modal" data-target="#exampleModal">
					  승인
					</button>				
					<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-dialog-centered">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">이력저장</h5>
					        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
					          <span aria-hidden="true">&times;</span>
					        </button>
					      </div>
					      <div class="modal-body">
					        검사이력에 저장하시겠습니까?
					      </div>
					      <div class="modal-footer">
					        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
					        <button type="button" class="btn btn-primary save">승인</button>
					      </div>
					    </div>
					  </div>
					</div>
				</c:when>
				<c:otherwise>
				<button type="button" class="btn btn-secondary btn-sm mo">수정</button>
				</c:otherwise>
			</c:choose>
			</td>
	 	</tr>	
	 	</c:forEach>
	 	<tr align="center">
			  <td colspan="15">
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
	 </table>
	</div>
</div>
	
</body>
