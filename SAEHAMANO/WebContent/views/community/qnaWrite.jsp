<!-- 210411(일) 21:03 편준장 (최종수정자) -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 글쓰기 페이지</title>
<script src="<%= request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>

<style>
	/* 상단 질문 div 영역에 대한 스타일 */
	.Qna_title_area 
	{ 
		margin : 100px;
		width: 743px;
		align: center; 
	}
	
	/* 질문 작성칸에 대한 스타일 */
	#title 
	{ 
		outline-style: solid; 
		outline-color: green;  
	}
			
	div#board-write-container
	{
		width:600px;
		margin:0 auto;
		text-align:center;
	}
	
	div#board-write-container h2
	{
		margin:10px 0;
	}
	
	table#tbl-board
	{
		width:500px;
		margin:0 auto;
		border:1px solid black;
		border-collapse:collapse; /* 단선으로 바꿈! */
	}
	
	/* 테이블 th에 대한 스타일 지정 */
	#tbl-board th
	{
		width:125px;
		border:1px solid;
		padding:5px 0;
		text-align:center;
	}
	
	/* 테이블 td에 대한 스타일 지정 */
	#tbl-board td
	{
		border:1px solid;
		padding:5px 0 5px 10px;
		text-align:left;
	}		
			
</style>

</head>
<body>
	<div class="Qna_title_area">
		<h1>Q & A (질문과 답변)</h1>
		<hr>
			<h2>질문 <input id="title" type="text" ></h2>
		
		<hr>
		
	</div>
	<select>
		<option value="후기작성">후기작성</option>
		<option value="Q & A">Q & A</option>
	</select>
			
	<table id='tbl-board'>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer" value="사용할 닉네임을 적어주세요"></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><input type="file" name="upfile"></td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea name="content" cols="50" rows="15" style="resize: none"></textarea></td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="등록">
					<input type="reset" value="취소">
				</th>
			</tr>
	</table>
		
		
	
	
</body>
</html>

<%@ include file="/views/common/footer.jsp"%>