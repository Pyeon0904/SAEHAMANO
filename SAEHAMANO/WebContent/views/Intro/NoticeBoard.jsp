<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="mvc.Intro.model.vo.Notice"%>
<%@page import="mvc.common.util.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/headerDetail.jsp"%>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<%
List<Notice> list = (ArrayList) request.getAttribute("list");
PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
%>
<style>
/*하이퍼링크 스타일*/
a { text-decoration:none }
td>a:link { color:white; } /*방문안한 페이지 글자색*/
td>a:visited { color:wheat; } /*방문한 페이지 글자색*/
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
   background-color:#2a1b0a;
   width:100%;
   height: 800px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
   margin-top:330px;
   margin-bottom:100px;
   margin-left:-10px;
   padding:10px;
   color:white;
}
/*컨텐츠 영역*/
   #conbox{
       width:100%; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/
       position:relative; 
       top:20px;
       margin:0 auto;
      font-family: 'GmarketSansLight';
   }
   
  
/* 전체 세션 영역 크기&스타일 지정*/
#content {
	width: 0 auto ; height: 0 auto; 	margin:0 auto;	font-family: 'Arita-buri-SemiBold';
}
/* 게시판 영역 크기 지정*/
#board-containers {
	width: 0 auto;
}
/*공지사항 글자 스타일*/
div#board-containers h1 {
	font-size:25pt;
	margin-bottom:  50px;
}
/*테이블 크기 지정*/
table#tbl-board {
	width: 1200px;
	margin: 0 auto;
	border-collapse: collapse; /* 테두리 셀 사이 간격*/
	clear: both;
}
/*th, td 테두리 및 텍스트 위치 설정*/
table#tbl-board th, table#tbl-board td {
	border-bottom: 1px solid wheat;
	padding: 13px 0;
	text-align: center;
}
/*테이블 제목 스타일 지정*/
#tbl-board th{
	background:wheat;
	color: #2a1b0a;
	font-size:13.5pt;
}

/*페이지바*/
div#pageBar {
	margin-top: 20px;
	text-align: center;
}
/*페이지바 버튼 스타일 지정*/
#pageBar button {
	font-size: 15px;
	width: 25px; height: 25px;
	margin: 0px 3px;
	background:none;
	border : none;
	color:white;
}
/*번호 선택 스타일*/
#pageBar button:disabled{
	border-bottom:2px solid wheat;
	color:wheat;
}
/*제목 부분 크기*/
#t1 {width:400px;}
</style>

<script>
	$(".tbl-board").attr("style","word-break:break-all");
</script>

<div id="box">
<section id="content">
	<div id="conbox">
	<div id="board-containers">
		<h1 align="center">공지사항</h1>

			
			<table id="tbl-board">
				<tr>
					<th>글번호</th>
					<th id="t1" >제목</th>
					<th>첨부파일</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
				<%
				if(list.isEmpty()) {
				%>
				<tr>
					<td colspan="6">조회된 게시글이 없습니다.</td>
				</tr>
				<%
				} else {
				for(Notice notice : list) {
				%>
				<tr>
					<td><%=notice.getRowNum()%></td>
					<td>
					<a href="<%=request.getContextPath()%>/Intro/NoticeView?noticeNo=<%=notice.getNotice_code()%>">
						<%=notice.getNotice_name()%>
					</a>
					</td>
					<td>
	                  <%
	                  if(notice.getOriginal_filename() != null && !notice.getOriginal_filename().equals("null")) {
	                  %>
	                  <img src="<%= request.getContextPath() %>/resources/images/filedown.png" width="20" height="20"/> 
	                  <% } else { %> 
	                     <span> - </span> 
	                  <%
	                      }
	                  %>
               		</td>
					<td>관리자</td>
					<td><%=notice.getWrite_date()%></td>
					<td><%=notice.getNotice_views()%></td>
				</tr>
				<%
					}
				}
				%>
			</table>
				<div id="pageBar">
					<!-- 맨 처음으로 -->
					<button
						onclick="location.href='<%=request.getContextPath()%>/Intro/NoticeBoard?page=1'">&lt;&lt;</button>
	
					<!-- 이전 페이지로 -->
					<button
						onclick="location.href='<%=request.getContextPath()%>/Intro/NoticeBoard?page=<%=pageInfo.getPrvePage()%>'">&lt;</button>
	
					<!--  10개 페이지 목록 -->
	
					<%
					for (int p = pageInfo.getStartPage(); p <= pageInfo.getEndPage(); p++) {
					%>
					<%
					if (p == pageInfo.getCurrentPage()) {
					%>
					<button disabled><%=p%></button>
					<%
					} else {
					%>
					<button
						onclick="location.href='<%=request.getContextPath()%>/Intro/NoticeBoard?page=<%=p%>'"><%=p%></button>
					<%
					}
					%>
					<%
					}
					%>
	
					<!-- 다음 페이지로 -->
					<button
						onclick="location.href='<%=request.getContextPath()%>/Intro/NoticeBoard?page=<%=pageInfo.getNextPage()%>'">&gt;</button>
	
					<!-- 맨 끝으로 -->
					<button
						onclick="location.href='<%=request.getContextPath()%>/Intro/NoticeBoard?page=<%=pageInfo.getMaxPage()%>'">&gt;&gt;</button>
				</div>
			
	
		</div>
	</div>
</section>
</div>

<%@ include file="/views/common/footer.jsp" %>
