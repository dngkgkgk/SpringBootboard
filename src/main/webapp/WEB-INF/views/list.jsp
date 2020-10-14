<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp"%>
<div class="container">
	<main>
	<br/><br/>
		<h1>게시글목록</h1>
		<hr />
		<table class="table table-striped">
			<tr>
				<td>ID</td>
				<td>TITLE</td>
				<td>CONTENT</td>
				<td>READCOUNT</td>
				<td>CREATEDATE</td>
			</tr>
			<c:forEach var="boards" items="${boards}">
				<tr>
					<td>${boards.id}</td>
					<td><a href="/board/${boards.id}">${boards.title}</a></td>
					<td>${boards.content}</td>
					<td>${boards.readCount}</td>
					<td>${boards.createDate}</td>
				</tr>
			</c:forEach>
		</table>
	</main>
</div>
<%@include file="layout/footer.jsp"%>