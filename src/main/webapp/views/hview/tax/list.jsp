<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

.subTitle {
	width: 10%;
	height: 100%;
	float: left;
	color: #fff;
	font-size: 20px;
	line-height: 70px;
	text-align: center;
}

#search>.searchsmall>.selectInput {
	float: left;
	/* border: 1px solid #000; */
	width: 10%;
	height: 40%;
	margin-right: 20px;
}

.selectBtn {
	height: 100%;
	width: 50px;
	float: left;
	margin-top: 17.5px;
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
</style>
<script type="text/javascript">
$(document).ready(function(){

$("#srhFrmBtn").click(function(){
	
	if( !/^\d{4}$/.test($("#schYear").val())){
		alert("년도를 숫자4자리로 입력해 주세요")
		$("#schYear").val('')
		return
	}

	if( !($("#schYear").val() > 2019 && $("#schYear").val() <= 2020) ){
		alert("2020년가지 검색 가능합니다.")
		$("#schYear").val('')
		return
	}

	if( !/^\d{2}$/.test($("#schMon").val())){
		alert("월을 숫자2자리로 입력해 주세요")
		$("#schMon").val('')
		return
	}

	if( !($("#schMon").val() > 0 && $("#schMon").val() <= 12) ){
		console.log($("#schMon").val())
		alert("월 잘못 입력하셨습니다.")
		$("#schMon").val('')
		return
	}
	
	attSrhFrm.submit()
})
})
</script>
</head>
<body>
	<div id="wrapper">
		<h2 align="center">세금관리 목록</h2>
		<!-- colspan="2" 가로로 두개 먹는다 -->

		<div id="search">
			<form action="list" class="searchsmall" name="attSrhFrm">
				<div id="title">조회</div>
				<div class="subTitle">사원</div>
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
				<div class="subTitle">날짜</div>
				<div class="selectInput">
					<input type="text" class="form-control selectac" id="schYear"
						placeholder="yyyy" name="searchDay"/>
				</div>
				<div class="selectInput">
					<input type="text" class="form-control selectac" id="schMon"
						placeholder="mm" name="searchDay" />
				</div>
				<input type="hidden" name="searchDay" value="1"/>

				<div class="selectBtn">
					<button type="button" class="btn btn-primary btn-sm" id="srhFrmBtn">
						검색</button>
				</div>

			</form>
		</div>

		<table class="table table-hover">
			<thead class="thead-dark">
				<tr>
					<th scope="col" colspan="11">${dateYear }년${dateMonth }월</th>
				</tr>
				<tr>
					<th scope="col">사원번호</th>
					<th scope="col">성명</th>
					<th scope="col">부서</th>
					<th scope="col">직급</th>
					<th scope="col">국민연금</th>
					<th scope="col">건강보험</th>
					<th scope="col">장기요양</th>
					<th scope="col">고용보험</th>
					<th scope="col">고득세</th>
					<th scope="col">지방소득세</th>
					<th scope="col"></th>
				</tr>
			</thead>

			<tbody class="thead-light dataBox">
				<c:forEach items="${data }" var="vo">
					<tr>
						<td>${vo.user_num16 }</td>
						<td>${vo.user_name }</td>
						<td>${vo.user_cate }</td>
						<td>${vo.user_lev }</td>
						<td><fmt:formatNumber value="${vo.user_premium1 }"
								pattern="0,000원" /></td>
						<td><fmt:formatNumber value="${vo.user_premium2 }"
								pattern="0,000원" /></td>
						<td><fmt:formatNumber value="${vo.user_premium3 }"
								pattern="0,000원" /></td>
						<td><fmt:formatNumber value="${vo.user_premium4 }"
								pattern="0,000원" /></td>
						<td><fmt:formatNumber value="${vo.user_premium5 }"
								pattern="0,000원" /></td>
						<td><fmt:formatNumber value="${vo.user_premium6 }"
								pattern="0,000원" /></td>
						<td>
							<button type="button" class="btn btn-primary btn-sm"
								onclick="location.href='../tax/detail?user_id=${vo.user_id}&user_num=${vo.user_num}&${dateParam }'">상세</button>
						</td>

					</tr>
				</c:forEach>
				<tr>
					<td colspan="9" align="center">
						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<c:if test="${startPage>1 }">
									<li class="page-item"><a class="page-link"
										href="?nowPage=${startPage-1 }&user_cate=${param.user_cate }&user_lev=${param.user_lev }
													&user_name=${param.user_name }&searchDay=${param.searchDay }
													&searchDay=${atMonth }&searchDay=${atDay }"
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
													&user_name=${param.user_name }&searchDay=${param.searchDay }
													&searchDay=${atMonth }&searchDay=${atDay }">${i }</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${endPage<lastPage }">
									<li class="page-item"><a class="page-link"
										href="?nowPage=${endPage+1 }&user_cate=${param.user_cate }&user_lev=${param.user_lev }
													&user_name=${param.user_name }&searchDay=${param.searchDay }
													&searchDay=${atMonth }&searchDay=${atDay }"
										aria-label="Next"> <span aria-hidden="true">&raquo;</span>
									</a></li>
								</c:if>
							</ul>
						</nav>

					</td>
				</tr>

			</tbody>
		</table>
	</div>
</body>
</html>