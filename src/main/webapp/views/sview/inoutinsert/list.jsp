<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>04_inven</title>

<!-- <link rel="stylesheet" href="/resources/css/sview.css"> -->

</head>
<body>
<script type="text/javascript">

function re(){
   
   if(confirm("초기화하시겠습니까?\n입력한 내용은 저장되지 않습니다.")){
      frm.submit()
   }
}

function invenout_check(){
	
	var outno = document.getElementById("outno");
	var code = document.getElementById("code");
	var name = document.getElementById("name");
	var qtt = document.getElementById("qtt");
	var cost = document.getElementById("cost");
	var client = document.getElementById("client");
	var content = document.getElementById("content");
	var outdate = document.getElementById("outdate");
	var outch = document.getElementById("outch");
	
	if (outno.value == ""){	//해당 입력값이 없을 경우
		alert("출고번호는 필수 입력값입니다.");	
		outno.focus();	//커서가 깜빡이게 하는 거
		return false; //진행 X
		};
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
	if (outdate.value == ""){	//해당 입력값이 없을 경우
		alert("출고일은 필수 입력값입니다.");	
		outdate.focus();	//커서가 깜빡이게 하는 거
		return false; //진행 X
		};		

	var num1 = /^[0-9]+/g; //숫자만 입력하는 정규식	
	if (!num1.test(qtt.value)) {
		alert("수량은 숫자만 입력 가능합니다.")
		return false;
		}

	var num2 = /^[0-9]+/g;
	if (!num2.test(cost.value)) {
		alert("단가는 숫자만 입력 가능합니다.")
		return false;
		}

	document.outinsert_form.submit();
}

</script>
<div>
<h1 align="center">출고 등록</h1>

<div>
<form name="outinsert_form" action="reg" method="post">
   <table width=100% border="" class="table table-hover" >
       <thead class="table-success">
          <tr align="center">
             <th scope="col" width="7%">출고번호</th>
             <th scope="col" width="7%">제품코드</th>
             <th scope="col" width="10%">제품명</th>
             <th scope="col" width="5%">출고수량</th>
             <th scope="col" width="7%">단가</th>
             <th scope="col" width="10%">거래처</th>       
             <th scope="col" width="10%">제품상세</th>       
             <th width="12%" align="center">출고예정일</th>
             <th width="10%">승인여부</th>                 
          </tr>
       </thead>
       
       <tbody>
          <tr align="center">
             <td><input type="text" name="outno" id="outno" size="10" /></td>
             <td><input type="text" name="code" id="code" size="5" /></td>
             <td><input type="text" name="name" id="name" size="10" /></td>
             <td><input type="number" name="qtt" id="qtt" size="5" /></td>
             <td><input type="number" name="cost" id="cost" size="5" /></td>
             <td><input type="text" name="client" id="client" size="7" /></td>
             <td><input type="text" name="content" id="content" size="10" /></td>
             <td><input type="date" name="outdate" id="outdate" size="10" /></td>
             <td>
             		<select name="outch" id="outch" >
		 				<option>대기
		 				<option>완료
		 			</select>
             </td>
          </tr>
          
      </tbody>
      
    </table>
    <br>
   <div>
         <!-- pw를 입력하세요&nbsp;<input type="password" name="pwCheck" size="10" maxlength="20"/> -->
         <button type="button" class="btn btn-success" onclick="invenout_check()">등록</button>
         <input class="btn btn-success" type="reset" value="초기화" onclick="re()" />


   </div>
   
</form>
</div>
</div>
</body>
</html>