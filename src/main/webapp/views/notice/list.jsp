<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h1>notice/list 입니다</h1>
${mainData }
<table border="">
<c:forEach begin="1" end="10" var="i">
	<tr>
		<td><a href="detail?id=${i }">학생 ${i }</a></td>
	</tr>
</c:forEach>
</table>