<%@page import="erp.hhh.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document).ready(function() {
		$('.MP').click(function() {
			console.log($('input[name="user_id"]').val())

			var data = $('input[name="fromu"]').val()

			location.href="mypage?user_id="+'${mydata.user_id}'
		})
		$('.NP').click(function() {
			var data = $('input[name="user_id"]').val()
			location.href="sendForm?tou=${data.tou}&fromu=${data.fromu}"
		})

	})
</script>

<h2>
	<b>쪽지쓰기</b>
</h2>
<form action="sendReg">
<div class="note_page">
	<table class="table note_tb">
		<thead>
			<tr>
				<th scope="col" width="18%"></th>
				<th scope="col" width="12%">보낸사람</th>
				<th scope="col" width="18%" class="input-group-sm">${data.tou} </th>
				<th scope="col" width="12%">제목</th>
				<th scope="col" width="18%" class="input-group-sm">${data.note_content }</th>
				<th scope="col" width="22%"></th>
			</tr>
		</thead>
		<tr>
			<td>내용</td>
		</tr>
		<tr>
			<td colspan="6" align="left">${data.note_detail}</td>
		</tr>
		</tbody>
	</table>
</div>
<div class="note_SS">
	<input type="button" class="btn btn-secondary btn-sm NP" value="답장" />
	<input type="button" class="btn btn-secondary btn-sm MP" value="마이페이지로" />
</div>
</form>