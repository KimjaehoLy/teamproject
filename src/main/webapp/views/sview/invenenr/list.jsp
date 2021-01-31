<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>02_inven</title>

<!-- <link rel="stylesheet" href="/resources/css/template.css" /> -->

<script type="text/javascript">
$(document).ready(function() {

 function re(){
	
	if(confirm("초기화하시겠습니까?\n입력한 내용은 저장되지 않습니다.")){
		frm.submit()
	}
} 

$("#insert_btn").click(function() {
	console.log("재고등록 유효성!!!")
	
	var code = document.getElementById("code");
	var name = document.getElementById("name");
	var qtt = document.getElementById("qtt");
	var cost = document.getElementById("cost");
	var content = document.getElementById("content");
	var client = document.getElementById("client");
	var possi = document.getElementById("possi");
	
	if (code.value == ""){	//해당 입력값이 없을 경우
		alert("제품코드는 필수 입력값입니다.\nAA000형식으로 입력 가능합니다.");	
		code.focus();	//커서가 깜빡이게 하는 거
		return false; //진행 X
		};
	if (name.value == ""){	//해당 입력값이 없을 경우
		alert("제품명은 필수 입력값입니다.");	
		name.focus();	//커서가 깜빡이게 하는 거
		return false; //진행 X
		};
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

	var ccd = /^[A-Z0-9]{5}$/; //알파벳 대문자, 숫자 5자리	
	if (!ccd.test(code.value)) {
		alert("형식에 맞게 입력해주세요.\n ex) AA000")
		return false;
		}

	var nnm = /^[가-힣A-Za-z\s]+$/; //
	if (!nnm.test(name.value)) {
		alert("제품명은 특수문자, 숫자 사용불가입니다.")
		return false;
		}
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
		url:"/ajax/eview/invenenr/invenChk",
		type:"POST",
		data : {
			code : $('#code').val(),
			crre_name : $('#client').val()
		},
		dataType : "json",
		success:function(data){
			console.log(data[1].chkclient)
			if(data[0].chkcode == 0 && data[1].chkclient != 0 ){
				
				insert_form.submit();
			}else{
				if(data[0].chkcode != 0){
					alert("이미 존재하는 코드입니다!")
					}else{
					alert("존재하지 않는 거래처입니다!")
					}
				return 
				}
			
		},
		error:function(e){
			alert(e.responseText)
		}
	})
})

	

});
</script>
</head>
<body>

<div> 
<h1 align="center">재고등록</h1>
</div>
<div>
<form action="reg" name="insert_form" method="post">
	<table border="" class="table table-hover">
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
		 	<td width="12%"><input type="text" name="code" id="code" size="12" min="1" max="5"
		 			pattern="/^[A-Z0-9]{5}$/" title="코드형식에 맞게 입력해주세요." placeholder="ex) AA000"/></td>
		 		<td><input type="text" name="name" id="name" size="17" 
		 			pattern="/^[가-힣A-Za-z\s]+$/" title="특수문자는 입력 불가합니다." placeholder="제품명을 입력해주세요"/></td>
		 		<td><input type="number" name="qtt" id="qtt" min="1" max="10000"
		 			pattern="/^[0-9]+$/" title="숫자만 입력 가능합니다."  placeholder="숫자만 입력가능합니다"/></td>
		 		<td><input type="number" name="cost" id="cost" min="1" 
		 			pattern="/^[0-9]+$/" title="숫자만 입력 가능합니다." placeholder="숫자만 입력가능합니다" /></td>	 		
		 		<td><textarea name="content" id="content" cols="40" rows="1"></textarea></td>
		 		<td><input type="text" name="client" id="client" size="17" min="1" max="15" placeholder="등록된 거래처를 입력해주세요"/></td>
		 		<td> 
		 			<select name="possi" id="possi">
		 				<option>대기
		 				<option>가능
		 				<option>불가능
		 			</select>
		 		</td>
		 	</tr>
		 </tbody>


	 </table>
	 <br>
	<div>
			<button id="insert_btn" class="btn btn-success">등록</button>
			
			<input class="btn btn-success" type="reset" value="초기화" onclick="re()" />

	</div>
</form>

</div>
</body>
</html>