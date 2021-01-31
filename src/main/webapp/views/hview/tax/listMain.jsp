
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
td, th {
	text-align: center;
}

#search {
	background: #62C2E4;
	border-radius: 10px;
	width: 80%;
	height: 10%;
	margin: auto;
	margin-top: 10px;
	margin-bottom: 10px;
}

#searchsmall {
	/* box-sizing: border-box;
		border: 1px solid #000; */
	width: 40%;
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
	margin-left: 40px;
}

#search>div:nth-of-type(2), /*부서 입력칸*/ #search>div:nth-of-type(3),
	/*직책 입력칸*/ #search>div:nth-of-type(4), /*사원번호 입력칸*/ #search>div:nth-of-type(5)
	{ /*이름 입력칸*/
	float: left;
	/* border: 1px solid #000; */
	width: 15%;
	height: 100%;
	margin-left: 30px;
}

#search>div:nth-of-type(6) { /* 검색버튼 */
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
</style>
</head>
<body>
	<h2 align="center">근무 현황</h2>
	<!-- colspan="2" 가로로 두개 먹는다 -->

	<div id="search">
		<div id="title">조회</div>
		<div>
			<select class="form-control selectac" id="email2" name="cate">
				<option value="">부서</option>
				<option>인사부</option>
				<option>영업부</option>
				<option>회계부</option>
				<option>품질부</option>
				<option>재고부</option>
			</select>
		</div>
		<div>
			<select class="form-control selectac" id="email2" name="lev">
				<option value="">직급</option>
				<option>사원</option>
				<option>팀장</option>
				<option>과장</option>
				<option>부장</option>
			</select>
		</div>
		<div>
			<input type="text" class="form-control selectac"
				placeholder="user num" name="num" />
		</div>
		<div>
			<input type="text" class="form-control selectac"
				placeholder="user name" name="name" />
		</div>
		<div>
			<button type="button" class="btn btn-primary selectac"
				onclick="location.href='#'">검색</button>
		</div>
	</div>

	<table class="table table-hover">
		<thead id="dataBox">
		<thead class="thead-dark">
			<tr>
				<th scope="col">상태</th>
				<th scope="col">사원번호</th>
				<th scope="col">성명</th>
				<th scope="col">부서</th>
				<th scope="col">직급</th>
				<th scope="col">e-mail</th>
				<th scope="col">연락처</th>
			</tr>
		</thead>

		<tbody class="thead-light dataBox">

			<tr>
				<td>출근함</td>
				<td>AAA</td>
				<td>백현수</td>
				<td>인사부</td>
				<td>사원</td>
				<td>gustnekt1@gamil.com</td>
				<td>010-6484-4738</td>
			</tr>

		</tbody>
	</table>

</body>
</html>