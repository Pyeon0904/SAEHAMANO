<!-- 프론트 & 백 통합 -->
<%@page import="mvc.Intro.model.vo.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/headerDetail.jsp"%>


<%
	Notice notice = (Notice)request.getAttribute("notice");
%>
<style>
@font-face {
    font-family: 'GmarketSansLight';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

#box{ 
   background-color:#948c84;
   width:100%;
   height: 800px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
   margin-top:330px;
   margin-bottom:100px;
   margin-left:-10px;
   padding:10px;
}

/*컨텐츠 영역*/
   #conbox{
      width:100%; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/
       position:relative; 
       top:20px;
       margin:0 auto;
      font-family: 'GmarketSansLight';
   }
  
/* view 전체 영역*/
div#NoticeViewContainer {
	width: 0 auto;
	margin: 0 auto;
	text-align: center;
}

/*게시글 view 박스 스타일 */
table#tbl-noticeView {
	width: 700px;
	height:0 auto;
	border-collapse: collapse;
	margin:0 auto;
	font-size:13pt;
}

/*테이블 th (제목) 스타일*/
table#tbl-noticeView th {
	width: 120px;
	padding: 5px 0;
	text-align: center;
	border-bottom: 1px solid #2a1b0a;;
	color:#2a1b0a;
}

/*테이블 td (열) 스타일*/
table#tbl-noticeView td {
	padding: 10px 5px;
	text-align: left;
	border-bottom: 1px solid #2a1b0a;;	
}

/*본문 영역*/
.nt-content {
	height: 300px;
	overflow:auto;
	padding-left : 25px;
}

/*버튼 영역 크기&위치 지정*/
#btn-list {
width:700px;
margin: 0 auto;
text-align:right;
}

 /*버튼 스타일 지정*/
    .btn-list button {
    	width: 70px;	height: 25px;
		background: none;
   		border:1px solid #2a1b0a;
   		border-radius:3px;
   		font-weight : bold;
   		margin: 10px 2px;
  		color : #2a1b0a;
   		text-align:center;
  }
        
    /*공지사항 타이틀 스타일*/    
    div#NoticeViewContainer span{
	    font-size:25pt;
		margin-bottom:  50px;
		display:block;
		color:wheat;
    }
    
</style>


<div id="box">
<section id="content">
<div id="conbox">
	<div id='NoticeViewContainer'>
		<span>공지사항</span>
		<form action="<%= request.getContextPath() %>/board/write" method="POST" enctype="multipart/form-data">	
			<table id='tbl-noticeView'>
					<tr>
						<th>제 목</th>
						<td colspan="5"><%= notice.getNotice_name() %></td>
					</tr>
					<tr>
						<th>글번호</th>
						<td><%= notice.getRowNum() %></td>
						<th>작성자</th>
						<td><%= notice.getNotice_writer() %></td>
						<th>조회수</th>
						<td><%= notice.getNotice_views() %></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td colspan="5">첨부파일 영역 </td>
					</tr>
					<tr>
					<!-- 내용 -->
					<td colspan="6">
						<div class="nt-content">
							<%= notice.getNotice_content() %>
							
						</div>
					</td>
				</tr>
				</table>
			</div>
			
					<div id="btn-list">
						<div class="btn-list">
						<button type="button" onclick="location.href='<%= request.getContextPath() %>/Intro/NoticeBoard'" >목록으로</button>
						</div>
					</div>
		</form>
	</div>
</section>
</div>

<%@ include file="/views/common/footer.jsp" %>
