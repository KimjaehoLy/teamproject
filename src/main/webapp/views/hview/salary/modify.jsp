<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#layout { /* 전부를 둘러싸고 있는 div */
	width: 80%;
	height: 650px;
	margin: auto;
	margin-top: 2.5%;
	margin-bottom: 2.5%;
	border: 30px solid #62C2E4;
	border-radius: 20px;
}

.form-group {
	width: 100%;
	height: 5%;
	position: relative;
	clear: both;
}

.left { /* lable들 감싸고 있는 div */
	width: 20%;
	float: left;
	text-align: center;
	/* border-right: 1px solid #ccc; */
}

.right { /* 입력칸들 둘러싸고 있는 div */
	width: 70%;
	float: left;
	line-height: 40px;
}

.right>input[type="text"], #email2 { /* 입력간 전부 */
	width: 40%;
	float: left;
}

#jumin1, #jumin2 { /* 주민 번호 입력칸 첫번째, 두번째 */
	width: 30%;
}

.hypoon { /* 주민번호 하이픈 */
	width: 5%;
	float: left;
	text-align: center;
}

#tel1, #tel2, #tel3 {
	width: 20%
}

#registrationForm { /* 여기 수정 하다가 말음 여기 데이타 들어가는 박스임 */
	/* border: 1px solid #000; */
	display: inline-block;
}

.col-sm-3 { /* 왼쪽 프로필 감싸고 있는 박스 */
	position: relative;
}

.text-center { /* 사원 사진들어가는 div */
	width: 200px;
	height: 250px;
}

.text-center>img { /* 사원 이미지 */
	width: 100%;
	height: 100%;
}
</style>
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		var readURL = function(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('.avatar').attr('src', e.target.result);
				}

				reader.readAsDataURL(input.files[0]);
			}
		}


		$('#submitBtn').click(function(){
			console.log("진입")

			//급여
			if($("#pay").val() == '' || !/^\d{7,}$/.test($("#pay").val()) ){
				alert("급여를 잘못 입력하셨습니다.")
				return
			}

			
			
			frm.submit()
		})
	});
</script>
</head>
<body>
	<form action="modifyReg" method="post" enctype="multipart/form-data"
		name="frm">
		<div id="layout">
			<c:set value="${data }" var="vo" />
			<br>
			<div class="col-sm-3">
				<!--left col-->


				<div class="text-center">
					<c:choose>
						<c:when test="${vo.user_file != null }">
							<img src="/resources/userFile/${vo.user_file }"
								class="avatar img-circle img-thumbnail" alt="avatar">
						</c:when>

						<c:otherwise>
							<img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png"
								class="avatar img-circle img-thumbnail" alt="avatar">
						</c:otherwise>
					</c:choose>
				</div>
				</hr>
				<br>

				<ul class="list-group">
					<li class="list-group-item text-muted">Activity <i
						class="fa fa-dashboard fa-1x"></i></li>
					<li class="list-group-item text-right"><span class="pull-left"><strong>키</strong></span>
						178cm</li>
					<li class="list-group-item text-right"><span class="pull-left"><strong>몸무게</strong></span>
						70kg</li>
					<li class="list-group-item text-right"><span class="pull-left"><strong>취미</strong></span>
						코딩</li>
					<li class="list-group-item text-right"><span class="pull-left"><strong>군필</strong></span>
						필</li>
				</ul>

			</div>
			<!--/col-3-->

			<div class="col-sm-9">
				<h2>급여 수정</h2>
				<div class="tab-content">
					<hr>
					<div class="form-group">
						<div class="left">
							<h4>
								<b>이름</b>
							</h4>
						</div>
						<div class="right">
							<input type="text" class="form-control" name="user_name"
								value="${vo.user_name }" readonly />
						</div>
					</div>

					<div class="form-group">
						<div class="left">
							<h4>
								<b>id</b>
							</h4>
						</div>
						<div class="right">
							<input type="text" class="form-control" name="user_id"
								value="${vo.user_id }" readonly />
						</div>
					</div>


					<div class="form-group">
						<div class="left">
							<h4>
								<b>주민번호</b>
							</h4>
						</div>
						<div class="right">
							<input type="text" class="form-control" id="jumin1"
								name="user_rrn2" value="${vo.user_rrn2[0] }" readonly /> <b
								class="hypoon">-</b> <input type="text" class="form-control"
								id="jumin2" name="user_rrn2" value="${vo.user_rrn2[1] }"
								readonly />
						</div>
					</div>

					<div class="form-group">
						<div class="left">
							<h4>
								<b>이메일</b>
							</h4>
						</div>
						<div class="right">
							<input type="text" class="form-control" name="user_email2"
								value="${vo.user_email2[0] }" readonly /> <b class="hypoon">@</b>
							<input type="text" class="form-control" id="email2"
								name="user_email2" value="${vo.user_email2[1] }" readonly />
						</div>
					</div>


					<div class="form-group">
						<div class="left">
							<h4>
								<b>연락처</b>
							</h4>
						</div>
						<div class="right">
							<input type="text" class="form-control" id="tel1"
								name="user_tel2" value="${vo.user_tel2[0] }" readonly /> <b
								class="hypoon">-</b> <input type="text" class="form-control"
								id="tel2" name="user_tel2" value="${vo.user_tel2[1] }" readonly />
							<b class="hypoon">-</b> <input type="text" class="form-control"
								id="tel3" name="user_tel2" value="${vo.user_tel2[2] }" readonly />
						</div>
					</div>

					<div class="form-group">
						<div class="left">
							<h4>
								<b>주소</b>
							</h4>
						</div>
						<div class="right">
							<input type="text" class="form-control" name="user_add"
								value="${vo.user_add }" readonly />
						</div>
					</div>

					<div class="form-group">
						<div class="left">
							<h4>
								<b>성별</b>
							</h4>
						</div>
						<div class="right">
							<input type="text" class="form-control" id="tel1"
								name="user_gender" value="${vo.user_gender }" readonly />
						</div>
					</div>

					<div class="form-group">
						<div class="left">
							<h4>
								<b>부서/직급</b>
							</h4>
						</div>
						<div class="right">
							<input type="text" class="form-control" id="tel1"
								name="user_cate" value="${vo.user_cate }" readonly /> <b
								class="hypoon">/</b> <input type="text" class="form-control"
								id="tel2" name="user_lev" value="${vo.user_lev }" readonly />

						</div>
					</div>


					<div class="form-group">
						<div class="left">
							<h4>
								<b>월급</b>
							</h4>
						</div>
						<div class="right">
							<input type="text" class="form-control" placeholder="last name"
								name="user_pay" value="${vo.user_pay }" id="pay" />
						</div>
					</div>

					<div class="form-group">
						<div class="col-xs-12" align="center">
							<br>
							<button type="button" class="btn btn-primary" id="submitBtn">완료</button>
							<button type="button" class="btn btn-primary"
								onclick="location.href='../salary/detail?user_id=${vo.user_id }&${dateParam }'">
								뒤로</button>
						</div>
					</div>


				</div>
				<!--/tab-pane-->
			</div>
			<!--/tab-content-->

		</div>
		<!--/col-9-->
		<!--/row-->
	</form>

</body>
</html>