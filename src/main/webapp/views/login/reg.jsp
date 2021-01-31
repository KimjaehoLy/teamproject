
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginReg</title>
</head>
<body>
<script>				//	로그인 실패시만 이동
	alert('${msg}'); // 경고창 출력용 Reg jsp  DAO변환시 사라질 예정
	location.href = "loginMain/l/login/main";	//경고창 출력후  로그인 페이지로 다시이동
</script>
</body>
</html>