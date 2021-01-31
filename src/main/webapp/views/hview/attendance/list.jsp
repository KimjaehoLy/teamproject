<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#search>* {
	/* border: 1px solid #000; */
	
}

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
<script type="text/javascript">
	$(document).ready(function() {


		$(".valueData").click(function() {
			
			var btn = $(this);
			var tr = btn.parent().parent();
			var td = tr.children();
			
			var str = td.eq(1).text();

			$('#test').val(str);


			
			$('#wrapper').css({
				height : "75%"
			})
		})
		
		$("#exitBtn").click(function(){
			$('#wrapper').css({
				height : "100%"
			})
		})

		

		//조회 유효성검사
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
		
		
		//출근기록 수정 form
		$("#modifyFrmBtn").click(function(){

			//년도
			if( !/^\d{4}$/.test($("#mdyYear").val())){
				alert("년도를 숫자4자리로 입력해 주세요")
				$("#mdyYear").val('')
				return
			}
			if( !($("#mdyYear").val() > 2019 && $("#mdyYear").val() <= 2020) ){
				alert("2020년가지 수정 가능합니다.")
				$("#mdyYear").val('')
				return
			}

			//월
			if( !/^\d{2}$/.test($("#mdyMon").val())){
				alert("월을 숫자2자리로 입력해 주세요(ex:02 or 11)")
				$("#mdyMon").val('')
				return
			}
			if( !($("#mdyMon").val() > 0 && $("#mdyMon").val() <= 12) ){
				console.log($("#schMon").val())
				alert("월 잘못 입력하셨습니다.(ex:00~12) ")
				$("#mdyMon").val('')
				return
			}

			//일
			if( !/^\d{2}$/.test($("#mdyDay").val())){
				alert("일을 숫자2자리로 입력해 주세요(ex:02 or 28)")
				$("#mdyDay").val('')
				return
			}

			//출근시간
			if( !/^\d{2}$/.test($("#mdyStartT").val())){
				alert("출근시간을 숫자2자리로 입력해 주세요(ex:09)")
				$("#mdyStartT").val('')
				return
			}
			if( !($("#mdyStartT").val() > 0 && $("#mdyStartT").val() <= 24) ){
				console.log($("#mdyStartT").val())
				alert("출근시간을 잘못 입력하셨습니다.(ex:09) ")
				$("#mdyStartT").val('')
				return
			}

			//퇴근시간
			if( !/^\d{2}$/.test($("#mdyEndT").val())){
				alert("퇴근시간을 숫자2자리로 입력해 주세요(ex:21)")
				$("#mdyEndT").val('')
				return
			}
			if( !($("#mdyEndT").val() > 0 && $("#mdyEndT").val() <= 24) ){
				console.log($("#mdyEndT").val())
				alert("퇴근시간을 잘못 입력하셨습니다.(ex:21) ")
				$("#mdyEndT").val('')
				return
			}
			
				
			
			attModifyFrm.submit()
		})
		
	})
</script>
</head>
<body>
	<div id="wrapper">
		<h2 align="center">근태관리 목록</h2>
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
						placeholder="user name" name="user_name" id="name" />
				</div>
				<div class="subTitle">날짜</div>
				<div class="selectInput">
					<input type="text" class="form-control selectac" class="searchDay"
						id="schYear" placeholder="yyyy" name="searchDay" size="4" />
				</div>
				<div class="selectInput">
					<input type="text" class="form-control selectac" class="searchDay"
						id="schMon" placeholder="mm" name="searchDay" size="10" />
				</div>
				<input type="hidden" name="searchDay" value="1" class="searchDay" />

				<div class="selectBtn">
					<button type="button" class="btn btn-primary btn-sm" id="srhFrmBtn">
						검색</button>
				</div>

			</form>
		</div>

		<table class="table table-hover">
			<thead class="thead-dark">
				<tr>
					<th scope="col" colspan="8">${dateYear }년${dateMonth }월</th>
				</tr>
				<tr>
					<th scope="col" rowspan="2">사원번호</th>
					<th scope="col" rowspan="2">id</th>
					<th scope="col" rowspan="2">성명</th>
					<th scope="col" rowspan="2">부서</th>
					<th scope="col" rowspan="2">직급</th>
					<th scope="col" rowspan="2">근태일</th>
					<th scope="col" rowspan="2">근태률</th>
					<th scope="col" rowspan="2">상세</th>
				</tr>
			</thead>
			<tbody class="thead-light">
				<c:forEach items="${data }" var="vo">
					<tr>
						<td>${vo.user_num16 }</td>
						<td>${vo.user_id }</td>
						<td>${vo.user_name }</td>
						<td>${vo.user_cate }</td>
						<td>${vo.user_lev }</td>
						<td>${vo.user_percent1 }</td>
						<td>${vo.user_percent2 }%</td>
						<td><button type="button" class="btn btn-primary"
								onclick="location.href='../attendance/detail?user_id=${vo.user_id}&user_num=${vo.user_num}&${dateParam }'">
								상세</button>
							<button type="button" class="btn btn-primary valueData"">
								수정</button></td>
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
	<div id="detail">
		<form action="modifyReg" name="attModifyFrm">

			<table class="table table-hover" id="sub">
				<thead class="thead-dark">
					<tr>
						<th scope="col" colspan="5">수정</th>
					</tr>
					<tr>
						<th scope="col">년도</th>
						<th scope="col">월</th>
						<th scope="col">일</th>
						<th scope="col">출근시간</th>
						<th scope="col">퇴근시간</th>
					</tr>

					<tr>
						<td><input type="text" class="form-control" name="searchDay" placeholder="YYYY"
							id="mdyYear" /></td>
						<td><input type="text" class="form-control" name="searchDay" placeholder="MM"
							id="mdyMon" /></td>
						<td><input type="text" class="form-control" name="searchDay" placeholder="DD"
							id="mdyDay" /></td>
						<td><input type="text" class="form-control" name="searchDay" placeholder="HH"
							id="mdyStartT" /></td>
						<td><input type="text" class="form-control" name="searchDay" placeholder="HH" id="mdyEndT" />
							<input type="hidden" class="form-control" id="test"
							name="user_id"/></td>
					</tr>
					<tr>
						<td colspan="5">
							<button type="button" class="btn btn-primary btn-sm"
								id="modifyFrmBtn">수정</button>
								
							<button type="button" class="btn btn-primary btn-sm"
								id="exitBtn">내리기</button>
						</td>

					</tr>
				</thead>

			</table>
		</form>
	</div>
</body>
</html>