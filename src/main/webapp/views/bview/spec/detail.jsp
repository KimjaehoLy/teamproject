<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h2>
	<b>거래명세서</b>
</h2>
<hr />
<div id="layouts">
	<table class="table table-bordered border-primary">
		<tbody>
			<tr>
				<th>거래처</th>
				<td colspan="3">${data.customer }</td>
				<th colspan="2">명세번호</th>
				<td colspan="2">${data.sp_num }</td>
			</tr>
			<tr>
				<th>합계</th>
				<td colspan="3">${data.bal }</td>
				<th colspan="2">마감번호</th>
				<td colspan="2">${data.o4 }</td>
			</tr>
			<tr>
				<th>날짜</th>
				<td colspan="3">${data.regdate }</td>
				<th colspan="2">마감상태</th>
				<td colspan="2">${data.end_kind }</td>
			</tr>
			<tr>
				<th>과세구분</th>
				<td>${data.tex }</td>
				<th>담장자</th>
				<td>${data.leader }</td>
				<th>수금번호</th>
				<td>${data.bill_num }</td>
				<th>계산서번호</th>
				<td>${data.evi }</td>
			</tr>
			<tr>
				<th>no</th>
				<th>품목</th>
				<th>수량</th>
				<th colspan="2">단가</th>
				<th colspan="3">비고</th>
			</tr>
			<tr>
				<td>0</td>
				<td>${data.kind }</td>
				<td>${data.cnt }</td>
				<td colspan="2">3000</td>
				<td colspan="3">-</td>
			</tr>
			<c:forEach begin="1" end="2" varStatus="i">
				<tr>
					<td>${i.index }</td>
					<td></td>
					<td></td>
					<td colspan="2"></td>
					<td colspan="3"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<div class="specDD">
<input type="button" class="btn btn-primary" value="출력" /><input type="button" class="btn btn-primary" onclick="location.href='list'" value="목록으로"/>
</div>