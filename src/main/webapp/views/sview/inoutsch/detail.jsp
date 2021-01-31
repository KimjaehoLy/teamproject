<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="vo" value="${data }"/>
<script type="text/javascript">
	$(document).ready(function() {
		$(".cancel").click(function () {
			location.href="list";
			
		})
		/* $(".modify").click(function () {
			var table = $('.cc');
			var tr = table.children().children();
			var td = tr.children();

			pdcode = td.eq(9).text();
			
			location.href="modifyreg?pdcode="+pdcode;
			
		}) */
		$(".delete").click(function () {
			var table = $('.dd');
			var tr = table.children().children();
			var td = tr.children();

			order_num2 = td.eq(0).text();
			console.log(order_num2);
	         
	        alert('삭제하시겠습니까?\n삭제 후 복구되지 않습니다.');			
			location.href="delete?order_num2="+order_num2;
			
		})
	})
	
/* function modi(){
	
	if(confirm("수정하시겠습니까?")){
		frm.submit()
	} 
}
function dele(){
	
	if(confirm("삭제하시겠습니까?\n삭제 후 복구되지 않습니다.")){
		frm.submit()
	}
}
function back(){
	
	if(confirm("돌아가시겠습니까?\n입력한 내용은 저장되지 않습니다.")){
		frm.submit()
	}
}
 */
</script>
<form action="modifyreg" class="modify">
	<div class="detail">
		<table border="" class="table table-hover dd">
		<thead class="table-success">
			<tr>
				<h2>출고 수정</h2>
			</tr>
		 	<tr align="center">
		 		<th scope="col" width="7%">출고번호</th>
		 		<th scope="col" width="10%">제품명</th>
		 		<th scope="col" width="7%">출고수량</th>	 		
		 		<th scope="col" width="12%">거래처</th>	 		
		 		<th scope="col" width="10%">제품코드</th>
		 		<th scope="col" width="7%">단가</th>	 		
		 		<th scope="col" width="12%">제품상세</th>	 		
		 		<th width="150px" align="center">출고예정일</th>
		 		<th width="10%">승인여부</th>	 		
		 		
		 	</tr>

		 </thead>
		 <tbody>
		 	<tr align="center">
		 		<!-- <td><input type="date" name="outdate" value="${vo.outdate }" /></td>
		 		<input type="text" id="advert_start" value="<fmt:formatDate value="${advert_start}" pattern="yyyy-mm-dd" />" />  -->

		 		<td><input type="text" name="order_num2" readonly="readonly" size="10" value="${vo.order_num2 }" /></td>
		 		<td><input type="text" name="kind" readonly="readonly" size="10" value="${vo.kind }" /></td>
		 		<td><input type="number" name="cnt" readonly="readonly" value="${vo.cnt }" /></td>
		 		<td><input type="text" name="costomer" readonly="readonly" value="${vo.costomer }" /></td>
		 		<td><input type="text" name="code" size="10" value="${vo.code }" /></td>
		 		<td><input type="number" name="cost" value="${vo.cost }" /></td>
		 		<td><input type="text" name="content" value="${vo.content }" /></td>
		 		<td>
		 			<input type="date" name="outdate" value="<fmt:formatDate value="${vo.outdate}" pattern="yyyy-mm-dd"/>"/>
		 		</td>
		 		<td>
		 			<select name="outch">
		 				<option>대기
		 				<option>완료
		 			</select>
		 		</td>
			</tr>
		 	<tbody>
		 	
		</tbody>

	 </table>
				<td>
					<input class="btn btn-success modify" type="submit" value="등록" />
					<!-- <input class="btn btn-success delete" type="button" value="삭제" /> -->
					<input class="btn btn-success cancel" type="button" value="뒤로" />
		 		</td>
	</div>
</form>
