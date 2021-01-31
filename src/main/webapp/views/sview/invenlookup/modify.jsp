<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="vo" value="${data }"/>
<script type="text/javascript">
$(document).ready(function() {
		
		$(".cancel").click(function () {
			location.href="list";
			
		})


	$("#modify_btn").click(function(){

		console.log("재고수정 유효성!!!")
		
		
		var code = document.getElementById("code");
		var name = document.getElementById("name");
		var qtt = document.getElementById("qtt");
		var cost = document.getElementById("cost");
		var client = document.getElementById("client");
		

		if (qtt.value == ""){	//해당 입력값이 없을 경우
			alert("제품수량은 필수 입력값입니다.");	
			qtt.focus();	//커서가 깜빡이게 하는 거
			return false; //진행 X
			};
		if (cost.value == ""){	//해당 입력값이 없을 경우
			alert("제품단가는 필수 입력값입니다.");	
			cost.focus();	//커서가 깜빡이게 하는 거
			return false; //진행 X
			};
		if (client.value == ""){	//해당 입력값이 없을 경우
			alert("거래처명은 필수 입력값입니다.");	
			client.focus();	//커서가 깜빡이게 하는 거
			return false; //진행 X
			};

			var num1 = /^[0-9]+$/; //숫자만 입력하는 정규식	
			if (!num1.test(qtt.value)) {
				alert("수량은 숫자만 입력 가능합니다.")
				return false;
				}
			var num2 = /^[0-9]+$/;
			if (!num2.test(cost.value)) {
				alert("단가는 숫자만 입력 가능합니다.")
				return false;
				}

			$.ajax({
				url : "/ajax/eview/invenenr/modifyChk",
				type : "POST",
				data : {
					crre_name : $('#client').val()
					}, //data닫기
					dataType : "JSON",
					success:function(data){
						console.log(data[0].chkclient)
						console.log("성공 들어옴")

						if(data[0].chkclient != 0){	//거래처가 있으면
							console.log("if문" + data[0].chkclient)

							modify_form.submit();
							}else{
								console.log("else문")
								if(data[0].chkclient == 0){
									alert("존재하지 않는 거래처입니다")			
									}
								return
								}

				
						}, //success닫기

						error:function(e){
							alert(e.responseText)
							}

				})
		
		})	//#modify_btn 닫기
	});


</script>

<div> 
<h1 align="center">재고수정</h1>
</div>
<form name="modify_form" action="modifyreg" class="modify_form" method="post">
	<div class="detail">
		<table border="" class="table table-hover dd">
		<thead class="table-success">
		 	<tr align="center">
		 		
		 		<th scope="col" width="12%">제품코드</th>
		 		<th scope="col" width="12%">제품명</th>
		 		<th scope="col" width="12%">수량</th>
		 		<th scope="col" width="12%">단가</th>	 		
		 		<th scope="col" width="12%">제품상세</th>	 		 		
		 		<th scope="col" width="12%">거래처명</th>	 		
		 		<th scope="col" width="12%">거래여부</th>	 		 		
		 				 		

		 	</tr>

		 </thead>
		 <tbody>
		 	<tr align="center">
		 		<!-- <td><input type="radio" name="invencode" value="${vo.code }"/></td> -->
		 		<td width="12%"><input type="hidden" name="code" id="code" value="${vo.code }" />${vo.code }</td>
		 		<td><input type="hidden" name="name" id="name" value="${vo.name }" />${vo.name }</td>
		 		<td><input type="number" name="qtt" id="qtt" max="10000" value="${vo.qtt }" /></td>
		 		<td><input type="number" name="cost" id="cost" min="1" value="${vo.cost }" /></td>	 		
		 		<td><textarea name="content" id="content" cols="40" rows="1">${vo.content }</textarea></td>
		 		<td><input type="text" name="client" id="client" size="17" maxlength="25" value="${vo.client }" /></td>	 	
		 		<td><input type="hidden" name="possi" id="possi" value="${vo.possi }" />${vo.possi }</td>
			</tr>
		 	<tbody>
		 	
		</tbody>

	 </table>
				<div>
					
					<button id="modify_btn" type="button" class="btn btn-success">수정</button>
					<input class="btn btn-success cancel" type="button" value="뒤로"/>
		 		</div>
	</div>
</form>
