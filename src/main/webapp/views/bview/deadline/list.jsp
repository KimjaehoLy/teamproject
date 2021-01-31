<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$(".bb").click(function() {
							$(".inform1").toggleClass("off");
							$(".inform2").addClass("off");
						});
						$(".mod").click(function() {
							$(".inform2").toggleClass("off");
							$(".inform1").addClass("off");
						});
						$('.del')
								.click(
										function() {
											var radioVal = $(
													'input[name="chkBox"]:checked')
													.val()
											location.href = "/template/bview/deadline/deleteReg?order_num4="
													+ radioVal
										});
						$(".mod").click(function() {
							var rowData = new Array();
							var tdArr = new Array();
							var radio = $('input[name="chkBox"]:checked')

							radio.each(function(i) {

								var tr = radio.parent().parent().eq(i);
								var td = tr.children();

								rowData.push(tr.text());

								var no = td.eq(1).text()
								var userid = td.eq(3).text()
								var name = td.eq(4).text()
								var email = td.eq(5).text()
								var one = td.eq(6).text()
								var two = td.eq(7).text()
								var three = td.eq(7).text()
								var four = td.eq(8).text()
								$("#onum").val(no)
								$("#cus").val(userid)
								$("#ek").val(name)
								$("#tx").val(email)
								$("#cht").val(one)
								$("#bn").val(two)
								$("#lead").val(three)
								$("#cont").val(four)
							});
						});

						$(".chks1").click(function() {
							var chk1 = $(".oo1").val()
							var chk2 = $(".cc1").val()

							$.ajax({
								type : "GET",
								url : "/ajax/eview/marketing/chkData4",
								data : {
									order_num4 : chk1,
									crre_name : chk2
								},
								dataType : "json",
								success : function(data) {
									if (chk1.length != 10) {
										alert("주문번호가 형식에 맞지 않습니다.")
									} else if (data == 2) {
										alert("존재하는 주문번호입니다.")
										$(".oo1").focus()
									} else if (data == 1) {
										if ($(".ll1").val() == "") {
											alert("담당자를 입력해주세요.");
											$(".ll1").focus();
											return false;
										} else if($(".bln1").val()==""){
											alert("계산서번호를 입력해주세요.");
											$(".bln1").focus();
											return false;
											}
										insertT.submit()
									} else if (data == 3) {
										alert("존재하지 않는 고객입니다.")
										$(".cc1").focus()
									} else {
										alert("주문번호와 고객을 확인해주세요.")
										$(".oo1").focus()
									}
								},
								error : function(e) {
									alert(e.responseText)
								}
							})
						})

						$(".chks2").click(function() {
							var chk1 = null
							var chk2 = $(".cc2").val()
							$.ajax({
								type : "GET",
								url : "/ajax/eview/marketing/chkData4",
								data : {
									order_num4 : chk1,
									crre_name : chk2
								},
								dataType : "json",
								success : function(data) {
									if (data == 1) {
										if ($(".ll2").val() == "") {
											alert("담당자를 입력해주세요.");
											$(".ll2").focus();
											return false;
										} else if($(".bln2").val()==""){
											alert("계산서번호를 입력해주세요.");
											$(".bln2").focus();
											return false;
											}
										updateT.submit()
									} else if (data == 3) {
										alert("존재하지 않는 고객입니다.")
										$(".cc2").focus()
									}
								},
								error : function(e) {
									alert(e.responseText)
								}
							})
						})
						
					})
</script>
<h2>영업관리</h2>
<hr />
<div class="FFFF">
	<form action="/template/bview/deadline/search">
		<div class="col-lg-14 input-group mb-3">
			마감번호&nbsp;<input type="text" class="form-control" name="order_num4" /> <input
				type="submit" class="btn btn-outline-info" value="조회" />
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			고객&nbsp;<input type="text" class="form-control" name="customer" /><input
				type="submit" class="btn btn-outline-info" value="조회" />
		</div>
	</form>
</div>
<div class="bottom">
	<table class="table">
		<thead class="table-primary">
			<tr>
				<th scope="col" width="1%"></th>
				<th scope="col" width="15%">마감번호</th>
				<th scope="col" width="11%">마감일자</th>
				<th scope="col" width="9%">고객</th>
				<th scope="col" width="10%">마감구분</th>
				<th scope="col" width="10%">과세구분</th>
				<th scope="col" width="8%">전표</th>
				<th scope="col" width="10%">계산서번호</th>
				<th scope="col" width="9%">담당자</th>
				<th scope="col" width="15%">비고</th>
			</tr>
		</thead>
		<c:forEach items="${data }" var="vo">
			<tr>
				<td><input type="radio" name="chkBox" value="${vo.order_num4 }" /></td>
				<td>${vo.order_num4 }</td>
				<td>${vo.regdate }</td>
				<td>${vo.customer }</td>
				<td>${vo.end_kind }</td>
				<td>${vo.tex }</td>
				<td>${vo.chit }</td>
				<td>${vo.bill_num }</td>
				<td>${vo.leader }</td>
				<td>${vo.content }</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="10"><div class="PPPP">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<c:if test="${startPage>1 }">
							<li class="page-item"><a class="page-link"
								href="?nowPage=${startPage-1 }" aria-label="Previous"> <span
									aria-hidden="true">&laquo;</span>
							</a></li>
						</c:if>
						<c:forEach begin="${startPage }" end="${endPage }" step="1"
							var="i">
							<c:choose>
								<c:when test="${nowPage==i }">
									<li class="page-item active"><a class="page-link ">${i }</a></li>
								</c:when>
								<c:otherwise>
									<li class="page-item"><a class="page-link"
										href="?nowPage=${i }">${i }</a></li>
								</c:otherwise>
							</c:choose>
						</c:forEach>
						<c:if test="${endPage<lastPage }">
							<li class="page-item"><a class="page-link"
								href="?nowPage=${endPage+1 }" aria-label="Next"> <span
									aria-hidden="true">&raquo;</span>
							</a></li>
						</c:if>
					</ul>
				</nav></div>
			</td>
		</tr>
	</table>
</div>
<div class="input-group mb-3">
	<input class="btn btn-outline-info btn_1 bb" type="button" value="등록" />
	<input class="btn btn-outline-info btn_1 mod" type="button" value="수정" />
	<input class="btn btn-outline-info btn_1 del" type="button" value="삭제" />
</div>
<div class="inform1">
	<form class="input-group mb-3 lst" action="inputReg" name="insertT">
		<div class="col-lg-2">
			마감번호 <input type="text" class="form-control oo1" name="order_num4" placeholder="ex) 2020CC0000"/>
		</div>
		<div class="col-lg-1">
			고객 <input type="text" class="form-control cc1" name="customer" placeholder="ex) 이디야"/>
		</div>
		<div class="col-lg-1">
			마감구분 <input type="text" class="form-control" name="end_kind" />
		</div>
		<div class="col-lg-1">
			과세구분 <input type="text" class="form-control" name="tex" />
		</div>
		<div class="col-lg-1">
			전표 <input type="text" class="form-control" name="chit" />
		</div>
		<div class="col-lg-2">
			계산서번호 <input type="number" class="form-control bln1" name="bill_num" placeholder="ex) 00000"/>
		</div>
		<div class="col-lg-1">
			담당자 <input type="text" class="form-control ll1" name="leader" placeholder="ex) 김찬범"/>
		</div>
		<div class="col-lg-3">
			비고 <input type="text" class="form-control" name="content" />
		</div>
		<div class="col-lg-2">
			<input type="button" class="btn btn-outline-info btn_1 chks1" value="등록" />
			<input type="reset" class="btn btn-outline-info btn_1" value="초기화" />
		</div>
	</form>
</div>
<div class="inform2 off">
	<form class="input-group mb-3 lst" action="updateReg" name=updateT>
		<div class="col-lg-2">
			수정번호 <input type="text" class="form-control" name="order_num4"
				id="onum" readonly />
		</div>
		<div class="col-lg-1">
			고객 <input type="text" class="form-control cc2" name="customer" id="cus" placeholder="ex) 이디야"/>
		</div>
		<div class="col-lg-1">
			마감구분 <input type="text" class="form-control" name="end_kind" id="ek" />
		</div>
		<div class="col-lg-1">
			과세구분 <input type="text" class="form-control" name="tex" id="tx" />
		</div>
		<div class="col-lg-1">
			전표 <input type="text" class="form-control" name="chit" id="cht" />
		</div>
		<div class="col-lg-2">
			계산서번호 <input type="number" class="form-control bln2" name="bill_num" id="bn" placeholder="ex) 00000"/>
		</div>
		<div class="col-lg-1">
			담당자 <input type="text" class="form-control ll2" name="leader" id="lead" placeholder="ex) 김찬범"/>
		</div>
		<div class="col-lg-3">
			비고 <input type="text" class="form-control" name="content" id="cont" />
		</div>
		<div class="col-lg-2">
			<input type="button" class="btn btn-outline-info btn_1 chks2" value="수정" />
			<input type="reset" class="btn btn-outline-info btn_1" value="초기화" />
		</div>
	</form>
</div>