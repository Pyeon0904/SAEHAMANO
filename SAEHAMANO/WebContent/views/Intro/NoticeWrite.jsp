<!--210415 22:48 김예원 (최종수정자) -->

<!-- 공지사항 게시글 작성 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp" %>
<style>
/*아리따부리 폰트*/
@font-face {
    font-family: 'Arita-buri-SemiBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Arita-buri-SemiBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
/*상세페이지 타이틀 백그라운드 이미지*/
		.topBackgroundImg {
		width:0px auto;
		height:220px;
		margin-top: 200px;
	}
/* 게시글 작성 전체 영역*/	
	div#NoticeWriteContainer
	{
		width:600px;
		margin:0 auto;
		text-align:center;
		font-family: 'Arita-buri-SemiBold';
		border:1px solid lightgrey;
    	border-radius:15px;
    	padding: 30px 30px 50px 30px;
	}
	
/*공지사항 작성 타이틀 스타일*/
	div#NoticeWriteContainer h2
	{
		font-family: 'Arita-buri-SemiBold';
		margin:10px 0;
		padding-bottom: 10px;
	}
/*영역 지정 */
	table#tbl-noticeWrite
	{
		width:600px;
		border:1px solid lightgrey;
		border-radius:15px;
		border-collapse:collapse;
	}
/*테이블 th (제목) 스타일*/
	table#tbl-noticeWrite th
	{
		width:125px;
		padding:5px 0;
		text-align:center;
		border:1px solid lightgrey;
	}
	
/*테이블 td (열) 스타일*/
	table#tbl-noticeboard td
	{
		border:1px solid;
		padding:5px 0 5px 10px;
		text-align:left;
		border:1px solid lightgrey;
	}
	
	/*내용 작성 박스 스타일 지정*/
	.notice-content {
		width:500px;
		border : 1px solid lightgrey;
		resize : none;
		font-family: 'Arita-buri-SemiBold';
		outline-style : none;
	}
	
	/*텍스트 박스 '제목' 스타일 지정*/
	.notice-title {
		width: 500px; height: 30px;
		border: 1px solid lightgrey;
		font-family: 'Arita-buri-SemiBold';
		outline-style : none;
	}
	
	/*텍스트 박스 '작성자' 크기 조정*/
	.notice-writer {
		width: 500px; 	height:30px;
		border: 1px solid lightgrey;
		font-family: 'Arita-buri-SemiBold';
		outline-style : none;
		
	}
	/*리셋버튼 스타일*/	
	.btn-reset {
		width:50px; height:25px;
		background-color : white;
		border: 1px solid lightgrey;
		font-family: 'Arita-buri-SemiBold';
	}
	
	/*등록버튼 스타일*/
	.btn-submit {
		width:50px; height:25px;
		background-color : white;
		border: 1px solid lightgrey;
		font-family: 'Arita-buri-SemiBold';
	}
	
	/*마우스올렸을 때 강조 (제목/작성자/버튼)*/
	input:hover {
		background-color:honeydew;
	}
	
</style>
<section id="content">
	<img class="topBackgroundImg" src="<%= request.getContextPath() %>/resources/images/detailbggreen.png"/>
	
	<div id='NoticeWriteContainer'>
		<h2>공지사항 작성</h2>
		<form action="<%= request.getContextPath() %>/Intro/NoticeWrite" method="POST" enctype="multipart/form-data">
			<table id='tbl-noticeWrite'>
				<tr>
					<th>제목</th>
					<td><input type="text" name="notice-title" class="notice-title"></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><input type="text" name="writer" class="notice-writer" value="작성자"  readonly></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea name="notice-content" class="notice-content" cols="50" rows="15" ></textarea></td>
				</tr>
				<tr>
					<th colspan="2">
						<input type="reset"  class="btn-reset" value="취소">
						<input type="submit" class="btn-submit" value="등록">
					</th>
				</tr>
			</table>
		</form>
	</div>
</section>

<!-- <%@ include file="/views/common/footer.jsp" %> -->
