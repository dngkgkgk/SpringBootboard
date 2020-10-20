<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp"%>

<div class="container">
	<main>
		<br /><br />
		<h1>게시글목록</h1>
		<hr />
		<table class="table table-striped">
			<tr>
				<td>ID</td>
				<td>TITLE</td>
				<td>READCOUNT</td>
				<td>CREATEDATE</td>
			</tr>
			<c:forEach var="boards" items="${boards.content}">
				<tr>
					<td>${boards.id}</td>
					<td><a href="/board/${boards.id}">${boards.title}</a></td>
					<td>${boards.readCount}</td>
					<td>${boards.createDate}</td>
				</tr>
			</c:forEach>
		</table>
		<div style="text-align: center">
			<ul class="pagination">
				<c:choose>
					<c:when test="${boards.first}">
						<li class="page-item disabled">
							<a class="page-link" href="/list?page=${boards.pageable.pageNumber-1}">Previous</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="/list?page=${boards.pageable.pageNumber-1}">Previous</a>
						</li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${boards.last}">
						<li class="page-item disabled">
							<a class="page-link" href="/list?page=${boards.pageable.pageNumber+1}">Next</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item">
							<a class="page-link" href="/list?page=${boards.pageable.pageNumber+1}">Next</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</main>
</div>

<%@include file="layout/footer.jsp"%>