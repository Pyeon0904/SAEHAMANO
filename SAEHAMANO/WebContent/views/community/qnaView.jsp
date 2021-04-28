<!-- 210428(수) 15:36 김예원 (최종수정자) -->
<!-- 최종 -->
<%@page import="mvc.community.qna.model.vo.Qna"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/views/common/headerDetail.jsp"%>

<%
	Qna qna = (Qna)request.getAttribute("qna");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 글 1개 보기</title>
<style>
/*--------------------전체 영역-----------------------------*/

/*---------------제일 바깥 영역 설정-----------------*/
#box {
	background-color: #948c84;
	width: 100%;
	height: 800px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
	margin-top: 330px;
	margin-bottom: 100px;
	margin-left: -10px;
	padding: 10px;
}
/*-------------------컨텐츠 영역---------------------*/
#conbox {
	width: 1000px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/
	position: relative;
	top: 20px;
	margin: auto;
}

/*---------------------------------------------------*/

/* 페이지 이름(Q & A 글쓰기) ----------------------- */
.pageName {
	text-align: center;
	font-family: GmarketSansLight;
	color: white;
}
/*---------------------------------------------------*/

/* view 전체 영역*/
div#QnaViewContainer {
	width: 0 auto;
	margin: 0 auto;
	text-align: center;
	font-family: GmarketSansLight;
}

/*게시글 view 박스 스타일 */
table#tbl-qnaView {
	width: 700px;
	border-collapse: collapse;
	margin: 0 auto;
}

/* 테이블 스타일-------------------------------------*/
/*테이블 th (제목) 스타일*/
table#tbl-qnaView th {
	width: 120px;
	padding: 5px 0;
	text-align: center;
	border-bottom: 1px solid black;
	color: #2a1b0a;
	font-size: 13pt;
}

/*테이블 td (열) 스타일*/
table#tbl-qnaView td {
	padding: 10px 5px;
	text-align: left;
	border-bottom: 1px solid black;
}

.nt-content {
	height: 300px;
	overflow: auto;
	padding-left: 25px;
}
/*---------------------------------------------------*/

/* 버튼 스타일---------------------------------------*/
/*버튼 영역 크기&위치 지정*/
#btn-list {
	width: 700px;
	margin: 0 auto;
	text-align: right;
}

/*버튼 스타일 지정*/
.btn-list button {
	width: 70px;
	height: 30px;
	background-color: #948c84;
   	border: 1px solid #2a1b0a;
	border-radius: 5px;
	font-weight: bold;
	margin: -2px;
	margin-bottom: 2px;
	font-family: GmarketSansLight;
}

/*버튼에 마우스 올렸을 때 동작*/
.btn-list button:hover {
	border: 3px solid wheat;
}
/*---------------------------------------------------*/
</style>

</head>
<body>
	<%
		String sort = qna.getQna_sort();
	%>
	<div id="box">
		<section id="section">
			<div id="conbox">
				<section id="content">
					<div id='QnaViewContainer'>
						<h2 class="pageName" style="margin-bottom: 40px;">Q & A 글쓰기</h2>
						<form action="<%= request.getContextPath() %>" method="POST"
							enctype="multipart/form-data">

							<table id='tbl-qnaView' style="table-layout: fixed">
								<tr>
									<th>제 목</th>
									<td colspan="3"><%=qna.getQna_name() %></td>
									<th>분류</th>
									<%
										if(sort.equals("question")){
									%>

									<td colspan="2">질문</td>
									<%} else { %>
									<td colspan="2">공지</td>
									<%} %>
								</tr>
								<tr>
									<th>글번호</th>
									<td><%= qna.getRowNum() %></td>
									<th>작성자</th>
									<td><%=qna.getQna_nickname() %></td>
									<th>조회수</th>
									<td><%=qna.getQna_views() %></td>
								</tr>
								<tr>
									<!-- 내용 -->
									<td colspan="7">
										<div class="nt-content">
											<%=qna.getQna_content() %>
										</div>
									</td>
								</tr>
							</table>
					</div>

					<!-- text칸 줄넘김 자동 -->
					<script>
						$(".tbl-qnaView").attr("style","word-break:break-all");
					</script>

					<!--------------- 버튼 관련 코드 ----------------->
					<br>
					<div id="btn-list">
						<div class="btn-list">
							<button type="button" id="confirmPwd" style="color: #2a1b0a;"
								onclick="location.href='<%= request.getContextPath() %>/community/qna/confirmPwd?No=<%=qna.getQna_no()%>&nickname=<%=qna.getQna_nickname()%>&sortNo=2'">수정</button>
							<button type="button" id="btnDelete" style="color: #2a1b0a;">삭제</button>
							<button type="button" style="color: #2a1b0a;"
								onclick="location.href='<%= request.getContextPath() %>/community/qna'">목록으로</button>
						</div>
					</div>

					</form>
			</div>
		</section>
	</div>
<script>
	$(document).ready(() => {
		$("#btnDelete").on("click", (e) => {
			if(confirm("정말로 게시글을 삭제하시겠습니까?")) {
				location.replace("<%=request.getContextPath()%>/community/qna/delete?qnaNo=<%=qna.getQna_no()%>");
			}
		});
	});
</script>
	<%@ include file="/views/common/footer.jsp"%>