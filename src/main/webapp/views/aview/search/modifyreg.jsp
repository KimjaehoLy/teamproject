<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
	alert('수정되었습니다.');
	location.href="detail?pdcode=<%=request.getAttribute("param")%>";
</script>