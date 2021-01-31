<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="vo" value="${data }"/>
<script type="text/javascript">
	$(document).ready(function() {
		$(".cancel").click(function () {
			location.href="list";
			
		})
		$(".modify").click(function () {
			var table = $('.cc');
			var tr = table.children().children();
			var td = tr.children();

			code = td.eq(7).text();
			
			location.href="modifyreg?code="+code;
			
		})
		$(".delete").click(function () {
			var table = $('.dd');
			var tr = table.children().children();
			var td = tr.children();

			code = td.eq(7).text();
			
			location.href="delete?code="+code;
			
		})
	})
	
function modi(){
	
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

</script>
<form action="modifyreg" class="modify" method="post">
<input type="hidden" name="code" readonly="readonly" value="${vo.code }" />
<input type="hidden" name="name" readonly="readonly" value="${vo.name }" />
	<div class="detail">
		<table border="" class="table table-hover dd">
		<thead class="table-success">
			<tr>
				<h2>재고 수정</h2>
			</tr>
		 	<tr align="center">
		 		<!-- <th scope="col" width="5%">체크</th> -->
		 		<th scope="col" width="12%">제품코드</th>
		 		<th scope="col" width="12%">제품명</td>
		 		<th scope="col" width="12%">수량</th>
		 		<th scope="col" width="12%">단가</th>	 		
		 		<th scope="col" width="12%">제품상세</th>	 		 		
		 		<th scope="col" width="12%">거래처명</th>	 		
		 		<th scope="col" width="12%">거래여부</th>	 		 		
		 		<!-- <th scope="col" width="12%">삭제/등록</td> --> 		 		

		 	</tr>

		 </thead>
		 <tbody>
		 	<tr align="center">
		 		<!-- <td><input type="radio" name="invencode" value="${vo.code }"/></td> -->
		 		<td width="12%"><input type="text" name="code" size="12" maxlength="10" value="${vo.code }"/></td>
		 		<td><input type="text" name="name" size="17" maxlength="25" value="${vo.name }" /></td>
		 		<td><input type="number" name="qtt" min="1" max="10000" value="${vo.qtt }" /></td>
		 		<td><input type="number" name="cost" min="1" value="${vo.cost }" /></td>	 		
		 		<td><textarea name="content" cols="40" rows="1">${vo.content }</textarea></td>
		 		<td><input type="text" name="client" size="17" maxlength="25" value="${vo.client }" /></td>	 	
		 		<td> 
		 		<!--  <input type="radio" name="or" class="possi"/><label for="possi">가능</label>
		 		<input type="radio" name="or" class="impo" /><label for="impo">불가능</label> -->
		 		</td>
			</tr>
		 	<tbody>
		 	
		</tbody>

	 </table>
				<td>
					<input class="btn btn-success modify" type="submit" onclick="modi()" value="등록" />
					<input class="btn btn-success delete" type="button" onclick="dele()" value="삭제" />
					<input class="btn btn-success cancel" type="button" onclick="back()" value="뒤로" />
		 		</td>
	</div>
</form>
