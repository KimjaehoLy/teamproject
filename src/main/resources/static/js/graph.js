/**
 * 
 */

$(document).ready(function(){	
	$('#tts').change(function(){
			
			var year;
			if($('#tts').val()=='2018.01.01-2018.12.31'){
				year = 2018;			
			}else if($('#tts').val()=='2019.01.01-2019.12.31'){
				year = 2019;
			}else if($('#tts').val()=='2020.01.01-2020.12.31'){
				year = 2020;
			}
			$.ajax({
				url:"/ajax/eview/information/graphdata",
				type:'GET',
				dataType:'json',
				data : {
					year:year,
					},
				success : function(data){
				var monthtot = [];
				var totprice1 = data[12].totprice1;
				var totprice2 = data[13].totprice2;
				var totprice3 = data[14].totprice3;
				var pdname1 = [];
				var cnt1 = [];
				var pdname2 = [];
				var cnt2 = [];
				var pdname3 = [];
				var cnt3 = [];
				
				for(var i in data){
					console.log(data[i]);
				}
				for (var i in data){
					monthtot[i] = data[i].monthtot;
				}
				for (var i in data){
					pdname1[i] = data[i].pdname1;
				}
				for (var i in data){
					cnt1[i] = data[i].cnt1;
				}
				for (var i in data){
					pdname2[i] = data[i].pdname2;
				}
				for (var i in data){
					cnt2[i] = data[i].cnt2;
				}
				for (var i in data){
					pdname3[i] = data[i].pdname3;
				}
				for (var i in data){
					cnt3[i] = data[i].cnt3;
				}
				
				var v1 = [[pdname1[15],cnt1[15]], [pdname1[16],cnt1[16]], 
						[pdname1[17],cnt1[17]], [pdname1[18],cnt1[18]], 
						[pdname1[19], cnt1[19]]];	
									
				var v2 = [[pdname2[31],cnt2[31]], [pdname2[32],cnt2[32]], 
						[pdname2[33],cnt2[33]], [pdname2[34],cnt2[34]], 
						[pdname2[35], cnt2[35]]];			
				console.log(pdname1)			
				console.log(pdname2)			
				console.log(pdname3)			
				var v3 = [[pdname3[44],cnt3[44]], [pdname3[45],cnt3[45]], 
						[pdname3[46],cnt3[46]], [pdname3[47],cnt3[47]], 
						[pdname3[48], cnt3[48]]];		
						
				var v4 = [['1월', monthtot[0]], ['2월',  monthtot[1]], ['3월',  monthtot[2]], ['4월',  monthtot[3]],
							['5월',  monthtot[4]], ['6월',  monthtot[5]], ['7월',  monthtot[6]], ['8월',  monthtot[7]],
							['9월',  monthtot[8]], ['10월',  monthtot[9]], ['11월',  monthtot[10]], ['12월',  monthtot[11]]]	
							
				var v5 = [totprice1,totprice2,totprice3]
				plot1 = $.jqplot('gpin1', [[[]]], {});
				plot2 = $.jqplot('gpin2', [[[]]], {});
				plot3 = $.jqplot('gpin3', [[[]]], {});
			
					
				if($('#tts').val()=='2018.01.01-2018.12.31'){						
						 
					plot1.destroy();
			         $.jqplot('gpin1', [v5], {
						grid: {
			            drawBorder: true, 
			            drawGridlines: false,
			            background: '#FAECDC',
			            shadow:true
				        },
					      title: '연도별 기업성장률 비교(총 판매액)', 		/*제목*/
						  animate: !$.jqplot.use_excanvas,
						  seriesColors:['#E8D9FF'],
					      seriesDefaults: { 		        
					        pointLabels: { show:true } 
							
					      },
						  axes: {
							xaxis: {
								renderer: $.jqplot.CategoryAxisRenderer,
								ticks: ['2018','2019','2020']
							}
						}
				  		}); 
						/*----------------plot2------------- */
						plot2.destroy();
						$.jqplot('gpin2', [v1], {
					        grid: {
					            drawBorder: true, 
					            drawGridlines: false,
					            background: '#FAECDC',
					            shadow:true
					        },
							title:'원두 유통량 비교',
							animate: !$.jqplot.use_excanvas,
					        
					        seriesDefaults:{
					            renderer:$.jqplot.PieRenderer,
								seriesColors:['#FFC19E', '#CEF279', '#B2CCFF', '#D5D5D5','#FFB2D9'],
					            rendererOptions: {
									padding: 5,
					                showDataLabels: true
					            }
					        },
					        legend: {
					            show: true,
					            rendererOptions: {
					                numberRows: 2
				
					            },
					            location: 's'
					        }
					    });
						plot3.destroy();
						$.jqplot('gpin3', [v4], {
							grid: {
					            drawBorder: true, 
					            drawGridlines: false,
					            background: '#FAECDC',
					            shadow:true
				        	},
						    title: '월별 매출 비교',
							animate: !$.jqplot.use_excanvas, /*애니메이션 실행부분*/
						    series:[{
							seriesColors:['#FFC19E', '#CEF279', '#B2CCFF', '#D5D5D5'],
							renderer:$.jqplot.BarRenderer,
							rendererOptions: {
					                varyBarColor: true,
					 				barWidth:20
					            },
							pointLabels:{
								formatter:$.jqplot.DefaultTickFormatter,
								formatString:'%s원', /* 바 위에 뜨는 것~! */
								show:true,
								
									location:'w',
									xpadding:-55,
									ypadding:-10
							}
							}],
						      axes: {
						        xaxis: {
						          renderer: $.jqplot.CategoryAxisRenderer,
								  label:'2018년'
						          
						        },
						        yaxis: {
						        }
						      }
					
						    }); 			
					
				}
				if($('#tts').val()=='2019.01.01-2019.12.31'){						
						plot1.destroy();
				         $.jqplot('gpin1', [v5], {
							grid: {
				            drawBorder: true, 
				            drawGridlines: false,
				            background: '#FAECDC',
				            shadow:true
					        },
						      title: '연도별 기업성장률 비교(총 판매액)', 		/*제목*/
							  animate: !$.jqplot.use_excanvas,
							  seriesColors:['#E8D9FF'],
						      seriesDefaults: { 		        
						        pointLabels: { show:true } 
								
						      },
							  axes: {
								xaxis: {
									renderer: $.jqplot.CategoryAxisRenderer,
									ticks: ['2018','2019','2020']
								}
							}
					  		}); 
						/*----------------plot2------------- */
						plot2.destroy();
						$.jqplot('gpin2', [v2], {
					        grid: {
					            drawBorder: true, 
					            drawGridlines: false,
					            background: '#FAECDC',
					            shadow:true
					        },
							title:'원두 유통량 비교',
							animate: !$.jqplot.use_excanvas,
					        
					        seriesDefaults:{
					            renderer:$.jqplot.PieRenderer,
								seriesColors:['#FFC19E', '#CEF279', '#B2CCFF', '#D5D5D5','#FFB2D9'],
					            rendererOptions: {
									padding: 5,
					                showDataLabels: true
					            }
					        },
					        legend: {
					            show: true,
					            rendererOptions: {
					                numberRows: 2
				
					            },
					            location: 's'
					        }
					    });
						plot3.destroy();
						$.jqplot('gpin3', [v4], {
							grid: {
					            drawBorder: true, 
					            drawGridlines: false,
					            background: '#FAECDC',
					            shadow:true
				        	},
						    title: '월별 매출 비교',
							animate: !$.jqplot.use_excanvas, /*애니메이션 실행부분*/
						    series:[{
							seriesColors:['#FFC19E', '#CEF279', '#B2CCFF', '#D5D5D5'],
							renderer:$.jqplot.BarRenderer,
							rendererOptions: {
					                varyBarColor: true,
					 				barWidth:20
					            },
							pointLabels:{
								formatter:$.jqplot.DefaultTickFormatter,
								formatString:'%s원', /* 바 위에 뜨는 것~! */
								show:true,
								
									location:'w',
									xpadding:-55,
									ypadding:-10
							}
							}],
						      axes: {
						        xaxis: {
						          renderer: $.jqplot.CategoryAxisRenderer,
								  label:'2019년'
						          
						        },
						        yaxis: {
						        }
						      }
					
						    }); 			
					
				}
				if($('#tts').val()=='2020.01.01-2020.12.31'){						
						plot1.destroy();
			         $.jqplot('gpin1', [v5], {
						grid: {
			            drawBorder: true, 
			            drawGridlines: false,
			            background: '#FAECDC',
			            shadow:true
				        },
					      title: '연도별 기업성장률 비교(총 판매액)', 		/*제목*/
						  animate: !$.jqplot.use_excanvas,
						  seriesColors:['#E8D9FF'],
					      seriesDefaults: { 		        
					        pointLabels: { show:true } 
							
					      },
						  axes: {
							xaxis: {
								renderer: $.jqplot.CategoryAxisRenderer,
								ticks: ['2018','2019','2020']
							}
						}
				  		}); 
						/*----------------plot2------------- */
						plot2.destroy();
						$.jqplot('gpin2', [v3], {
					        grid: {
					            drawBorder: true, 
					            drawGridlines: false,
					            background: '#FAECDC',
					            shadow:true
					        },
							title:'원두 유통량 비교',
							animate: !$.jqplot.use_excanvas,
					        
					        seriesDefaults:{
					            renderer:$.jqplot.PieRenderer,
								seriesColors:['#FFC19E', '#CEF279', '#B2CCFF', '#D5D5D5','#FFB2D9'],
					            rendererOptions: {
									padding: 5,
					                showDataLabels: true
					            }
					        },
					        legend: {
					            show: true,
					            rendererOptions: {
					                numberRows: 2
				
					            },
					            location: 's'
					        }
					    });
						plot3.destroy();
						$.jqplot('gpin3', [v4], {
							grid: {
					            drawBorder: true, 
					            drawGridlines: false,
					            background: '#FAECDC',
					            shadow:true
				        	},
						    title: '월별 매출 비교',
							animate: !$.jqplot.use_excanvas, /*애니메이션 실행부분*/
						    series:[{
							seriesColors:['#FFC19E', '#CEF279', '#B2CCFF', '#D5D5D5'],
							renderer:$.jqplot.BarRenderer,
							rendererOptions: {
					                varyBarColor: true,
					 				barWidth:20
					            },
							pointLabels:{
								formatter:$.jqplot.DefaultTickFormatter,
								formatString:'%s원', /* 바 위에 뜨는 것~! */
								show:true,
								
									location:'w',
									xpadding:-55,
									ypadding:-10
							}
							}],
						      axes: {
						        xaxis: {
						          renderer: $.jqplot.CategoryAxisRenderer,
								  label:'2020년'
						          
						        },
						        yaxis: {
						        }
						      }
					
						    }); 			
					
				}
				
					
			},
			error:function(e){
				alert(e.responseText)
			}
		})
	})

	

})