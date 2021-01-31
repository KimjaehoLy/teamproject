<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
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
</style>
</head>
<body>
	<div id="wrapper">

		<h2 align="center">인사관리 목록</h2>
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

		<div id="btnBox">
			<button type="button" class="btn btn-primary"
				onclick="location.href='../members/join'">사원정보 추가</button>
		</div>

		<table class="table table-hover">
			<thead id="dataBox">
			<thead class="thead-dark">
				<tr>
					<th scope="col">사원번호</th>
					<th scope="col">성명</th>
					<th scope="col">부서</th>
					<th scope="col">직급</th>
					<th scope="col">연락처</th>
					<th scope="col">e-mail</th>
					<th scope="col"></th>
				</tr>
			<tbody class="thead-light dataBox">
				<c:forEach items="${data }" var="vo">
					<tr>
						<td>${vo.user_num16 }</td>
						<td>${vo.user_name }</td>
						<td>${vo.user_cate }</td>
						<td>${vo.user_lev }</td>
						<td>${vo.user_tel }</td>
						<td>${vo.user_email }</td>
						<td>
							<button type="button" class="btn btn-primary"
								onclick="location.href='../members/detail?user_id=${vo.user_id}'">
								상세</button>
						</td>
					</tr>
				</c:forEach>
			</tbody>

			<tr>
				<td colspan="8" align="center">
					<nav aria-label="Page navigation example">
						<ul class="pagination">
							<c:if test="${startPage>1 }">
								<li class="page-item"><a class="page-link"
									href="?nowPage=${startPage-1 }&user_cate=${param.user_cate }&user_lev=${param.user_lev }
													&user_name=${param.user_name }"
									aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								</a></li>
							</c:if>
							<c:forEach begin="${startPage }" end="${endPage }" step="1"
								var="i">
								<c:choose>
									<c:when test="${nowPage==i }">
										<li class="page-item active"><a class="page-link ">${i }</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link"
											href="?nowPage=${i }&user_cate=${param.user_cate }&user_lev=${param.user_lev }
													&user_name=${param.user_name }">${i }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${endPage<lastPage }">
								<li class="page-item"><a class="page-link"
									href="?nowPage=${endPage+1 }&user_cate=${param.user_cate }&user_lev=${param.user_lev }
													&user_name=${param.user_name }"
									aria-label="Next"> <span aria-hidden="true">&raquo;</span>
								</a></li>
							</c:if>
						</ul>
					</nav>

				</td>
			</tr>

		</table>
	</div>
</body>
</html>