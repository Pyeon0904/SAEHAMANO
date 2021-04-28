<!-- 210428(수) 15:36 김예원 (최종수정자) -->
<!-- 최종 -->
<%@ page import="mvc.community.review.model.vo.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/views/common/headerDetail.jsp"%>
<%
	Review review = (Review)request.getAttribute("review");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>후기 게시글 1개 보기</title>


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
	width: 700px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/
	position: relative;
	top: 20px;
	margin: auto;
}

/*----------------------------------------------------------*/

/* 페이지 이름(Q & A 글쓰기) ----------------------- */
.pageName {
	text-align: center;
	font-family: GmarketSansLight;
	color: white;
}
/*---------------------------------------------------*/

/* view 전체 영역*/
div#ReviewViewContainer {
	width: 0 auto;
	margin: 0 auto;
	text-align: center;
	font-family: GmarketSansLight;
}

/*게시글 view 박스 스타일 */
table#tbl-reviewView {
	width: 700px;
	border-collapse: collapse;
	margin: 0 auto;
}

/* 테이블 스타일-------------------------------------*/
/*테이블 th (제목) 스타일*/
table#tbl-reviewView th {
	width: 120px;
	padding: 5px 0;
	text-align: center;
	border-bottom: 1px solid black;
	color: #2a1b0a;
	font-size: 13pt;
}

/*테이블 td (열) 스타일*/
table#tbl-reviewView td {
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


/* 댓글 ------------------------------------------------------------------------------*/
	/* 댓글 작성 관련 칸 */
	section>div#board-write-container{width:600px; margin:0 auto; text-align:center; }
	    section>div#board-write-container h2{margin:10px 0;}
	    table#tbl-board{width:500px; margin:0 auto; border:1px solid black; border-collapse:collapse; clear:both; }
	    table#tbl-board th {width: 125px; border:1px solid; padding: 5px 0; text-align:center;} 
	    table#tbl-board td {border:1px solid; padding: 5px 0 5px 10px; text-align:left;}
	    button#btn-insert{width:60px;height:50px; color:#2a1b0a; font-family: GmarketSansLight; font-weight: bold; background-color:wheat;position:relative;top:-20px;}
	    div#comment-container {width: 700px; margin-left:0px; margin-top: 50px;}
	    #replyContent {width: 620px;}
	    
	/* 작성된 댓글 테이블*/
	    table#tbl-comment{width:580px; margin:0 auto; border-collapse:collapse; clear:both; } 
	    table#tbl-comment tr td{border-bottom:1px solid; border-top:1px solid; padding:5px; text-align:left; line-height:120%;}
	    table#tbl-comment tr td:first-of-type{padding: 5px 5px 5px 50px;}
	    table#tbl-comment tr td:last-of-type {text-align:right; width: 100px;}
	    table#tbl-comment button.btn-delete{display:none;}
	    table#tbl-comment tr:hover {background:wheat;}
	    table#tbl-comment tr:hover button.btn-delete{display:inline;}
	    table#tbl-comment sub.comment-writer {color:navy; font-size:14px}
	    table#tbl-comment sub.comment-date {color:tomato; font-size:10px}
    	
    /*---------------------------------------------------------------------------------*/
</style>

</head>
<body>
	<div id="box">
		<section id="section">
			<div id="conbox">
				<section id="content">
					<div id='ReviewViewContainer'>
						<h2 class="pageName" style="margin-bottom: 40px;">후기게시판</h2>
						<%-- <form action="<%=request.getContextPath()%>" method="POST"> --%>

							<table id='tbl-reviewView' style="table-layout: fixed">
								<input type="hidden" value="<%=review.getNick_sequence()%>" />
								<tr>
									<th>제 목</th>
									<td colspan="3"><%=review.getRe_name()%></td>
									<th>분류</th>
									<td colspan="2">
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
								</tr>
								<tr>
									<th>글번호</th>
									<td><%=review.getRowNum()%></td>
									<th>작성자</th>
									<td><%=review.getReview_nickname()%></td>
									<th>조회수</th>
									<td><%=review.getRe_views()%></td>
								</tr>
								<tr>
									<th>첨부파일</th>
									<td colspan="3">
										<% if(review.getOriginal_filename() != null){ %>
											<a href="javascript:fileDownload('<%= review.getOriginal_filename() %>', '<%= review.getRenamed_filename() %>')">
												<%=review.getOriginal_filename()%>
											</a>
											<script>
												function fileDownload(oriname, rename){
													const url ="<%= request.getContextPath()%>/community/fileDown";
													
													let oName = encodeURIComponent(oriname);
													let rName = encodeURIComponent(rename);
													
													console.log(oName, rName);
													
													location.assign(url + "?oriname=" + oName + "&rename=" + rName);
												}
											</script>
										<% }else { %>
										<span>-</span>
										<% } %>
									</td>
									<th></th>
									<td colspan="2"></td>

								</tr>

								<tr>
									<!-- 내용 -->
									<td colspan="7">
										<div class="nt-content">
											<%=review.getRe_content()%>
										</div>
									</td>
								</tr>
							</table>
					</div>

					<!-- text칸 줄넘김 자동 -->
					<script>
						$(".tbl-reviewView").attr("style","word-break:break-all");
					</script>
					<!--------------- 버튼 관련 코드 ----------------->
					<br>
					<div id="btn-list">
						<div class="btn-list">
							<button type="button" id="confirmPwd" style="color: #2a1b0a;"
								onclick="location.href='<%=request.getContextPath()%>/community/review/confirmPwd?No=<%=review.getRe_no()%>&nickname=<%=review.getReview_nickname()%>&sortNo=1'">수정</button>
							<button type="button" id="btnDelete" style="color: #2a1b0a;">삭제</button>
							<button type="button" style="color: #2a1b0a;"
								onclick="location.href='<%=request.getContextPath()%>/community/review'">목록으로</button>
						</div>
					</div>
					
					<!-- -----------------------댓글 작성 코드------------------------- -->
					<!--  
					<div id="comment-container">
	    				<div class="comment-editor">
	    				<form action="<%= request.getContextPath() %>/community/reply" method="POST">
	    					<input type="hidden" name="reviewNo" value="">
	    					<input type="hidden" name="writer" value="">
							
							<h3 class="pageName" style="text-align:left;">댓글</h3>
							<textarea name="content" id="replyContent" cols="55" rows="3" style="resize:none;"></textarea>
							<button type="submit" id="btn-insert">등록</button>	    			
	    				</form>
	    				</div>
	    			</div>
	    			-->
	    			<!-- ---------------------댓글 List, 삭제 코드--------------------- -->
	    			<!--
	    			<table id="tbl-comment">
				    	   	<tr class="level1">
					    		<td>
					    			<sub class="comment-writer"></sub>
					    			<sub class="comment-date"></sub>
					    			<br>
					    		</td>
					    		<td>
				    				<button class="btn-delete">삭제</button>
					    		</td>
					    	</tr>
				    </table>
				   -->
				</section>
			</div>
		</section>
	</div>
	<script>
	$(document).ready(() => {
		$("#btnDelete").on("click", (e) => {
			if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
				location.replace("<%=request.getContextPath()%>/community/review/delete?reviewNo=<%=review.getRe_no()%>");
			}
		});
	});
</script>
</body>
</html>

<%@ include file="/views/common/footer.jsp"%>
