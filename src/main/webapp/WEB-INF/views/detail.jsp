<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="layout/header.jsp"%>
<main>
	<div class="container">
		<br /> <br />
		<h1>상세보기</h1>
		<hr />
		<div class="form-group">
			<label for="title">제목</label> 
			<input type="text" class="form-control" id="title" name="title" value="${board.title}"/>
		</div>
		<div id="editor" style="height: 400px;">${board.content}</div>
		<br>
		<div style="text-align: center">
			<button type="button" class="btn btn-warning" onClick="updateBoard(${board.id})">수정</button>
			<button type="button" class="btn btn-danger" onClick="deleteBoard(${board.id})">삭제</button>
		</div>
	</div>
</main>

<script>

	var quill = new Quill('#editor', {
		theme : 'snow'
	});


	function updateBoard(id){
		let title_el = document.querySelector("#title");
		let content = document.querySelector("#editor").innerText;

		let title = title_el.value;
		console.log("id : ",id);
		console.log("title : ",title);
		console.log("content : ",content);

		let board = {
			title : title,
			content : content
		};


		fetch("/board/"+id,{
			method:"put",
			headers :{
				'Content-Type' : 'application/json; charset=utf-8',		
			},
			body: JSON.stringify(board),
		}).then(res=>res.text())
		.then(res=>{
			if(res=="ok"){
				alert("수정완료");
				location.reload();
			}
			else{
				alert("수정실패");
			}
		});
	}


	function deleteBoard(id){
	fetch("/board/"+id, {
			method:"delete",
	}).then(res=> res.text())
	   .then(res=>{
			if(res=="ok"){
				alert("삭제성공");
				location.href="/list";
			}else{
				alert("삭제실패");
				}
	   });
	}

</script>

<%@include file="layout/footer.jsp"%>