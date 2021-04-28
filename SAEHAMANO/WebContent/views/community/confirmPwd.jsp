<!-- 210427(화) 16:04  (최종수정자) -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/headerDetail.jsp"%>

<%
	String nickname =(String)request.getParameter("nickname");
	int No = Integer.parseInt(request.getParameter("No"));
	int sortNo = Integer.parseInt(request.getParameter("sortNo"));
%>

<!DOCTYPE html>
<html>
	<head>
	<script src="<%=request.getContextPath() %>/js/jquery-3.5.1.js"></script>
	<script src="<%= request.getContextPath() %>/resources/js/jquery-3.6.0.min.js"></script>
	<meta charset="UTF-8">
	<title>비밀번호 확인</title>
	
		<style>
			
			/* 전체 영역--------------------------------------------------------------------------*/
							
						/*---------------제일 바깥 영역 설정-----------------*/
						#box{ 
						   background-color:#948c84;
						   width:100%;
						   height:600px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
						   margin-top:330px;
						   margin-bottom:100px;
						   margin-left:-10px;
						   padding:10px;
						}
						/*-------------------컨텐츠 영역---------------------*/
						#conbox{
							width:1600px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/
							position:relative; 
							top:20px;
							margin:auto;
						}
						    
					/*-----------------------------------------------------------------------------------*/
			
			/* 페이지 상단 TEXT -----------------------------------------------------------------*/
			
					/* ----- 페이지 이름(후기작성 게시판) ----- */
					.pageName { 
						text-align: center;
						font-family: GmarketSansLight;
						color: white;
					}
					/* ----- 페이지 설명(국보문화재 관람 후기를 남겨~~~)*/
					.pageExplain {
						color: wheat;
					}
			
			/*-----------------------------------------------------------------------------------*/
			
				table{
					display:flex;
					
					justify-content: center;
					align-items: center;
				}
				table tr:nth-child(3){
					text-align: center;
				}
		</style>
</head>

<body>
<div id="box">
	<section id="section">
      	<div id="conbox">
      		<!-- 상단의 TEXT 구현 ---------------------------------------------------------- -->
				<div class="pageName">
					<h1>게시글 수정을 원하신다면 비밀번호를 입력하세요.</h1>
					<hr>
					<h3 class="pageExplain">본 게시글 작성시 입력한 비밀번호를 재입력해주세요.</h3>
				</div>
			<!------------------------------------------------------------------------------- -->
      	
				<div id="updatePassword-container">
					<%
						if(sortNo == 1){
					%>
					<form action="<%= request.getContextPath() %>/community/review/confirmPwd" method="POST">
					<%
						}else if(sortNo == 2){
					%>
					<form action="<%= request.getContextPath() %>/community/qna/confirmPwd" method="POST">
					<%
						}
					%>
						<table>
							<input type="hidden" name="No" value="<%=No%>">
							<br>
							<tr>
								<th>닉네임</th>
								<td><%=nickname%></td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="password" name="password" id="pass1" required>
								</td>
							</tr>
							<tr>
								<td colspan="2"><input type="submit" value="확인하기"> 
								</td>
							</tr>
						</table>
					</form>
				</div>
			
				<!-- <script>
					function validate(){
						let pass1 = $("#pass1").val();
						let pass2 = $("#pass2").val();
						
						if(pass1.trim() != pass2.trim()){
							alert("비밀번호가 일치하지 않습니다.");
							
							 $("#pass1").val("");
							 $("#pass2").val("");
							 $("#pass1").focus();
							 
							return false;
						}
					}
				</script> -->
		</div>    
	</section>
</div>
</body>
</html>
<%@ include file="/views/common/footer.jsp"%>