/**
 * 
 */

$(document).ready(function() {
		$(".cancel").click(function () {
			location.href="list";
			
		})
		
		cnt =  /^[0-9]*$/;
		$('input[name="qlcnt"]').keyup(function(e){
			valu = $(this).val();
			if(!cnt.test(valu)){
				alert('숫자만 입력하세요');
				$(this).val(valu.replace(/[^0-9]/g,""));
			}	
		})
		$('input[name="qlsuccnt"]').keyup(function(e){
			valu = $(this).val();
			if(!cnt.test(valu)){
				alert('숫자만 입력하세요');
				$(this).val(valu.replace(/[^0-9]/g,""));
			}	
		})
		$('input[name="qlfailcnt"]').keyup(function(e){
			valu = $(this).val();
			if(!cnt.test(valu)){
				alert('숫자만 입력하세요');
				$(this).val(valu.replace(/[^0-9]/g,""));
			}	
		})
		$('input[name="qlprice"]').keyup(function(e){
			valu = $(this).val();
			if(!cnt.test(valu)){
				alert('숫자만 입력하세요');
				$(this).val(valu.replace(/[^0-9]/g,""));
			}	
		})
		
		$('.modifybtn').click(function(){			
			var inputcustomer = $('input[name="customer"]').val();
			var qlpdname = $('input[name="qlpdname"]').val();
			var pdcode = $('input[name="pdcode"]').val();
			var qlcnt = $('input[name="qlcnt"]').val();
			var qlprice = $('input[name="qlprice"]').val();
			/*입력된 거래처명을 받아온다  */
			$.ajax({
				url:"/ajax/aview/search/invendata",
				type:'GET',
				dataType:'json',
				success: function(data){
					var invenpdcode = [];
					var invenqtt = [];
					var invencost = [];
					var customer = [];
					var pdname = [];
					/*inven 에있는 codeid데이터을 invendata배열에 넣어준다   */
					for (var i in data){
						invenpdcode[i] = data[i].codeid;
					}	
					/*inven 에있는 qtt데이터을 invenqtt배열에 넣어준다   */
					for (var i in data){
						invenqtt[i] = data[i].qtt;
					}	
					/*inven 에있는 cost데이터을 invendata배열에 넣어준다   */
					for (var i in data){
						invencost[i] = data[i].price;
					}	
					/*correpondent 에있는 crre_named을 customer배열에 넣어준다   */
					for (var i in data){
						customer[i] = data[i].customer;
					}	
					/*inven 에있는 제품명을 pdname배열에 넣어준다   */
					for (var i in data){
						pdname[i] = data[i].pdname;
					}	
					/*CUSTOMER가 존재하는지 확인  */		
					var chk = false;
					msg = "";

					for(var i in inputcustomer){
						if(!customer.includes(inputcustomer) && !inputcustomer==""){
							msg = inputcustomer;
							chk = true;			
						}
					}
					if(chk){
						 alert("존재하지않는 거래처입니다. --->"+msg);
						 chk = false;
						 return
					};
					/*제품명이 존재하는지 확인  */		
					chk = false;
					msg = "";
					for(var i in qlpdname){
						if(!pdname.includes(qlpdname) && !qlpdname==""){
							msg = qlpdname;
							chk = true;			
						}
					}
					if(chk){
						 alert("존재하지않는 제품명입니다. --->"+msg);
						 chk = false;
						 return
					};
					/*제품수량 일치하는지 확인  */					
					chk = false;
					msg = "";					
					if(invenpdcode.includes(pdcode)&&!pdcode==""){
						var nn = invenpdcode.indexOf(pdcode)
						var cnt = invenqtt[nn]			
						if(!(qlcnt == cnt)&&!qlcnt==""){
							msg = pdcode
							chk = true;	
						}					
					}								
					if(chk){
						alert(msg + '의 제품수량이 맞지않습니다.');
						 chk = false;
						 return
					};
					/*제품단가 일치하는지 확인  */					
					chk = false;
					msg = "";					
					if(invenpdcode.includes(pdcode)&&!pdcode==""){
						var nn = invenpdcode.indexOf(pdcode)
						var price = invencost[nn]								
						if(!(qlprice == price)&&!qlprice==""){
							msg = pdcode
							chk = true;	
						}					
					}								
					if(chk){
						alert(msg + '의 제품의 단가가 맞지않습니다.');
						 chk = false;
						 return
					};
					
					frm.submit();
				},
				error: function(e){
					alert('실패')
				}
			})
			
		})
		$(".delete").click(function () {
			var table = $('.cc');
			var tr = table.children().children();
			var td = tr.children();

			pdcode = td.eq(10).text();
			
			location.href="delete?pdcode="+pdcode;
			
		})
	})