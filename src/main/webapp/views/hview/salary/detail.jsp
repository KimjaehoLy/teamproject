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
#detail {
	width: 80%;
	height: 85%;
	border: 20px solid #62C2E4;
	margin: auto;
	border-radius: 20px;
}

.table .thead-dark th { /* 테이블 row */
	color: #fff;
	background-color: #62C2E4;
	border-color: #62C2E4;
	text-align: center;
}

#detail>div:nth-of-type(1) {
	float: left;
	width: 100%;
	height: 35%;
	width: 100%;
}

.dataBox>tr>td {
	text-align: center;
}

#detail>div:nth-of-type(2), #detail>div:nth-of-type(3) {
	float: left;
	width: 50%;
	height: 50%;
}

.dataBOX {
	text-align: right;
}

#detail>div:nth-of-type(4) { /* 출퇴근 리스트로가는 버튼 div */
	float: left;
	width: 100%;
	height: 15%;
	background: #62C2E4;
}

.btn-sm { /* 출퇴근 리스트로 가는 버튼 */
	background: #669AE1;
	height: 100%;
	font-size: 18px;
	float: right;
}

#selectForm>input, #selectForm>button {
	float: left;
	width: 15%;
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
	<h2>급여 상세</h2>
	<div id="detail">
		<c:set value="${data }" var="vo" />

		<div>
			<table class="table table-hover">
				<!-- 컬럼 -->
				<thead class="thead-dark">

					<tr>
						<th scope="col" colspan="8">
							<form id="selectForm" action="detail" name="attSrhFrm">

								<input type="text" class="form-control selectac" id="schYear" value="${dateYear }"
									placeholder="yyyy" name="searchDay" /> <input type="text" value="${dateMonth }"
									class="form-control selectac" id="schMon" placeholder="mm" name="searchDay" />
								<input type="hidden" name="searchDay" value="1" /> <input
									type="hidden" name="user_id" value="${vo.user_id }" />
								<button type="button" class="btn btn-primary btn-sm" id="srhFrmBtn">검색</button>

							</form>
						</th>
					</tr>
					<tr>
						<th scope="col">성명</th>
						<th scope="col">사원번호</th>
						<th scope="col">직급</th>
						<th scope="col">기본급여</th>
						<th scope="col">추가수당총액</th>
						<th scope="col">지급총액</th>
						<th scope="col">공제총액</th>
						<th scope="col">차감지급액</th>
					</tr>
				</thead>


				<!-- 회원 급여 데이터 -->
				<tbody class="thead-light dataBox">
					<tr>
						<td>${vo.user_name }</td>
						<!-- 이름 -->
						<td>${vo.user_num16 }</td>
						<td>${vo.user_cate }</td>

						<td>
							<!-- 기본급여 --> <fmt:formatNumber value="${vo.user_pay }"
								pattern="0,000원" />
						</td>

						<td>
							<!-- 추가수당총액 --> <fmt:formatNumber value="${vo.user_totPlusPay }"
								pattern="0,000원" />
						</td>


						<td>
							<!-- 지급총액 --> <fmt:formatNumber value="${vo.user_totPay }"
								pattern="0,000원" />
						</td>


						<td>
							<!-- 공제총액 --> <fmt:formatNumber value="${vo.user_totPremium }"
								pattern="0,000원" />
						</td>


						<td>
							<!-- 차감지금액 --> <fmt:formatNumber value="${vo.user_allTotPay}"
								pattern="0,000원" />
						</td>

					</tr>
				</tbody>
			</table>

		</div>


		<div>
			<table class="table table-hover">
				<thead class="thead-dark">

					<tr>
						<th scope="col">공제항목</th>
						<th scope="col">부담률</th>
						<th scope="col">금액</th>
					</tr>
					<tr>
						<th scope="col">국민연금</th>
						<td class="dataBOX">4.50%</td>
						<td class="dataBOX"><fmt:formatNumber
								value="${vo.user_premium1 }" pattern="0,000원" /></td>
					</tr>
					<tr>
						<th scope="col">건강보험</th>
						<td class="dataBOX">3.23%</td>
						<td class="dataBOX"><fmt:formatNumber
								value="${vo.user_premium2 }" pattern="0,000원" /></td>
					</tr>
					<tr>
						<th scope="col">장기요양</th>
						<td class="dataBOX">8.51%</td>
						<td class="dataBOX"><fmt:formatNumber
								value="${vo.user_premium3 }" pattern="0,000원" /></td>
					</tr>
					<tr>
						<th scope="col">고용보험</th>
						<td class="dataBOX">0.80%</td>
						<td class="dataBOX"><fmt:formatNumber
								value="${vo.user_premium4 }" pattern="0,000원" /></td>
					</tr>

					<tr>
						<th scope="col">공재총액</th>
						<td class="dataBOX">${vo.user_totPremium2 }%</td>
						<td class="dataBOX"><fmt:formatNumber
								value="${vo.user_totPremium }" pattern="0,000원" /></td>
					</tr>
				</thead>
			</table>
		</div>
		<div>
			<table class="table table-hover">
				<thead class="thead-dark">
					<tr>
						<th scope="col">급여항목세부내역</th>
						<th scope="col">시간</th>
						<th scope="col">금액</th>
					</tr>
					<tr>
						<th scope="col">연장수당</th>
						<td class="dataBOX">${vo.user_plusTime1 }h</td>
						<td class="dataBOX"><fmt:formatNumber
								value="${vo.user_plusPay1 }" pattern="0,000원" /></td>
					</tr>
					<tr>
						<th scope="col">휴일근무수당</th>
						<td class="dataBOX">${vo.user_plusTime2 }h</td>
						<td class="dataBOX"><fmt:formatNumber
								value="${vo.user_plusPay2 }" pattern="0,000원" /></td>
					</tr>
					<tr>
						<th scope="col">포괄보장수당</th>
						<td class="dataBOX">-</td>
						<td class="dataBOX"><fmt:formatNumber
								value="${vo.user_plusPay3 }" pattern="0,000원" /></td>
					</tr>
					<tr>
						<th scope="col">수당총액</th>
						<td class="dataBOX">${vo.user_totPlusTime }h</td>
						<td class="dataBOX"><fmt:formatNumber
								value="${vo.user_totPlusPay }" pattern="0,000원" /></td>
					</tr>
					<tr>
						<th scope="col">차감지급액</th>
						<td colspan="2" class="dataBOX"><fmt:formatNumber
								value="${vo.user_allTotPay}" pattern="0,000원" /></td>
					</tr>
				</thead>
			</table>
		</div>

		<div>
			<button type="button" class="btn btn-primary btn-sm"
				onclick="location.href='../salary/list?${dateParam }'">급여 관리목록</button>
		</div>
	</div>
</body>
</html>