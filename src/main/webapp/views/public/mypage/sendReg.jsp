<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%String abc = request.getParameter("fromu"); %>
<input type="hidden" name="tou" value="<%=abc%>"/>
<script>
	alert("전송 완료");
	var data = $('input[name="tou"]').val()
	location.href = "note?tou="+data;
</script>