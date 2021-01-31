<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script type="text/javascript">
	$(document).ready(function() {
		$('.modReg').click(function() {

			var val1 = $('.modID').val()
			var val2 = $('.modPW').val()

			location.href = "modReg?user_id=" + val1 + "&user_pw=" + val2
		});
	})
</script>
<style>
.profileImg > img{
	width: 100%;
	height: 100%;
}
</style>
<input type="hidden" class="modID" value="${data.user_id }" />
<div class="page1">
	<h2>
		<b>마이페이지</b>
	</h2>
	<hr />
	<h6>
		&nbsp;<b>프로필</b>
	</h6>
	<table class="table table-bordered user_align">
		<tbody>
			<tr>
				<td rowspan="5" class="profileImg"><img
					src="/resources/userFile/${data.user_file }" /></td>
				<td>이름</td>
				<td>${data.user_name }</td>
				<td>입사일</td>
				<td>${data.user_date }</td>
			</tr>
			<tr>
				<td>ID</td>
				<td>${data.user_id }</td>
				<td>PW</td>
				<td>
					<div class="col-lg-6 btn-group input-group-sm">
						<input type="password" class="form-control modPW"
							value="${data.user_pw }" /> <input type="submit"
							class="btn btn-secondary btn-sm modReg" value="수정" />
					</div>
				</td>
			</tr>
			<tr>
				<td>연락처</td>
				<td>${data.user_tel }</td>
				<td>이메일</td>
				<td>${data.user_email }</td>
			</tr>
			<tr>
				<td>성별</td>
				<td>${data.user_gender }</td>
				<td>부서/직급</td>
				<td>${data.user_cate }/${data.user_lev }</td>
			</tr>
			<tr>
				<td>주소</td>
				<td colspan="3">${data.user_add }</td>
			</tr>
		</tbody>
	</table>
</div>
<div class="page2">
	<div id="layout">
		<div class="noteImg"><a href="note?tou=${data.user_id}"><img src="/resources/images/mail.png"/></a>쪽지함</div>
		<div class="noteImg"><a href="sendForm?tou=${data.user_id }"><img src="/resources/images/send.png"/></a>쪽지쓰기</div>
	</div>
</div>