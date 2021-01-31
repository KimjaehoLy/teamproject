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
.table .thead-dark th { /* 테이블 row */
	color: #fff;
	background-color: #62C2E4;
	border-color: #62C2E4;
	text-align: center;
}

.detailBig {
	width: 80%;
	height: 73%;
	float: left;
	margin-left: 12.5%;
}

.detail {
	border: 20px solid #62C2E4;
	border-radius: 20px;
	width: 40%;
	height: 100%;
	border: 20px solid #62C2E4;
	float: left;
	margin-left: 5%;
}

.btn-sm {
	float: left;
	margin-left: 46.75%;
}

.detail:nth-of-type(2)>.table .thead-dark td {
	text-align: right;
}

#selectBOX { /* 검색 div */
	width: 30%;
	height: 7%;
	background: #62C2E4;;
	margin: auto;
	border-radius: 10px;
	margin-bottom: 5px;
}
#selectBOX > .selectBOX-sm1{
	float:left;
	width: 10%;
	height: 100%;
	/* border: 1px solid #000; */
	color: #fff;
	margin-left: 20px;
	line-height: 50px;
}
#selectBOX > .selectBOX-sm2{
	float:left;
	width: 75%;
	height: 100%;
	/* border: 1px solid #000; */
	margin-left: 10px;
}

#selectBOX > .selectBOX-sm2 > #selectForm>input,
#selectBOX > .selectBOX-sm2 >  #selectForm>button {
	float: left;
	width: 30%;
	height:100%;
	margin: 5px;
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
	<h2>사원 세금 상세</h2>
	<c:set value="${data }" var="vo" />
	<div id="selectBOX">
		<div class="selectBOX-sm1">
			<b>조회</b>
		</div>
		<div class="selectBOX-sm2">
		<form id="selectForm" action="detail" name="attSrhFrm">

			<input type="text" class="form-control selectac" placeholder="yyyy" id="schYear" value="${dateYear }"
				name="searchDay" /> <input type="text"
				class="form-control selectac" placeholder="mm" id="schMon" name="searchDay" value="${dateMonth }" />
			<input type="hidden" name="searchDay" value="1" /> <input
				type="hidden" name="user_id" value="${vo.user_id }" />
			<button type="button" class="btn btn-primary btn-sm" id="srhFrmBtn">검색</button>
		</form>
		</div>
	</div>
	<div class="detailBig">
		<div class="detail">
			<table class="table table-hover">
				<thead class="thead-dark">
					<tr>
						<th scope="col" colspan="2">사원정보</th>
					</tr>

					<tr>
						<th scope="col">이름</th>
						<td>${vo.user_name }</td>
					</tr>
					<tr>
						<th scope="col">사원번호</th>
						<td>${vo.user_num16 }</td>
					</tr>
					<tr>
						<th scope="col">주민번호</th>
						<td>${vo.user_rrn }</td>
					</tr>
					<tr>
						<th scope="col">부서</th>
						<td>${vo.user_cate }</td>
					</tr>
					<tr>
						<th scope="col">직급</th>
						<td>${vo.user_lev }</td>
					</tr>

					<tr>
						<th scope="col">주소</th>
						<td>${vo.user_add }</td>
					</tr>

					<tr>
						<th scope="col">성별</th>
						<td>${vo.user_gender }</td>
					</tr>

					<tr>
						<th scope="col">연락처</th>
						<td>${vo.user_tel }</td>
					</tr>

					<tr>
						<th scope="col">E-Mail</th>
						<td>${vo.user_email }</td>
					</tr>

				</thead>
			</table>
		</div>

		<div class="detail">
			<table class="table table-hover">
				<thead class="thead-dark">

					<tr>
						<th scope="col" colspan="3">세금영수증</th>
					</tr>

					<tr>
						<th scope="col">급여</th>
						<td colspan="2"><fmt:formatNumber
								value="${vo.user_pay }" pattern="0,000원" /></td>
					</tr>

					<tr>
						<th scope="col">분류</th>
						<th scope="col">백분률</th>
						<th scope="col">금액</th>
					</tr>

					<tr>
						<th scope="col">국민연금</th>
						<td>4.50%</td>
						<td><fmt:formatNumber value="${vo.user_premium1 }"
								pattern="0,000원" /></td>
					</tr>

					<tr>
						<th scope="col">건강보험</th>
						<td>3.23%</td>
						<td><fmt:formatNumber value="${vo.user_premium2 }"
								pattern="0,000원" /></td>
					</tr>

					<tr>
						<th scope="col">장기요양</th>
						<td>8.51%</td>
						<td><fmt:formatNumber value="${vo.user_premium3 }"
								pattern="0,000원" /></td>
					</tr>

					<tr>
						<th scope="col">고용보험</th>
						<td>0.80%</td>
						<td><fmt:formatNumber value="${vo.user_premium4 }"
								pattern="0,000원" /></td>
					</tr>

					<tr>
						<th scope="col">소득세</th>
						<td>0.0086%</td>
						<td><fmt:formatNumber value="${vo.user_premium5 }"
								pattern="0,000원" /></td>
					</tr>

					<tr>
						<th scope="col">지방소득세</th>
						<td>소득세 10%</td>
						<td><fmt:formatNumber value="${vo.user_premium6 }"
								pattern="0,000원" /></td>
					</tr>

					<tr>
						<th scope="col">tot</th>
						<td>${vo.user_totPremium2 }%</td>
						<td><fmt:formatNumber value="${vo.user_totPremium }"
								pattern="0,000원" /></td>
					</tr>


				</thead>
			</table>
		</div>
	</div>
	<button type="button" class="btn btn-primary btn-sm"
		onclick="location.href='../tax/list?${dateParam}'">세금관리 목록</button>
</body>
</html>
