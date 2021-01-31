<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<h2>영업관리</h2>
<hr />
<div class="FFFF">
	<form action="/template/bview/processing/search">
		<div class="col-lg-14 input-group mb-3">
			의뢰번호&nbsp;<input type="text" class="form-control" name="o2" /> <input
				type="submit" class="btn btn-outline-info" value="조회" />
		&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
			고객&nbsp;<input type="text" class="form-control" name="customer" /><input
				type="submit" class="btn btn-outline-info" value="조회" /> <input
				type="button" onclick="location.href='listF'" class="btn btn-outline-info" value="예외" />
		</div>
	</form>
</div>
<div class="bottom inform">
	<table class="table">
		<thead class="table-primary">
			<tr>
				<th scope="col" width="15%">의뢰번호</th>
				<th scope="col" width="11%">의뢰일자</th>
				<th scope="col" width="10%">고객</th>
				<th scope="col" width="10%">담당자</th>
				<th scope="col" width="15%">상세</th>
			</tr>
		</thead>
		<c:forEach items="${data }" var="vo">
			<tr>
				<td>${vo.o2 }</td>
				<td>${vo.rd }</td>
				<td>${vo.customer }</td>
				<td>${vo.leader }</td>
				<td><a href="detail?o2=${vo.o2 }">상세</a></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="5"><div class="PPPP">
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