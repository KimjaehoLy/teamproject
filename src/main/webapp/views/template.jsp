<%@page import="erp.hhh.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%session.setAttribute("ddd", "aaa"); %><!-- 유저 세션 임의 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Content</title>
<link rel="stylesheet"
	href="<c:url value="/resources/webjars/bootstrap/4.5.3/css/bootstrap.css"/>" />
<link rel="stylesheet"
	href="<c:url value="/resources/webjars/bootstrap/4.5.3/css/bootstrap.min.css"/>" />
<script type="text/javascript"
	src="<c:url value="/resources/webjars/jquery/3.5.1/jquery.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/webjars/jquery-ui/1.12.1/jquery-ui.min.js"/>"></script>
<script type="text/javascript"
	src="<c:url value="/resources/webjars/bootstrap/4.5.3/js/bootstrap.min.js"/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/calender.js"/>"></script>
<link rel="stylesheet" href="/resources/css/${kind.cate }.css">
<link rel="stylesheet" href="/resources/css/calender.css">
<script type="text/javascript">
	$(document).ready(function() {

		$(function() {
			$('#statBtn').val('${stat}');

			$('#statBtn').css('background', 'rgb(128, 128, 192, 0.4)');

			$('#statBtn').click(function() {
				var msg = '${stat}' + " 하시겠습니까?";
				var chk = confirm(msg);
				console.log(chk);

				if (chk == true) {
					var goUrl = "/ajax/eview/join/statusChk" // URL
					$.ajax({
						url : goUrl, // 여기로 가줘
						// get방식으로 파라미터로 넘어감
						data : {
							chk : $(this).attr("value")
						// ?menu=버튼의 아이디(파라미터는 버튼의 아이디)
						},
						success : function(data) {
							alert(data + ' 처리되었습니다.')
							if (data == '출근')
								$('#statBtn').val('퇴근');
							location.href = ""
						},
						error : function(e) {
							alert(e.responseText)
						}
					})

				}

			});
		});

	})
</script>
</head>
<body>
	<header>
		<div id="logo">
			<a href="/fioerp"><img
				src="/resources/images/dd.png" /> </a>
		</div>
		<nav id="temnav">
			<ol>
				<li><input type='button' value='출근' id='statBtn' /></li>
				<li><a href="../mypage/mypage?user_id=<%=(((UserVO)session.getAttribute("mydata")).getUser_id()) %>">마이페이지</a></li>
				<li><a href="/logout">로그아웃</a></li>
			</ol>
			<div>
				<button class="calbut">
					<svg width="1.5em" height="1.5em" viewBox="0 0 16 16"
						class="bi bi-calendar-check" fill="currentColor"
						xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd"
							d="M3.5 0a.5.5 0 0 1 .5.5V1h8V.5a.5.5 0 0 1 1 0V1h1a2 2 0 0 1 2 2v11a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V3a2 2 0 0 1 2-2h1V.5a.5.5 0 0 1 .5-.5zM1 4v10a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1V4H1z" />
  <path fill-rule="evenodd"
							d="M10.854 7.146a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708 0l-1.5-1.5a.5.5 0 1 1 .708-.708L7.5 9.793l2.646-2.647a.5.5 0 0 1 .708 0z" />
</svg></a>
				</button>
			</div>
		</nav>
	</header>
	<aside><jsp:include page="${kind.asideUrl }"></jsp:include></aside>
	<section>
		<article id="artimain"><jsp:include page="${kind.mainUrl }" /></article>
		<article id="artical" class="caloff"><jsp:include page="fultest.jsp" /></article>
	</section>
</body>
</html>