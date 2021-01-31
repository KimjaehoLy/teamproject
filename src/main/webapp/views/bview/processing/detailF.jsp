<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>detail</title>
</head>
<body>
	<h2>영업관리</h2>
	<hr />
	<b>상세페이지</b>
	<table class="table table-bordered">
		<tr>
			<td>의뢰번호</td>
			<td>${data.o2}</td>
		</tr>
		<tr>
			<td>제품코드번호</td>
			<td>${data.code}</td>
		</tr>
		<tr>
			<td>의뢰일자</td>
			<td>${data.rd}</td>
		</tr>
		<tr>
			<td>출고예정일</td>
			<td></td>
		</tr>

		<tr>
			<td>거래처</td>
			<td>${data.customer}</td>
		</tr>
		<tr>
			<td>원두종류</td>
			<td>${data.kind}</td>
		</tr>
		<tr>
			<td>수량</td>
			<td>${data.cnt}</td>
		</tr>
		<tr>
			<td>단가</td>
			<td>${data.cost }</td>
		</tr>
		<tr>
			<td>상태</td>
			<td>예외</td>
		</tr>
		<tr>
			<td>비고</td>
			<td>${data.content }</td>
		</tr>
		<tr>
			<td colspan="2" align="right"><a href="listF">리스트로</a></td>
		</tr>
	</table>

</body>
</html>