<%@page import="erp.hhh.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function() {
		$('.MP').click(function() {
			console.log($('input[name="user_id"]').val())

			var data = $('input[name="fromu"]').val()

			location.href="mypage?user_id="+data
		})

	})
</script>
<%
	String id =(((UserVO)session.getAttribute("mydata")).getUser_id());
	String ff;
	if(request.getParameter("fromu")!=null)
		ff = request.getParameter("fromu");
	else
		ff = "";
%>
<h2>
	<b>쪽지쓰기</b>
</h2>
<form action="sendReg">
<div class="note_page">
	<table class="table note_tb">
		<thead>
			<tr>
				<th scope="col" width="18%"></th>
				<th scope="col" width="12%">받는사람</th>
				<th scope="col" width="18%" class="input-group-sm"><input type="text" class="form-control" name="tou" value="<%=ff %>" /></th>
				<th scope="col" width="12%">보내는사람</th>
				<th scope="col" width="18%" class="input-group-sm"><input type="text" class="form-control" name="fromu" value="<%=id %>" readonly/></th>
				<th scope="col" width="22%"></th>
			</tr>
			<tr>
				<th scope="col" width="18%"></th>
				<th scope="col" width="12%">제목</th>
				<th scope="col" width="30%" class="input-group-sm"><input type="text" class="form-control" name="note_content" /></th>
			</tr>
		</thead>
		<tr>
			<td colspan="6">내용</td>
		</tr>
		<tr>
			<td colspan="6"><textarea name="note_detail" cols="100" rows="16"></textarea></td>
		</tr>
		</tbody>
	</table>
</div>
<div class="note_SS">
	<input type="submit" class="btn btn-secondary btn-sm" value="쪽지쓰기" />
	<input type="button" class="btn btn-secondary btn-sm MP" value="마이페이지로" />
</div>
</form>