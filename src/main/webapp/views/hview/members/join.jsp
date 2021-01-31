<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.right>input[type="text"], #email2, #cate, #lev, #user_pw { /* 입력간 전부 */
	width: 40%;
	float: left;
}
#addr{
	width: 70%; 
}
#idChk2{
	display: none;
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


.text-center>img { /* 사원 이미지 */
	width: 200px;
	height: 250px;
}
</style>
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
<script type="text/javascript">
	$(document).ready(function() {


		//이미지 업로드
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

		//id 중복검사
		 $("#idChk").click(function(){

				$.ajax({
					url:"/ajax/eview/join/idChk",
					type:"POST",
					data : {
						user_id : $('#user_id').val()
					},
					success:function(data){
						/* console.log(data) */
						data *= 1;
						if(data > 0){
							alert("중복된 아이디 입니다.")
							$("#idChk2").attr("checked", false);
						}else{
							$("#idChk2").attr("checked", true);
							alert("사용가능한 아이디 입니다.")
							
						}
					},
					error:function(e){
						/* alert(e.responseText) */
					}
				})	
				
		})
		
		//주소검색
		$("#addSch").click(function(){
			daum.postcode.load(function(){

	            new daum.Postcode({

	                oncomplete: function(data) {
	                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.

	                    // 예제를 참고하여 다양한 활용법을 확인해 보세요.
	                    $("#addr").val(data.address + "(" + data.zonecode + ")")

	                }

	            }).open();

	        })
		})
		

		//유효성검사
		$('#submitBtn').click(function(){

			//이름	
			if(!/^[가-힣]{2,4}$/.test($("#name").val())){
				alert("잘못된 이름 형식입니다)")
				$("#name").val('');
				return;
			}
			
			//id
			if( !/^\w{5,}$/.test( $("#user_id").val() )){
				alert("id 잘못된 형식입니다.\n영문,숫자 조합 5자이상")
				return
			}
			//비밀번호
			if( !(
					/^[0-9a-zA-Z_!@#$%^&*]{6,}$/.test( $("#user_pw").val() ) 
					&&	/[0-9]/.test( $("#user_pw").val() ) 
					&&	/[a-z]/.test( $("#user_pw").val() ) 
					&&	/[A-Z]/.test( $("#user_pw").val() )
					&&	/[_!@#$%^&*]/.test( $("#user_pw").val() )
				)	
			){
				alert("패스워드를 잘못입력하셨습니다.\n(소,대)문자,숫자,특수기호 조합 6자이상")
				$("#user_pw").val('');
				return
			}
			
			//주민번호
			if( !((/^\d{6}$/.test( $("#jumin1").val() )) && (/^\d{7}$/.test( $("#jumin2").val() )))){
				alert("잘못된 주민번호 형식입니다.")
				$("#jumin1").val('');
				$("#jumin2").val('');
				return
			}

			//전화번호
			if( !((/^\d{3}$/.test( $("#tel1").val() )) && (/^\d{4}$/.test( $("#tel2").val() )) && (/^\d{4}$/.test( $("#tel3").val() )) )){
				alert("잘못된 연락처 형식입니다.")
				$("#tel1").val('');
				$("#tel2").val('');
				$("#tel3").val('');
				return
			}

			//성별
			if(!$(".gender:checked").length){ // 1이면 true
				alert("성별을 체크해주세요")
				return
			}

			//부서, 직급
			 if($("#cate").val() == '' || $("#lev").val() == ''){
				alert("부석/직급 모두 선택해 주세요")
				return
			} 

			//급여
			if($("#pay").val() == '' || !/^\d{7,}$/.test($("#pay").val()) ){
				alert("급여를 잘못 입력하셨습니다.")
				return
			}

			 if($(".joinInput").val() == '' ){
				alert("입력 하지 않은 정보가 있습니다.")
				return
			}

			var aa = $("#idChk2").is(":checked")
			if(!aa){
				alert("중복확인해주세요.")
				return
			}
			
			frm.submit()
		})
		//이름
		/*$("#name").blur(function(){
			if(!/^[가-힣]{2,4}$/.test($("#name").val())){
				alert("잘못된 이름 형식")
				$("#name").css('border', '1px solid red');
				$("#name").val('');
				return;
			}else{
				$("#name").css('border', '1px solid #ccc');
			}
		})

		//아이디
		$("#user_id").blur(function(){
			if( !/^\w{5,}$/.test( $("#user_id").val() )){
				alert("id 잘못된 형식입니다.")
				$("#user_id").css('border', '1px solid #red');
				return
			}else{
				$("#user_id").css('border', '1px solid #ccc');
			}
		})
		//비밀번호
		$("#user_pw").blur(function(){
			if( !(
					/^[0-9a-zA-Z_!@#$%^&*]{6,}$/.test( $("#user_pw").val() ) 
					&&	/[0-9]/.test( $("#user_pw").val() ) 
					&&	/[a-z]/.test( $("#user_pw").val() ) 
					&&	/[A-Z]/.test( $("#user_pw").val() )
					&&	/[_!@#$%^&*]/.test( $("#user_pw").val() )
				)	
			){S
				alert("패스워드를 잘못입력하셨습니다.")
				$("#user_pw").css('border', '1px solid red');
				$("#user_pw").val('');
				return
			}else{
				$("#user_pw").css('border', '1px solid #ccc');
			}
		})
		//주민번호
		$("#jumin2").blur(function(){
			if( !((/^\d{6}$/.test( $("#jumin1").val() )) && (/^\d{7}$/.test( $("#jumin2").val() )))){
				alert("주민번호 잘못된 형식입니다.")
				$("#jumin1").css('border', '1px solid red');
				$("#jumin2").css('border', '1px solid red');
				$("#jumin1").val('');
				$("#jumin2").val('');
				return
			}else{
				$("#jumin1").css('border', '1px solid #ccc');
				$("#jumin2").css('border', '1px solid #ccc');
			}
		})
		//연락처
		$("#tel3").blur(function(){
			if( !((/^\d{3}$/.test( $("#tel1").val() )) && (/^\d{4}$/.test( $("#tel2").val() )) && (/^\d{4}$/.test( $("#tel3").val() )) )){
				alert("연락처 잘못된 형식입니다.")
				$("#tel1").css('border', '1px solid red');
				$("#tel2").css('border', '1px solid red');
				$("#tel3").css('border', '1px solid red');
				$("#tel1").val('');
				$("#tel2").val('');
				$("#tel3").val('');
				return
			}else{
				$("#tel1").css('border', '1px solid #ccc');
				$("#tel2").css('border', '1px solid #ccc');
				$("#tel3").css('border', '1px solid #ccc');
			}
		})
		
		$("#pay").blur(function(){
			if($("#pay").val() == '' || !/^\d$/.test($("#pay").val()) ){
				alert("급여를 잘못 입력하셨습니다.")
				$("#pay").css('border', '1px solid red');
				return
			}else{
				$("#pay").css('border', '1px solid #ccc');
			}
		})*/
	});
</script>
</head>
<body>
<form action="joinReg" method="post" enctype="multipart/form-data" name="frm">
	<div id="layout">
		<br>
		<div class="col-sm-3">
			<!--left col-->


			<div class="text-center">
				<img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png"
					class="avatar img-circle img-thumbnail" alt="avatar">
				<h6>Upload a different photo...</h6>
				<input type="file" class="text-center center-block file-upload"
					name="user_upfile">
			</div>
			</hr>
			<br>

			<ul class="list-group">
				<li class="list-group-item text-muted">Activity <i
					class="fa fa-dashboard fa-1x"></i></li>
				<li class="list-group-item text-right"><span class="pull-left"><strong>Shares</strong></span>
					125</li>
				<li class="list-group-item text-right"><span class="pull-left"><strong>Likes</strong></span>
					13</li>
				<li class="list-group-item text-right"><span class="pull-left"><strong>Posts</strong></span>
					37</li>
				<li class="list-group-item text-right"><span class="pull-left"><strong>Followers</strong></span>
					78</li>
			</ul>

		</div>
		<!--/col-3-->
		<div class="col-sm-9">
			<h2>사원정보 추가</h2>
			<div class="tab-content">
				<hr>
					<div class="form-group">
						<div class="left">
							<h4>
								<b>이름</b>
							</h4>
						</div>
						<div class="right">
							<input type="text" class="form-control joinInput" id="name" placeholder="한글 2~4자"
								name="user_name" />
						</div>
					</div>

					<div class="form-group">
						<div class="left">
							<h4>
								<b>id</b>
							</h4>
						</div>
						<div class="right">
							<input type="text" class="form-control joinInput" placeholder="영문,숫자조합 8글자이상" id="user_id"
								name="user_id" />
							<input type="checkbox" id="idChk2"/>	
							<button type="button" class="btn btn-secondary" id="idChk">중복확인</button>
						</div>
					</div>

					<div class="form-group">
						<div class="left">
							<h4>
								<b>pw</b>
							</h4>
						</div>
						<div class="right">
							<input type="password" class="form-control joinInput" placeholder="영문,숫자,특수기호 조합 8글자이상" id="user_pw"
								name="user_pw" />
						</div>
					</div>

					<div class="form-group">
						<div class="left">
							<h4>
								<b>주민번호</b>
							</h4>
						</div>
						<div class="right">
							<input type="text" class="form-control joinInput" id="jumin1"
								placeholder="주민번호 앞 6자리" name="user_rrn2" /> <b class="hypoon">-</b>
							<input type="text" class="form-control joinInput" id="jumin2"
								placeholder="주민번호 뒤 7자리" name="user_rrn2" />
						</div>
					</div>

					<div class="form-group">
						<div class="left">
							<h4>
								<b>이메일</b>
							</h4>
						</div>
						<div class="right">
							<input type="text" class="form-control joinInput" placeholder="영문,숫자조합 8자이상"
								name="user_email2" /> <b class="hypoon">@</b> <select
								class="form-control joinInput" id="email2" name="user_email2">
								<option value="">직접입력</option>
								<option>naver.com</option>
								<option>daum.net</option>
								<option>gmail.com</option>
							</select>
						</div>
					</div>


					<div class="form-group">
						<div class="left">
							<h4>
								<b>연락처</b>
							</h4>
						</div>
						<div class="right">
							<input type="text" class="form-control joinInput" id="tel1"
								placeholder="3자리" name="user_tel2" /> <b class="hypoon">-</b>
							<input type="text" class="form-control joinInput" id="tel2"
								placeholder="4자리" name="user_tel2" /> <b class="hypoon">-</b>
							<input type="text" class="form-control joinInput" id="tel3"
								placeholder="4자리" name="user_tel2" />
						</div>
					</div>

					<div class="form-group">
						<div class="left">
							<h4>
								<b>주소</b>
							</h4>
						</div>
						<div class="right">
							<input type="text" class="form-control joinInput" placeholder="주소검색하여 입력해주세요" id="addr"
								name="user_add" />
							<button type="button" class="btn btn-secondary" id="addSch">주소검색</button>
						</div>
					</div>

					<div class="form-group">
						<div class="left">
							<h4>
								<b>성별</b>
							</h4>
						</div>
						<div class="right">
							<input type="radio" name="user_gender" class="gender joinInput" value="남" />남 <input
								type="radio" name="user_gender" class="gender joinInput" value="여" />여
						</div>
					</div>

					<div class="form-group">
						<div class="left">
							<h4>
								<b>부서/직급</b>
							</h4>
						</div>
						<div class="right">
							<select class="form-control joinInput" id="cate" name="user_cate">
								<option value="">부서</option>
								<option>인사부</option>
								<option>영업부</option>
								<option>회계부</option>
								<option>품질부</option>
								<option>재고부</option>
							</select> <select class="form-control joinInput" id="lev" name="user_lev">
								<option value="">직급</option>
								<option>사원</option>
								<option>팀장</option>
								<option>과장</option>
								<option>부장</option>
							</select>
						</div>
					</div>


					<div class="form-group">
						<div class="left">
							<h4>
								<b>월급</b>
							</h4>
						</div>
						<div class="right">
							<input type="text" class="form-control joinInput" placeholder="숫자로 입력해 주세요" id="pay"
								name="user_pay" />
						</div>
					</div>

					<div class="form-group">
						<div class="col-xs-12" align="center">
							<br>
							<button type="button" id ="submitBtn"class="btn btn-primary">완료</button>
							<button type="reset" class="btn btn-primary">초기화</button>
							<button type="button" class="btn btn-primary"
								onclick="location.href='../members/list'">
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