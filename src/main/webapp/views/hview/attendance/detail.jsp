<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
/* #detail > *{
	border: 4px solid #f0f;
} */
#detail { /* 전체 div */
	width: 80%;
	height: 90%;
	border: 20px solid #62C2E4;
	margin: auto;
	border-radius: 20px;
}
.table .thead-dark th { /* 테이블 row */
    color: #fff;
    background-color: #62C2E4;
    border-color: #62C2E4;
}

#detail>div:nth-of-type(1) { /* 사원정보 div */
	float: left; width : 100%;
	height: 20%;
	width: 100%;
}

#detail>div:nth-of-type(2) {/* 출퇴근 기록부 div */
	float: left;
	width: 100%;
	height: 70%;
	overflow: auto;
}

#detail>div:nth-of-type(3) { /* 출퇴근 리스트로가는 버튼 div */
	float: left;
	width: 100%;
	height: 10%;
	background: #62C2E4;
}
.btn-sm{ /* 출퇴근 리스트로 가는 버튼 */
	background: #669AE1;
	height: 100%;
	font-size: 18px;
	float: right;
}
#selectForm > input,
#selectForm > button{
	float:left;
	width: 15%;
	margin: 5px;
}
#selectForm{

}


</style>

<script type="text/javascript">
$(document).ready(function(){

	var aa = function(){

		return 'd'
	}
	

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
	<h2>출퇴근 상세</h2>
	<div id="detail">
		<c:set value="${data }" var="vo" />
		<div>
			<table class="table table-hover">
				<thead class="thead-dark">
					<tr>
						<th scope="col" rowspan="2">사원번호</th>
						<th scope="col" rowspan="2">성명</th>
						<th scope="col" rowspan="2">부서</th>
						<th scope="col" rowspan="2">직급</th>
						<th scope="col" rowspan="2">근태일</th>
						<th scope="col" rowspan="2">근태률</th>
						<th scope="col" rowspan="2">입사일</th>
					</tr>
				</thead>
				<tbody class="thead-light">
					<tr>
						<td>${vo.user_num16 }</td>
						<td>${vo.user_name }</td>
						<td>${vo.user_cate }</td>
						<td>${vo.user_lev }</td>
						<td>${vo.user_percent1 }</td>
						<td>${vo.user_percent2 }%</td>
						<td>${vo.user_date }</td>
					</tr>

				</tbody>
			</table>
		</div>


		<div>
			<table class="table table-hover" id="sub">
				<thead class="thead-dark">
					<tr>
						<th scope="col">근무시간</th>
						<th scope="col">
							<form id="selectForm" action="detail" name="attSrhFrm">
							
								<input type="text" class="form-control selectac" id="schYear" value="${dateYear }"
										placeholder="yyyy" name="searchDay" />
								<input type="text" class="form-control selectac" id="schMon" value="${dateMonth }"
										placeholder="mm" name="searchDay" />
								<input type="hidden" name="searchDay" value="1" />
								<input type="hidden" name="user_id" value="${vo.user_id }" />
								<button type="button" class="btn btn-primary btn-sm" id="srhFrmBtn">검색</button>
							
							</form>
						</th>
					</tr>
					<c:forEach items="${vo.attendace }" var="att" varStatus="no">
						<tr>
							<th scope="col">${att.today }</th>
							<td>${att.printDate }</td>
						</tr>
					</c:forEach>
			</table>
		</div>
		<div>
			<button type="button" class="btn btn-primary btn-sm"
				onclick="location.href='../attendance/list?${dateParam}'">출퇴근 관리목록</button>
		</div>
	</div>
</body>
</html>