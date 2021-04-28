<!-- 210428(수) 15:36 김예원 (최종수정자) -->
<!-- 최종 -->
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="mvc.community.review.model.vo.Review"%>
<%@page import="mvc.common.util.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/headerDetail.jsp"%>

<!-- 구글 Noto 바탕체 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif:wght@400;700&display=swap" rel="stylesheet">
<!-- 구글 Noto 굴림체 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Noto+Serif:wght@400;700&display=swap" rel="stylesheet">

<%
	List<Review> reviewlist = (ArrayList)request.getAttribute("review");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");	
%>

    
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>커뮤니티 - 후기작성 페이지</title>
		<script src="<%= request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>
		
		<style>
			/* 전체 영역 -------------------------------------------------*/
				/*---------------제일 바깥 영역 설정-----------------*/
				#box{ 
				   background-color:#2a1b0a;
				   width:100%;
				   height:1000px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
				   margin-top:330px;
				   margin-bottom:100px;
				   margin-left:-10px;
				   padding:10px;
				}
			
				/*-------------------컨텐츠 영역---------------------*/
			   #conbox{
			     	width:1500px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/
			    	position:relative; 
			    	top:20px;
			     	margin:auto;
			    }
			/*----------------------------------------------------------*/
		
			/* 페이지 TITLE-------------------------------------------- */
				#pageName{
					color : white;
					font-family:GmarketSansLight;
					text-align:center;
					font-size: 20pt;
				}
			/* --------------------------------------------------------- */
			
			
			/* 표(Table) 관련 스타일 ------------------------------------*/
				/*테이블 크기 지정*/
				table#tbl-board {
					width: 1500px;
					border-collapse: collapse; /* 테두리 셀 사이 간격*/
					clear: both;
				}
				
				/* th 테두리 및 텍스트 위치 설정 */
				table#tbl-board th {
					border-bottom: 1px solid;
					padding: 13px 0;
					text-align: center;
					background-color: wheat;
					font-family: GmarketSansLight;
					text-align:center;
				}
				
				/* "제목" 셀너비 늘리기 */
				#t1 {
					width: 400px;
				}
				
				/*td 테두리 및 텍스트 위치 설정*/
				table#tbl-board td {
					border-bottom: 1px solid;
					padding: 13px 0;
					text-align: center;
					background-color: none;
					font-family: GmarketSansLight;
					text-align:center;
					color: wheat;
				}
				
				#culturePoint {
					background-color: honeydew;
				}
				
				/*테이블 제목 스타일 지정*/
				#tbl-board th{
					color: black;
				}
			/* -------------------------------------------------------------*/
			
			/* 글쓰기 버튼 관련 스타일--------------------------------------*/
				/*글쓰기버튼*/
				#btn-add {
					float: right; text-align: center;
					width: 70px;	height: 30px;
					padding: 5px 5px;
					background: #2a1b0a;
					border:1px solid white;
					border-radius: 5px;
					color: white;
				}
				/*글쓰기 버튼에 마우스 올릴때*/
				#btn-add:hover { border: 3px solid wheat;
				}
			/* -------------------------------------------------------------*/	
			
			/* 하단 페이지바 관련 스타일------------------------------------*/
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
			/* -------------------------------------------------------------*/
	</style>
	</head>
	
<body>
	<div id="box">
		<section id="section">
			<div id="conbox">
				<h1 id="pageName" align="center">후기 전체보기</h1>
				<table id="tbl-board" style="table-layout: fixed">
					<tr>
						<th>문화재명</th>
						<th>글번호</th>
						<th id="t1">제목</th>
						<th>첨부파일</th>
						<th>작성자</th>
						<th>작성일</th>
						<th>조회수</th>
					</tr>
					<!--  
				<tr>
					<td id="culturepoint">서울숭례문</td>
					<td>1</td>
					<td>숭례문 재건되니 좋다~</td>
					<td>첨부파일(디스크사진))</td>
					<td>편</td>
					<td>2020-10-14</td>
					<td>13</td>
				</tr>
				-->
					<%
					if(reviewlist.isEmpty()) {
					%>

					<tr>
						<td colspan="7">조회된 게시글이 없습니다.</td>
					</tr>
					<%} else{
					for(Review review : reviewlist){	
					%>
					<tr>
						<!-- 문화재명 -->
						<td id="culturepoint">
							<%
								if(review.getCul_name() != null) {
							%>
								<%= review.getCul_name() %> 
							<% } else { %> 
								<span> - </span> 
							<%
							 	}
							%>
						</td>
						<!-- 글번호 -->
						<td><%=review.getRowNum() %></td>
						<!-- 제목 -->
						<td><a
							href="<%=request.getContextPath()%>/community/review/view?reviewNo=<%=review.getRe_no()%>&rowNum=<%=review.getRowNum()%>">
								<%=review.getRe_name() %>
						</a></td>
						<!-- 첨부파일 -->
						<td>
							<%
								if(review.getOriginal_filename() != null) {
							%>
								<img src="<%= request.getContextPath() %>/resources/images/filedown.png" width="20" height="20"/> 
							<% } else { %> 
								<span> - </span> 
							<%
							 	}
							%>
						</td>
						<!-- 작성자 -->
						<td><%=review.getReview_nickname() %></td>
						<!-- 작성일 -->
						<td><%=review.getWrite_date() %></td>
						<!-- 조회수 -->
						<td><%=review.getRe_views()%></td>
					</tr>
					<%} 
				}
				%>
				</table>
				<div id="pageBar">
					<!-- 맨 처음으로 -->
					<button
						onclick="location.href='<%=request.getContextPath()%>/community/review?page=1'">&lt;&lt;</button>
	
					<!-- 이전 페이지로 -->
					<button
						onclick="location.href='<%=request.getContextPath()%>/community/review?page=<%=pageInfo.getPrvePage()%>'">&lt;</button>
	
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
						onclick="location.href='<%=request.getContextPath()%>/community/review?page=<%=p%>'"><%=p%></button>
					<%
					}
					%>
					<%
					}
					%>
	
					<!-- 다음 페이지로 -->
					<button
						onclick="location.href='<%=request.getContextPath()%>/community/review?page=<%=pageInfo.getNextPage()%>'">&gt;</button>
	
					<!-- 맨 끝으로 -->
					<button
						onclick="location.href='<%=request.getContextPath()%>/community/review?page=<%=pageInfo.getMaxPage()%>'">&gt;&gt;</button>
				</div>
				<div>
					<script>
						$(".tbl-board").attr("style","word-break:break-all");
					</script>

					<!-- '글쓰기' 버튼 -->
					<button type="button" id="btn-add"
						onclick="location.href='<%=request.getContextPath()%>/community/review/write'">글쓰기</button>
				</div>
				</div>
		</section>
	</div>
</body>
</html>

<%@ include file="/views/common/footer.jsp"%>
