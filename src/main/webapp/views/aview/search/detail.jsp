<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="vo" value="${data }"/>
<c:set var="sample" value="${vo.qlway }"/>
<script type="text/javascript">
	$(document).ready(function() {
		$(".cancel").click(function () {
			location.href="list";
			
		})
		$(".modify").click(function () {
			var table = $('.cc');
			var tr = table.children().children();
			var td = tr.children();

			pdcode = td.eq(10).text();
			
			location.href="modify?pdcode="+pdcode;
			
		})
		$(".delete").click(function () {
			var table = $('.cc');
			var tr = table.children().children();
			var td = tr.children();

			pdcode = td.eq(10).text();
			
			location.href="delete?pdcode="+pdcode;
			
		})
		
	})
</script>

<div class="detail">
	<table border="1" class="table cc" >
		<thead class="thead-dark" >
			<tr align="center">
				<th colspan="6">
					<h2>검사현황 상세정보</h2>
				</th>
			</tr>
			<tr align="center" height="50px">
				<th >${vo.regdate }</th>					
				<td colspan="5" align="right">		
					<button type="button" class="btn-secondary cancel">x</button>
				</td>
			</tr>
			<tr align="center">
				<th>검사코드</th>
				<td>
					${vo.qlcode }
				</td>
				<th scope="row">검사방법</th>
				<td>
					${vo.qlway }
				</td>										
				<th rowspan="6">불합사유</th>									
				<td rowspan="6" width="30%">	
					${vo.failresonstr }
				</td>
			</tr>
			<tr align="center" class="one">
				<th>제품코드</th>
				<td>
					${vo.pdcode }
				</td>
				<th>검사결과</th>
				<td>			
					${vo.qlstate }
				</td>
			</tr>
			<tr align="center">		
				<th>제품명</th>
				<td>
					${vo.qlpdname }	
				</td>
				<th>수량</th>
				<td>
					${vo.qlcnt }
				</td>
			</tr>
			<tr align="center">
				<th>시료수량</th>
				<td>
				<c:choose>
					<c:when test="${sample!='샘플링검사'}">
					-
					</c:when>
					<c:otherwise>
						${vo.qlsamplecnt }
					</c:otherwise>
				</c:choose>
				</td>
				<th>적격수량</th>
				<td>
					${vo.qlsuccnt }
				</td>				
			</tr>
			<tr align="center">
				<th>부적격수량</th>
				<td>			
					${vo.qlfailcnt }			
				</td>
				<th>단가</th>
				<td>
					${vo.qlprice }
				</td>
			</tr>
			<tr align="center">
				<th>검사자명</th>
				<td>
					${vo.testername }
				</td>
				<th>거래처명</th>
				<td>
					${vo.customer }
				</td>
			</tr>
			<tr align="center">
				<td colspan="6">
				<button type="button" class="btn-secondary modify">수정</button>
				<button type="button" class="btn-secondary delete">삭제</button>
				</td>
			</tr>
		 </thead>
	</table>		
</div>
