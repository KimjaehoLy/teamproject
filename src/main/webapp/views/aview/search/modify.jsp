<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="vo" value="${data }"/>
<c:set var="sample" value="${vo.qlway }"/>
<script type="text/javascript"  src="/resources/js/searchmodify.js"></script>
<form action="modifyreg" class="modify" id="frm">
<input type="hidden" name="pdcode" readonly="readonly" value="${vo.pdcode }" />
<input type="hidden" name="qlcode" readonly="readonly" value="${vo.qlcode }" />
	<div class="detail">
		<table border="1" class="table cc" >
			<thead class="thead-dark" >
				<tr align="center">
					<th colspan="6">
						<h2>검사현황 수정</h2>
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
					<textarea rows="15" cols="50" name="failreson" >${vo.failreson }</textarea>
					</td>
				</tr>
				<tr align="center" class="one">
					<th>제품코드</th>
					<td>
						${vo.pdcode }
					</td>
					<th>검사결과</th>
					<td>			
						<select name="qlstate" >
							<option>대기
							<option>진행중
							<option>합격
							<option>불합격
						</select>	
					</td>
				</tr>
				<tr align="center">		
					<th>제품명</th>
					<td>
					<input type="text" name="qlpdname" value="${vo.qlpdname }" />
					</td>
					<th>수량</th>
					<td>
					<input type="text" name="qlcnt" value="${vo.qlcnt }" />
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
						<input type="text" name="qlsamplecnt" value="${vo.qlsamplecnt }" />
						</c:otherwise>
					</c:choose>
					</td>
					<th>적격수량</th>
					<td>
					<input type="text" name="qlsuccnt" value="${vo.qlsuccnt }" />
					</td>				
				</tr>
				<tr align="center">
					<th>부적격수량</th>
					<td>
						<input type="text" name="qlfailcnt" value="${vo.qlfailcnt }" />
					</td>
					<th>단가</th>
					<td>
					<input type="text" name="qlprice" value="${vo.qlprice }" />
					</td>
				</tr>
				<tr align="center">
					<th>검사자명</th>
					<td>
					<input type="text" name="testername" value="${vo.testername }" />
					</td>
					<th>거래처명</th>
					<td>
					<input type="text" name="customer" value="${vo.customer }" />
					</td>
				</tr>
				<tr align="center">
					<td colspan="6">
					<button type="button" class="btn-secondary modifybtn">등록</button>
					<button type="button" class="btn-secondary delete">삭제</button>
					</td>
				</tr>
			 </thead>
		</table>		
	</div>
</form>
