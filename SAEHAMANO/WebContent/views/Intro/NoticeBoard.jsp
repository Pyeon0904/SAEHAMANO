<!--210415 22:48 김예원 (최종수정자) -->
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="mvc.Intro.model.vo.Notice"%>
<%@page import="mvc.common.util.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/views/common/header.jsp"%>


<%
List<Notice> list = (ArrayList) request.getAttribute("list");
PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
%>
<style>
section#board-list-container {
	width: 600px;
	margin: 0 auto;
	text-align: center;
}

section#board-list-container h2 {
	margin: 10px 0;
}

table#tbl-board {
	width: 100%;
	margin: 0 auto;
	border: 1px solid white;
	border-collapse: collapse;
	clear: both;
}

table#tbl-board th, table#tbl-board td {
	border: 1px solid white;
	padding: 5px 0;
	text-align: center;
}
/*글쓰기버튼*/
input#btn-add {
	float: right;
	margin: 0 0 25px;
	align: center;
}
/*페이지바*/
div#pageBar {
	margin-top: 10px;
	text-align: center;
}

table#NoticeBoardTable {
	width: 600px;
	height: 100px;
}
;
</style>
<section id="content">
	<table id="NoticeBoardTable">
		<h2 align="center">공지사항</h2>
		<div id="board-list-container">

			<table id="tbl-board">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
				<%
				if(list.isEmpty()) {
				%>
				<tr>
					<td colspan="4">조회된 게시글이 없습니다.</td>
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
					<td><%=notice.getNotice_writer()%></td>
					<td><%=notice.getWrite_date()%></td>
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

			<button type="button" id="btn-add"
			onclick="location.href='<%=request.getContextPath()%>/Intro/NoticeWrite'">글쓰기</button>
		</div>
	</table>
</section>


<!--<%@ include file="/views/common/footer.jsp" %>-->
