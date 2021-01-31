/**
 * 
 $('#inputform').submit();
 */
$(document).ready(function(){
	
	
	$('.way').change(function(){
		qlstate = $(this).val();
		var tr = $(this).parent().parent();
		var td = tr.children();
		var way = $(this);
		var no = way.parent().parent();
		var thisline = no.children();
	
		
		if(qlstate == "전수검사" || qlstate =="미정"){
			$(thisline.eq(5)).html("<input type='hidden' class='input' name='qlsamplecnt2' value=' '/> -");		
			$(thisline.eq(6)).html("<input type='hidden' class='input' name='qlsuccnt2' value=' '/> -");		
			$(thisline.eq(7)).html("<input type='hidden' class='input' name='qlfailcnt2' value=' '/> -");		
					
		}
		else{
			$(thisline.eq(5)).html("<input type='text' class='input' name='qlsamplecnt2'/>");		
			$(thisline.eq(6)).html("<input type='text' class='input' name='qlsuccnt2' />");		
			$(thisline.eq(7)).html("<input type='text' class='input' name='qlfailcnt2' />");		
			
		}
		
	})	
	$('.input[name="qlcnt2"]').keyup(function(e){
			var qlcnt =  /^[0-9]*$/;
			v = $(this).val();
			if(!qlcnt.test(v)){
				alert('숫자만 입력하세요');
				$(this).val(v.replace(/[^0-9]/g,""));
			}			
		})
	$('.input[name="qlsuccnt2"]').keyup(function(e){
			var qlcnt =  /^[0-9]*$/;
			v = $(this).val();
			if(!qlcnt.test(v)){
				alert('숫자만 입력하세요');
				$(this).val(v.replace(/[^0-9]/g,""));
			}			
		})
	$('.input[name="qlfailcnt2"]').keyup(function(e){
			var qlcnt =  /^[0-9]*$/;
			v = $(this).val();
			if(!qlcnt.test(v)){
				alert('숫자만 입력하세요');
				$(this).val(v.replace(/[^0-9]/g,""));
			}			
		})
	$('.input[name="qlsamplecnt2"]').keyup(function(e){
			var qlcnt =  /^[0-9]*$/;
			var v = $(this).val();
			if(!qlcnt.test(v)){
				alert('숫자만 입력하세요');
				$(this).val(v.replace(/[^0-9]/g,""));
			}			
		})
	$('.input[name="qlprice2"]').keyup(function(e){
			var qlcnt =  /^[0-9]*$/;
			var v = $(this).val();
			if(!qlcnt.test(v)){
				alert('숫자만 입력하세요');
				$(this).val(v.replace(/[^0-9]/g,""));
			}			
		})
		
	$('#btns_3').click(function(){
		var inputcode = [];
		var inputpdname = [];
		var inputqlcode = [];
		var inputcustomer = [];
		var inputcnt =[];
		var inputprice =[];
		var inputfailreson =[];
		
		/*입력된 제품코드를 받아온다  */
		$('.input[name="pdcode"]').each(function(i,e){
			inputcode[i] = $(this).val();			
		})
		/*입력된 제품명을 받아온다  */
		$('.input[name="qlpdname"]').each(function(i,e){
			inputpdname[i] = $(this).val();			
		})
		/*입력된 검사코드를 받아온다  */
		$('.input[name="qlcode"]').each(function(i,e){
			inputqlcode[i] = $(this).val();			
		})	
		/*입력된 제품수량 받아온다  */
		$('.input[name="qlcnt2"]').each(function(i,e){
			inputcnt[i] = $(this).val();			
		})	
		/*입력된 제품단가 받아온다  */
		$('.input[name="qlprice2"]').each(function(i,e){
			inputprice[i] = $(this).val();			
		})	
		/*입력된 거래처명을 받아온다  */
		$('.input[name="customer"]').each(function(i,e){
			inputcustomer[i] = $(this).val();
		})
		/*불합사유 null막기위함  */
		$('textarea[name="failreson"]').each(function(i,e){
			inputfailreson[i] = $(this);
		})
	
		/*유효성검사에 필요한 데이터를 받아온다  */
		$.ajax({
			url:"/ajax/aview/search/invendata",
			type:'GET',
			dataType:'json',
			success: function(data){
				var arr = [];
				var pdcode = [];
				var pdname = [];
				var qlcode = [];
				var customer = [];
				var invenQtt = [];
				var price = [];
				/*INVEN 에있는 PDCODE를 ARR에 넣어준다   */
				for(var i in data){
					arr[i] = data[i].codeid;				
				}				
				/*INVEN 에있는 제품명을 pdname 에 넣어준다   */
				for(var i in data){
					pdname[i] = data[i].pdname;				
				}
				/*QLTEST와 QLTESTHISTORY 에있는 PDCODE를 PDCODE배열에 넣어준다   */
				for (var i in data){
					pdcode[i] = data[i].pdcode;
				}				
				/*QLTEST와 QLTESTHISTORY 에있는 QLCODE를 QLCODE배열에 넣어준다   */
				for (var i in data){
					qlcode[i] = data[i].qlcode;
				}
				/*inven 에있는 cnt를 invenQtt배열에 넣어준다   */
				for(var i in data){
					invenQtt[i] = data[i].qtt;		
				}				
				/*inven 에있는 cnt를 invenQtt배열에 넣어준다   */
				for(var i in data){
					price[i] = data[i].price;		
				}				
				/*correpondent 에있는 crre_named을 customer배열에 넣어준다   */
				for (var i in data){
					customer[i] = data[i].customer;
				}

				var chk = false;
				var msg = "";
				/*PDCODE가 존재하는지 확인  */
				for(var i in inputcode){				
					if(arr.includes(inputcode[i])==false && !inputcode[i]==""){
						msg = inputcode[i];
						chk = true;			
					}
				}
				if(chk){
					 alert("존재하지않는 제품코드입니다. --->"+msg);
					 chk = false;
					 return
				};				
				/*PDCODE가 중복되는지 확인  */		
				chk = false;
				msg = "";
				for(var i in inputcode){
					if(pdcode.includes(inputcode[i]) && !inputcode[i]==""){
						msg = inputcode[i];
						chk = true;			
					}
				}
				if(chk){
					 alert("중복되는 제품코드입니다. --->"+msg);
					 chk = false;
					 return
				};		
				/*QLCODE가 중복되는지 확인  */		
				chk = false;
				msg = "";
				for(var i in inputqlcode){
					if(qlcode.includes(inputqlcode[i]) && !inputqlcode[i]==""){
						msg = inputqlcode[i];
						chk = true;			
					}
				}
				if(chk){
					 alert("중복되는 검사코드입니다. --->"+msg);
					 chk = false;
					 return
				};		
				/*제품명이 존재하는지 확인  */		
				chk = false;
				msg = "";
				for(var i in inputpdname){
					if(!pdname.includes(inputpdname[i]) && !inputpdname[i]==""){
						msg = inputpdname[i];
						chk = true;			
					}
				}
				if(chk){
					 alert("존재하지않는 제품명입니다. --->"+msg);
					 chk = false;
					 return
				};	
				/*제품수량이 일치하는지 확인  */				
				var nn = [];
				var cnt = [];
				var chk = false;
				msg = "";
				for(var i in inputcode){
					if(arr.includes(inputcode[i])&&!inputcode[i]==""){
						nn[i] = arr.indexOf(inputcode[i])
						cnt[i] = invenQtt[nn[i]]			
						if(!(inputcnt[i] == cnt[i])&&!inputcnt[i]==""){
							msg = inputcode[i]
							chk = true;	
						}					
					}			
				}
				if(chk){
					alert(msg + '의 제품수량이 맞지않습니다.');
					 chk = false;
					 return
				};
				/*제품단가가 일치하는지 확인  */				
				var qlprice = [];
				var chk = false;
				msg = "";
				for(var i in inputcode){
					if(arr.includes(inputcode[i])&&!inputcode[i]==""){
						nn[i] = arr.indexOf(inputcode[i])
						qlprice[i] = price[nn[i]]			
						if(!(inputprice[i] == qlprice[i])&&!inputprice[i]==""){
							msg = inputcode[i]
							chk = true;	
						}					
					}			
				}
				if(chk){
					alert(msg + '의 제품단가가 맞지않습니다.');
					 chk = false;
					 return
				};				
				/*CUSTOMER가 존재하는지 확인  */		
				chk = false;
				msg = "";
				for(var i in inputcustomer){
					if(!customer.includes(inputcustomer[i]) && !inputcustomer[i]==""){
						msg = inputcustomer[i];
						chk = true;			
					}
				}
				if(chk){
					 alert("존재하지않는 거래처입니다. --->"+msg);
					 chk = false;
					 return
				};
				/*첫줄의 입력값 존재유무를 확인하기 위한 배열 생성  */		
				var inputval = [
					$('.input[name="pdcode"]').val(),$('.input[name="qlcode"]').val(),
					$('.input[name="qlpdname"]').val(),$('.input[name="qlcnt2"]').val(),
					$('.input[name="qlsamplecnt2"]').val(),$('.input[name="qlsuccnt2"]').val(),
					$('.input[name="qlfailcnt2"]').val(),$('.input[name="qlprice2"]').val(),
					$('.input[name="testername"]').val(),$('.input[name="pdcode"]').val(),
					$('.input[name="customer"]').val()
				]
				/*첫줄의 입력값 존재유무를 확인 */
				chk = false;			
				for (var i in inputval){
					if(inputval[i] == ""){					
						chk = true;			
					}
				}
				if(chk){
					 alert("첫 줄 입력값은 존재해야합니다.");
					 chk = false;
					 return
				};	
				for(var i in inputfailreson){
					if(inputfailreson[i].val()==""){
						inputfailreson[i].val(' ')
					}
				}
				 $('#inputform').submit();
				
			},
			error: function(e){
				alert('실패')
			}
		})		
		
	})
})