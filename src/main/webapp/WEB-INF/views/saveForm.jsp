<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="layout/header.jsp"%>
<main>
	<div class="container">
	<br/><br/>
		<h1>글쓰기 페이지</h1>
		<hr />
		<div class="form-group">
			<label for="title">제목</label> 
			<input type="text" class="form-control" id="title" name="title"/>
		</div>
		<div id="editor" style="height: 400px;"></div>
		<br>
		<button type="button" class="btn btn-primary"onClick="save()">글쓰기완료</button>
	</div>
</main>
<script>

	var toolbarOptions = [
		['bold', 'italic', 'underline', 'strike'],        // toggled buttons
		['blockquote', 'code-block'],

		[{ 'header': 1 }, { 'header': 2 }],               // custom button values
	    [{ 'list': 'ordered'}, { 'list': 'bullet' }],
	    [{ 'script': 'sub'}, { 'script': 'super' }],      // superscript/subscript
	    [{ 'indent': '-1'}, { 'indent': '+1' }],          // outdent/indent
	    [{ 'direction': 'rtl' }],                         // text direction

	    [{ 'size': ['small', false, 'large', 'huge'] }],  // custom dropdown
	    [{ 'header': [1, 2, 3, 4, 5, 6, false] }],

	    [{ 'color': [] }, { 'background': [] }],          // dropdown with defaults from theme
	    [{ 'font': [] }],
	    [{ 'align': [] }],
	    ['image'],

	    ['clean']                                         // remove formatting button
	];
	var quill = new Quill('#editor', {
		modules: {
		    toolbar: toolbarOptions
		},
		theme : 'snow',
		placeholder : "글 내용을 입력해주세요."
	});

	function save() {

		let title = document.querySelector("#title").value;
		let content = document.querySelector("#editor .ql-editor").innerHTML;

		let board = {
			title : title,
			content : content
		};

		fetch("/save" ,{
			method:"post",
			headers :{
				'Content-Type' : 'application/json; charset=utf-8',		
			},
			body: JSON.stringify(board),
		}).then(res=>res.text())
		.then(res=>{
			if(res=="ok"){
				alert("글쓰기완료");
				location.href = "/list";
			}
			else{
				alert("글쓰기실패");
			}
		});

		
	}
</script>
<%@include file="layout/footer.jsp"%>