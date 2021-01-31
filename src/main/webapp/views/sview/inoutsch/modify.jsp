<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:set var="vo" value="${data }"/>
<script type="text/javascript">
   $(document).ready(function() {
      $(".cancel").click(function () {
         location.href="list";
         
      })
   
   
   
      $("#out_btn").click(function() {
    		console.log("출고처리 유효성!!!")
    		
    		
    		    $.ajax({
				url : "/ajax/eview/invenenr/outChk",
				type : "POST",
				data : {
					code : $('#code').val()
					}, //data닫기
					dataType : "JSON",
					success:function(data){
						console.log(data[0].chkcode)
						console.log("성공 들어옴")

						if(data[0].chkcode != 0){	//코드가 있으면
							console.log("if문" + data[0].chkcode)

							}else if(data[0].chkcode == 0){
								console.log("else문")
								
									alert("존재하지 않는 제품코드입니다")			
								return false
									
								}
							out_form.submit();

				
						}, //success닫기

						error:function(e){
							alert(e.responseText)
							}

				})
    		
    		var code = document.getElementById("code");
    		var outqtt = document.getElementById("outqtt");
    		var cost = document.getElementById("cost");


    		if (code.value == ""){	//해당 입력값이 없을 경우
    			alert("제품코드는 필수 입력값입니다.\nAA000형식으로 입력 가능합니다.");	
    			code.focus();	//커서가 깜빡이게 하는 거
    			return false; //진행 X
    			};
    		
    		if (outqtt.value == ""){	//해당 입력값이 없을 경우
    			alert("제품수량은 필수 입력값입니다.");	
    			qtt.focus();	//커서가 깜빡이게 하는 거
    			return false; //진행 X
    			};
    			
    		if (cost.value == ""){	//해당 입력값이 없을 경우
    			alert("제품단가는 필수 입력값입니다.");	
    			cost.focus();	//커서가 깜빡이게 하는 거
    			return false; //진행 X
    			};
		
    		var ccd = /^[A-Z0-9]{5}$/; //알파벳 대문자, 숫자 5자리	
    		if (!ccd.test(code.value)) {
    			alert("형식에 맞게 입력해주세요.\n ex) AA000")
    			return false;
    			}

    		var num1 = /^[0-9]+$/; //숫자만 입력하는 정규식	
    		if (!num1.test(outqtt.value)) {
    			alert("수량은 숫자만 입력 가능합니다.")
    			return false;
    			}
    		var num2 = /^[0-9]+$/;
    		if (!num2.test(cost.value)) {
    			alert("단가는 숫자만 입력 가능합니다.")
    			return false;
    			}
    		

		
		})	//#modify_btn 닫기

    		

});
   
   

</script>
<h1 align="center">출고 처리</h1>
<form name="out_form" action="modifyreg" class="modify" method="post">
   <div class="detail">
      <table border="" class="table table-hover dd">
      <thead class="table-success">
         <tr>
         </tr>	
          <tr align="center">
             <th scope="col" width="7%">출고번호</th>
             <th scope="col" width="10%">제품명</th>
             <th scope="col" width="7%">출고의뢰수량</th>          
             <th scope="col" width="12%">거래처</th>          
             <th scope="col" width="10%">제품코드</th>             
             <th scope="col" width="7%">출고가능수량</th>          
             <th scope="col" width="7%">단가</th>          
             <th scope="col" width="12%">제품상세</th>          
             <th width="150px" align="center">출고예정일</th>
             <th width="10%">승인여부</th>          
             
          </tr>
      <c:set var="vo" value="${data }" />
       </thead>
       <tbody>
          <tr align="center">
             

             <td><input type="text" name="outno" readonly="readonly" size="10" value="${vo.order_num2 }" /></td>
             <td><input type="text" name="name" readonly="readonly" size="10" value="${vo.kind }" /></td>
             <td><input type="number" name="qtt" readonly="readonly" value="${vo.cnt }" /></td>
             <td><input type="text" name="client" readonly="readonly" value="${vo.customer }" /></td>
             <td><input type="text" name="code" id="code" size="10"
             	pattern="^[A-Z0-9]{5}$" title="코드형식에 맞게 입력해주세요." placeholder="ex) AA000"/></td>
             <td><input type="number" name="outqtt" id="outqtt" placeholder="출고수량을 입력해주세요" /></td>
             <td><input type="number" name="cost" id="cost" placeholder="단가를 입력해주세요"/></td>
             <td><input type="text" name="content"/></td>
             <td>
             
              
                <input type="date" name="outdate"/>
             </td>
             <td>
             	<select name="outch" id="outch">
             		<option>
             		<option>완료
             		<option>대기
             	</select>
             </td>
         </tr>
      </tbody>
    </table>
            <div>
               <button type="button" id="out_btn" class="btn btn-success">등록</button>
               <input class="btn btn-success cancel" type="button" value="뒤로" />
             </div>
   </div>
 
</form>


<div>
	<table border="" class="table table-hover dd">
      <thead class="table-success">
          <tr align="center">

             <th scope="col" width="10%">제품코드</th>
             <th scope="col" width="12%">제품명</th>
             <th scope="col" width="7%">수량</th>
             <th scope="col" width="7%">단가</th>
             <th scope="col" width="12%">제품상세</th>    
             <th scope="col" width="12%">등록일</th>    
             <th scope="col" width="7%">거래여부</th>                 
           
          </tr>
       </thead>
      <c:forEach items="${sub }" varStatus="code" var="vo">
       <tbody>

          <tr align="center">
             <th>${vo.code }</th>              
             <td>${vo.name }</td>                 
		     <td>${vo.qtt }</td>                 
             <td>${vo.cost }</td>                 
             <td>${vo.content }</td>                                             
             <td><fmt:formatDate value="${vo.regdate }" pattern="yyyy-MM-dd"/></td>                                             
             <td>${vo.possi }</td>
           
          </tr>         
      </tbody>
      </c:forEach>
	<thead class="table-success">
      <tr>
      <th colspan="7" align="center">
       	<nav aria-label="Page navigation example">
  			<ul class="pagination">
      	<c:if test="${startPage>1 }">
   			<li class="page-item">
    			<a class="page-link" href="?nowPage=${startPage-1 }&order_num2=${param.order_num2}&search=${param.search }" aria-label="Previous">
     			   <span aria-hidden="true">&laquo;</span>
     			</a>
    		</li>	
      	</c:if>
         <c:forEach begin="${startPage }" end="${endPage }" step="1" var="i">
            <c:choose>
               <c:when test="${nowPage==i }">
                  <li class="page-item active"><a class="page-link ">${i }</a></li>
               </c:when>
               <c:otherwise>
                  <li class="page-item"><a class="page-link" href="?nowPage=${i }&order_num2=${param.order_num2}&search=${param.search }">${i }</a></li>
               </c:otherwise>
            </c:choose>
         </c:forEach>
      	<c:if test="${endPage<lastPage }">
			<li class="page-item">
			      <a class="page-link" href="?nowPage=${endPage+1 }&order_num2=${param.order_num2}&search=${param.search }" aria-label="Next">
			        <span aria-hidden="true">&raquo;</span>
			      </a>
   		 	</li>
       	</c:if>
 			 </ul>
		</nav>
      </th>
   </tr>
   </thead>
    </table>
	 </div>