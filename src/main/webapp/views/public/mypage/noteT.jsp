<%@page import="erp.hhh.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function() {
		$('.MP').click(function() {
			var data = $('input[name="user_id"]').val()
			location.href="mypage?user_id="+'${mydata.user_id}'
		})
		$('.NP').click(function() {
			var data = $('input[name="user_id"]').val()
			location.href="sendForm?tou="+data
		})
	})

</script>
<h2>
	<b>보낸 쪽지함</b>
</h2>
<div class="note_page">
<input type="button" class="btn btn-secondary btn-sm" onclick="location.href='note?tou=<%=(((UserVO)session.getAttribute("mydata")).getUser_id())%>'" value="받은 쪽지"/>
	<table class="table note_tb">
		<thead>
			<tr>
				<th scope="col" width="5%">번호</th>
				<th scope="col" width="11%">받은사람</th>
				<th scope="col" width="64%">제목</th>
				<th scope="col" width="4%">확인</th>
				<th scope="col" width="8%">날짜</th>
				<th scope="col" width="4%">삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${data }" var="vo" varStatus="i">
				<input type="hidden" name="user_id" value="${vo.fromu }" />
				<tr>
					<td>${i.index+1+pageLimit*(nowPage-1) }</td>
					<td>${vo.tou }</td>
					<td><a href="noteDetail?note_num=${vo.note_num}">${vo.note_content }</a></td>
					<td>${vo.note_chkst }</td>
					<td>${vo.regdate }</td>
					<td><input type="button" class="btn btn-secondary btn-sm" onclick="location.href='deleteTReg?note_num=${vo.note_num}'" value="삭제" /></td>
				</tr>
			</c:forEach>
		</tbody>
			<tr>
      <td colspan="5" align="center">
       	<nav aria-label="Page navigation example">
  			<ul class="pagination">
      	<c:if test="${startPage>1 }">
   			<li class="page-item">
    			<a class="page-link" href="?nowPage=${startPage-1 }&fromu=${mydata.user_id}" aria-label="Previous">
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
                  <li class="page-item"><a class="page-link" href="?nowPage=${i }&fromu=${mydata.user_id}">${i }</a></li>
               </c:otherwise>
            </c:choose>
         </c:forEach>
      	<c:if test="${endPage<lastPage }">
			<li class="page-item">
			      <a class="page-link" href="?nowPage=${endPage+1 }&tou=${mydata.user_id}" aria-label="Next">
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
<div class="note_DD">
	<input type="button" class="btn btn-secondary btn-sm NP" value="쪽지쓰기" />
	<input type="button" class="btn btn-secondary btn-sm MP" value="마이페이지로" />
</div>