<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script type="text/javascript"  src="/resources/js/input.js"></script>
 
<center><h2 id="inserth2">품질관리(검사등록)</h2></center>
<form action="reg" id="inputform">
<div class="insert">
	<table width=100% class="table table-hover ">
		<thead class="thead-dark" >
		<tr align="center">
			<th width="5.5%">No</th>			
			<th width="7%">제품코드</th>
			<th width="7%">검사코드</th>
			<th width="7%">제품명</th>
			<th width="7%">수량</th>
			<th width="7%">시료수량</th>
			<th width="7%">적격수량</th>
			<th width="8.5%">부적격수량</th>
			<th width="5%">단가</th>
			<th width="8%">검사자명</th>
			<th width="7%">검사구분</th>
			<th width="7%">거래처명</th>
			<th width="7%">진행상태</th>
			<th width="7%">불합 사유</th>
		</tr>
		  <%
		for(int i=1; i<=5; i++ ){
			%> 
		<tr align="center">
			<td width="6%"> <%=i %> </td>
			<td width="7%"><input type="text" class="input" name="pdcode" placeholder="ex)GT100"/></td>
			<td width="7%"><input type="text" class="input" name="qlcode" placeholder="ex)QL703"/></td>
			<td width="7%"><input type="text" class="input" name="qlpdname" placeholder="ex)예가체프"/></td>
			<td width="7%"><input type="text" class="input" name="qlcnt2"  placeholder="ex)숫자"/></td> 
			<td width="7%"><input type="text" class="input" name="qlsamplecnt2" placeholder="ex)숫자"/></td> 
			<td width="7%"><input type="text" class="input" name="qlsuccnt2" placeholder="ex)숫자"/></td> 
			<td width="8%"><input type="text" class="input" name="qlfailcnt2" placeholder="ex)숫자"/></td> 
			<td width="5%"><input type="text" class="input" name="qlprice2" placeholder="ex)숫자"/></td>
			<td width="8%"><input type="text" class="input" name="testername" /></td>
			<td width="7%">
				<select class="way" name="qlway" >
					<option>전수검사
					<option selected>샘플링검사
					<option>미정
				</select> 		
			</td>
			 <td width="7%"><input type="text" class="input" name="customer" placeholder="ex)스타벅스"/></td>
			<td width="7%">
				<select  name="qlstate">
					<option>대기
					<option>진행중
					<option>합격
					<option>불합격
				</select>
			</td>
			<td width="7%">
			<textarea rows="2" cols="20" name="failreson"></textarea>
			</td>
		</tr> 
	   <%} %>
		<tr align="center">
			<td colspan="14">
				<input class="btn btn-secondary" type="button" id="btns_3" value="등록" />
				
				<input class="btn btn-secondary" type="reset" id="btns_2" value="초기화" />
			</td>
		</tr>
		</thead>		
	</table>
</div>
</form>