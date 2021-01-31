<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/webjars/jquery/3.5.1/jquery.js"></script>

<link href='https://cdn.jsdelivr.net/npm/fullcalendar@3.10.2/dist/fullcalendar.min.css' rel='stylesheet' />
<link href='https://cdn.jsdelivr.net/npm/fullcalendar@3.10.2/dist/fullcalendar.print.css' rel='stylesheet' media='print' />

<script src='https://cdn.jsdelivr.net/npm/moment@2.24.0/min/moment.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/jquery@3.5.0/dist/jquery.min.js'></script>
<script src='https://cdn.jsdelivr.net/npm/fullcalendar@3.10.2/dist/fullcalendar.min.js'></script>

<style>

  html, body {
    margin: 0;
    padding: 0;
    font-family: "Lucida Grande",Helvetica,Arial,Verdana,sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 900px;
    margin: 40px auto;
  }

</style>


  <script>  
  console.log('${mydata.user_cate}')
  $(function() {
    $('#calendar').fullCalendar({
      defaultView: 'month',

		
      header: {
        center: 'addEventButton'
      },
		
      eventClick: function(calEvent, jsEvent, view) { 
    	  
    	  console.log(calEvent.start.format()); 
    	 
    	  console.log(calEvent); 
    	  
    	  var r = confirm(calEvent.title+" 삭제하시겠습니까?"); 
    	  
    	  if('${mydata.user_cate}'=='인사부'){
    	  if (r === true) { 
    	 
    	  $('#calendar').fullCalendar('removeEvents', calEvent._id); 
    	  console.log(calEvent.title);
          $.ajax({
              type: "post", 
              url: "/fuldelete", 
              dataType: "json", 
              contentType : "application/x-www-form-urlencoded; charset=UTF-8",
              data: {title : calEvent.title},
              error : function(error) {
              	console.log("error");
              },
              success : function(data) {
          	console.log("success");
              }
           
        	});
    	  
    	 
    	  } 
    	  }else{
			alert('인사부만 삭제가 가능합니다.')
        	  }
    	 }, 
    	      
	
      customButtons: {
          addEventButton: {
            text: '일정추가',
            click: function() {
            	if('${mydata.user_cate}'!='인사부'){
            		alert('인사부만 추가 가능합니다.')
					return
            	}

                
            	 var dateyear = prompt('년 이벤트를 입력해주세요')
                 var datemonth = prompt('월 이벤트를 입력해주세요')
                 var dateday = prompt('일 이벤트를 입력해주세요')
                 var datename = prompt('이벤트를 입력해주세요');
                 var datefullname = dateyear+'-'+datemonth+'-'+dateday
                 console.log(dateyear)
                 console.log(datemonth)
                 console.log(dateday)
                 console.log(datename)
                 
                 var date = moment(datefullname);

              if (date.isValid()) {
                $('#calendar').fullCalendar('renderEvent', {
                  title: datename,
                  start: date,
                  allDay: true
                });
                $.ajax({
                    type: "post", 
                    url: "/ajaxful", 
                    dataType: "json", 
                    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
                    data: {fulevent : datefullname+','+datename},
                    error : function(error) {
                    	console.log("error");
                    },
                    success : function(data) {
                	console.log("success");
                    }
	             
              	});
                
                alert('입력 되었습니다.');
              } else {
                alert('형식에 맞지 않거나 입력되지 않았습니다.');
              }
            }
          }
		
        }
      });

    });
  

 	$(document).ready(function(){
 		fn_get_events()
 	 	$('.fc-prev-button').click(function(){
		fn_get_events()		//이벤트 끌어오기 실행
 	 	 	})
 	 	$('.fc-next-button').click(function(){
		fn_get_events()		//이벤트 끌어오기 실행
 	 	 	})
 	 	$('.fc-today-button').click(function(){
		fn_get_events()		//이벤트 끌어오기 실행
 	 	 	})
		
		
		function log(msg){	
			$("#con").html("")
			$.each(msg.trim().split("\n"), function(i,ee){
				ee = ee.trim()
				if(ee!=""){
					var box = $("<div></div>")
					box.html(ee)
					$("#con").append(box)	
				}
			})
		}
		
		function fn_get_events()
		{
			$.ajax({
				url: '/caldata', 
				type:"GET",
				dataType: 'json', 
				success: function (data) {
					for(var ele in data){
					$('#calendar').fullCalendar('renderEvent', {
		            title: data[ele].eve_subject,
		            start: data[ele].eve_start,
		            end: data[ele].eve_end,
		            allDay: true
		         	 })
				    }
					console.log(data[0])
				},
		          error:function(e){
			          console.log(e)

				   }
			}); 
		}
	}) 
</script>


</head>
<body>
	<input class="btn btn-secondary calbut" type="button" value="닫기" id="calinbut"/>
  <div id='calendar'></div>
</body>

<div id="myModalSave" class="modal fade" role="dialog">

</div>



</html>