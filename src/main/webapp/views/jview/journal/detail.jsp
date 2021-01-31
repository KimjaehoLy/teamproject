<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:set var="vo" value="${data }"/>
<table border="">
	<tr>
		<td>번호</td><td>${vo.jou_no}</td>
	</tr>
	<tr>
		<td>제목</td><td>${vo.creprice}</td>
	</tr>
	<tr>
		<td>작성자</td><td>${vo.deprice}</td>
	</tr>
	<tr>
		<td>작성일</td><td>${vo.deprice}</td>
	</tr>
	<tr>
		<td>조회수</td><td>${vo.account}</td>
	</tr>
	<tr>
		<td>파일</td><td>${vo.sucode}</td>
	</tr>
	<tr>
		<td>내용</td><td>${vo.cresubj}</td>
	</tr>
	<tr>

	</tr>

</table>

</body>
</html>