<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%Object abc = session.getAttribute("ddd");%> <!-- user_id 받아서 처리 재호가 세션으로 만들었으면 페이지 전체의 REG가 간단해짐 -->
<input type="hidden" name="tou" value="<%=abc%>"/>
<script>
	alert("삭제되었습니다.");
	var data = $('input[name="tou"]').val()
	location.href = "note?tou=${mydata.user_id}";
</script>
