<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<div class="aside_box">
		<ol>
			<c:forEach items="${asideGo }" var="arr">
			<li><button type="button" class="btn btn-outline-primary"
			onclick="location.href='telplate/${arr[1]}'">${arr[0] }</button></li>		
			</c:forEach>
		</ol> 
	</div>