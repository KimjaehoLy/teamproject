<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
/* .table .thead-dark th {
    height: 23px;
    padding: 12px;
} */
#wrapper {
	width: 100%;
	height: 100%;
	overflow: auto;
	transition: 0.5s;
}

table {
	width: 95%;
	margin: auto;
}

td, th {
	text-align: center;
	/* font-size: 5px; */
}

#wrapper>#search {
	background: #62C2E4;
	border-radius: 10px;
	width: 80%;
	height: 70px;
	margin: auto;
	margin-top: 10px;
	margin-bottom: 10px;
}

#searchsmall {
	/* box-sizing: border-box;
		border: 1px solid #000; */
	width: 35%;
	height: 50%;
	margin: auto;
	margin-top: 1.3%;
}

#title {
	border-radius: 10px;
	width: 10%;
	height: 100%;
	float: left;
	color: #fff;
	font-size: 30px;
	line-height: 70px;
	text-align: center;
	margin-left: 40px;
	/* border: 1px solid #000; */
}

#btnBox>button {
	float: right;
	margin: 10px;
	background: 0099FF;
}

#search>form>.selectInput {
	float: left;
	/* border: 1px solid #000; */
	width: 15%;
	height: 100%;
	margin-left: 30px;
}

#search>form>div:nth-of-type(6) { /* 검색버튼 */
	width: 10%;
	height: 100%;
	float: left;
	margin-left: 10px;
}

.selectac {
	margin-top: 15px;
}

.table .thead-dark th {
	color: #fff;
	background-color: #62C2E4;
	border-color: #62C2E4;
}

.btn-primary {
	color: #fff;
	background-color: #669AE1;
	border-color: #669AE1;
}

.small {
	width: 100%;
	height: 550px; /* history같은경우 상세가 사라짐  */
	overflow: auto;
	transition: 0.5s;
	border: 3px solid #000;
	box-sizing: border-box;
}

.detail {
	width: 100%;
	height: 39.5%;
	display: flex;
}

.detail-table {
	width: 100%;
	height: 100%;
	text-align: center;
	border: 2px solid;
	box-sizing: border-box;
}

.statIcon {
	width: 10px;
	height: 10px;
	border-radius: 10px;
	float: left;
	margin-top: 7.5px;
}
</style>
<script type="text/javascript">
	$(document).ready(function() {

		$('.statIcon').each(function() { // 클래스 이름이 .statIcon 인 객체를 for문 돌림
			var stat = $(this).parent(); // 자신의 부모 객체를 stat에 담음

			if (stat.text() == 'on') { // 부모객체가 자기고 있는 text 가 on이니?
				$(this).css('background', 'green'); //on이면 녹색
			} else { //on이 아니면
				$(this).css('background', 'red'); // on이 아니면 빨강
			}
		})

	})
</script>
</head>
<body>
	<div id="wrapper">
		<h2 align="center">근무현황</h2>
		<!-- colspan="2" 가로로 두개 먹는다 -->

		<div id="search">
			<form action="list">
				<div id="title">조회</div>
				<div class="selectInput">
					<select class="form-control selectac" id="email2" name="user_cate">
						<option value="">부서</option>
						<option>인사부</option>
						<option>영업부</option>
						<option>회계부</option>
						<option>품질부</option>
						<option>재고부</option>
					</select>
				</div>
				<div class="selectInput">
					<select class="form-control selectac" id="email2" name="user_lev">
						<option value="">직급</option>
						<option>사원</option>
						<option>팀장</option>
						<option>과장</option>
						<option>부장</option>
					</select>
				</div>
				<div class="selectInput">
					<input type="text" class="form-control selectac"
						placeholder="user name" name="user_name" />
				</div>
				<div>
					<button type="submit" class="btn btn-primary selectac">검색</button>
				</div>
			</form>
		</div>

		<ul class="nav nav-tabs">
			<li class="active"><a data-toggle="tab" href="#home">ALL</a></li>
			<li><a data-toggle="tab" href="#messages">ON USER</a></li>
			<li><a data-toggle="tab" href="#settings">OFF USER</a></li>
		</ul>

		<div class="tab-content">
			<div class="tab-pane active" id="home">
				<table class="table table-hover">
					<thead class="thead-dark">
						<tr>
							<th scope="col">상태</th>
							<th scope="col">사원번호</th>
							<th scope="col">성명</th>
							<th scope="col">부서</th>
							<th scope="col">직급</th>
							<th scope="col">e-mail</th>
							<th scope="col">연락처</th>
							<th scope="col"></th>
						</tr>
					</thead>

					<tbody class="thead-light dataBox">
						<c:forEach items="${data.onUser }" var="vo" varStatus="no">
							<tr>
								<td><div class="statIcon"></div>on</td>
								<td>${vo.user_num16 }</td>
								<td>${vo.user_name }</td>
								<td>${vo.user_cate }</td>
								<td>${vo.user_lev }</td>
								<td>${vo.user_email }</td>
								<td>${vo.user_tel }</td>
								<td>
									<button type="button" class="btn btn-primary valuData"
											onclick="location.href='../mypage/sendForm?tou=${mydata.user_id}&fromu=${vo.user_id }'">쪽지</button>
								</td>
							</tr>
						</c:forEach>
						<c:forEach items="${data.offUser }" var="vo" varStatus="no">
							<tr>
								<td><div class="statIcon"></div>off</td>
								<td>${vo.user_num16 }</td>
								<td>${vo.user_name }</td>
								<td>${vo.user_cate }</td>
								<td>${vo.user_lev }</td>
								<td>${vo.user_email }</td>
								<td>${vo.user_tel }</td>
								<td>
									<button type="button" class="btn btn-primary valuData"
											onclick="location.href='../mypage/sendForm?tou=${mydata.user_id}&fromu=${vo.user_id }'">쪽지</button>
								</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
			<div class="tab-pane" id="messages">
				<table class="table table-hover">
					<thead class="thead-dark">
						<tr>
							<th scope="col">상태</th>
							<th scope="col">사원번호</th>
							<th scope="col">성명</th>
							<th scope="col">부서</th>
							<th scope="col">직급</th>
							<th scope="col">e-mail</th>
							<th scope="col">연락처</th>
							<th scope="col"></th>
						</tr>
					</thead>

					<tbody class="thead-light dataBox">
						<c:forEach items="${data.onUser }" var="vo" varStatus="no">
							<tr>
								<td><div class="statIcon"></div>on</td>
								<td>${vo.user_num16 }</td>
								<td>${vo.user_name }</td>
								<td>${vo.user_cate }</td>
								<td>${vo.user_lev }</td>
								<td>${vo.user_email }</td>
								<td>${vo.user_tel }</td>
								<td>
									<button type="button" class="btn btn-primary valuData"
											onclick="location.href='../mypage/sendForm?tou=${mydata.user_id}&fromu=${vo.user_id }'">쪽지</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="tab-pane" id="settings">
				<table class="table table-hover">
					<thead class="thead-dark">
						<tr>
							<th scope="col">상태</th>
							<th scope="col">사원번호</th>
							<th scope="col">성명</th>
							<th scope="col">부서</th>
							<th scope="col">직급</th>
							<th scope="col">e-mail</th>
							<th scope="col">연락처</th>
							<th scope="col"></th>
						</tr>
					</thead>

					<tbody class="thead-light dataBox">
						<c:forEach items="${data.offUser }" var="vo" varStatus="no">
							<tr>
								<td><div class="statIcon"></div>off</td>
								<td>${vo.user_num16 }</td>
								<td>${vo.user_name }</td>
								<td>${vo.user_cate }</td>
								<td>${vo.user_lev }</td>
								<td>${vo.user_email }</td>
								<td>${vo.user_tel }</td>
								<td>
									<button type="button" class="btn btn-primary valuData"
											onclick="location.href='../mypage/sendForm?tou=${mydata.user_id}&fromu=${vo.user_id }'">쪽지</button>
								</td>
							</tr>
						</c:forEach>

					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>