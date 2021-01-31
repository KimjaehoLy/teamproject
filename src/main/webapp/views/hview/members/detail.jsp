<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">
#layout { /* 전부를 둘러싸고 있는 div */
	width: 80%;
	height: 100%;
	margin: auto;
	margin-top: 2.5%;
	margin-bottom: 2.5%;
	border: 50px solid #62C2E4;
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

.profileImg { /* 사원 사진들어가는 div */
	width: 200px;
	height: 250px;
}

.profileImg>img { /* 사원 이미지 */
	width: 100%;
	height: 100%;
}

.col-xs-12>.btn-primary { /*버튼*/
	color: #fff;
	background-color: #669AE1;
	border-color: #669AE1;
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

		$(".file-upload").on('change', function() {
			readURL(this);
		});

		$("#deleteBtn").click(function(){
			var chk = confirm("회원정보를 삭제하시겠습니까?")
			if(chk){
				location.href='../members/deleteReg?user_id=${data.user_id}&user_num=${data.user_num}'
			}else{
				return
			}
		})
	});	
</script>
</head>
<body>
	<div id="layout">
		<c:set value="${data }" var="vo" />
		<br>
		<div class="col-sm-3">
			<!--left col-->


			<div class="text-center profileImg">
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
			<h3>
				<b>회원 상세</b>
			</h3>
			<div class="tab-content">
				<div class="form-group">
					<div class="left">
						<h4>
							<b>이름</b>
						</h4>
					</div>
					<div class="right">
						<h4>${vo.user_name }</h4>
					</div>
				</div>

				<div class="form-group">
					<div class="left">
						<h4>
							<b>id</b>
						</h4>
					</div>
					<div class="right">
						<h4>${vo.user_id }</h4>
					</div>
				</div>

				<%-- <div class="form-group">
					<div class="left">
						<h4>
							<b>pw</b>
						</h4>
					</div>
					<div class="right">
						<h4>${vo.user_pw }</h4>
					</div>
				</div> --%>

				<div class="form-group">
					<div class="left">
						<h4>
							<b>주민번호</b>
						</h4>
					</div>
					<div class="right">
						<h4>${vo.user_rrn }</h4>
					</div>
				</div>

				<div class="form-group">
					<div class="left">
						<h4>
							<b>이메일</b>
						</h4>
					</div>
					<div class="right">
						<h4>${vo.user_email }</h4>
					</div>
				</div>


				<div class="form-group">
					<div class="left">
						<h4>
							<b>연락처</b>
						</h4>
					</div>
					<div class="right">
						<h4>${vo.user_tel }</h4>
					</div>
				</div>

				<div class="form-group">
					<div class="left">
						<h4>
							<b>주소</b>
						</h4>
					</div>
					<div class="right">
						<h4>${vo.user_add }</h4>
					</div>
				</div>

				<div class="form-group">
					<div class="left">
						<h4>
							<b>성별</b>
						</h4>
					</div>
					<div class="right">
						<h4>${vo.user_gender }</h4>
					</div>
				</div>

				<div class="form-group">
					<div class="left">
						<h4>
							<b>부서/직급</b>
						</h4>
					</div>
					<div class="right">
						<h4>${vo.user_cate }/${vo.user_lev }</h4>
					</div>
				</div>


				<div class="form-group">
					<div class="left">
						<h4>
							<b>급여</b>
						</h4>
					</div>
					<div class="right">
						<h4>
							<fmt:formatNumber value="${vo.user_pay }" pattern="0,000원" />
						</h4>
					</div>
				</div>

				<div class="form-group">
					<div class="left">
						<h4>
							<b>입사일</b>
						</h4>
					</div>
					<div class="right">
						<h4>${vo.user_date }</h4>
					</div>
				</div>

				<div class="form-group">
					<div class="col-xs-12" align="center">
						<button type="button" class="btn btn-primary"
							onclick="location.href='modify?user_id=${vo.user_id}'">
							수정</button>
						<button type="button" class="btn btn-primary selectac"
							id="deleteBtn"<%-- onclick="location.href='../members/deleteReg?user_id=${vo.user_id}&user_num=${vo.user_num}'" id="deleteButton" --%>>삭제</button>
						<button type="button" class="btn btn-primary"
							onclick="location.href='../members/list'">사원 목록</button>
					</div>
				</div>

			</div>
			<!--/tab-pane-->
		</div>
		<!--/tab-content-->

	</div>
	<!--/col-9-->
	<!--/row-->

</body>
</html>