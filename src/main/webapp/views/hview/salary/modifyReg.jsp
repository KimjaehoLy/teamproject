<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	alert('사원급여 수정 되었습니다.');
	location.href = "../<%=request.getAttribute("redirect") %>"
</script>
</body>
</html>