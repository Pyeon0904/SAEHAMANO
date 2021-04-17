<!--210415 23:28 조한결-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "/views/common/header.jsp"%>

<style>

/*배경 이미지(산모양) 삽입*/


#bgs{
	margin-right: 0px;
	height:100%;
	width:200px;;
	background-image:url(<%=request.getContextPath() %>/resources/images/backgroundsepia-07.png);	
	background-repeat:repeat-y;
}

</style>
<section id="bgs">

</section>
<section>
	<div id="main" class="home">
		<img src="<%=request.getContextPath() %>/resources/images/map-02.png" height="400"/>
		
		<br><br><br><br><br>
		
	</div>
	
	
	<div id="intro" class="home">
		
		<img id ="introimg" src="<%=request.getContextPath()%>/resources/images/introsaehamanoformain.png" height="400">
		
		<br><br>
		<a id="introdetail" class="link" href=""> 소개 더 보기 &gt; </a>
		
		<br><br><br><br><br>
	
		
	</div>
	
	
	<div id="eventschedule" class="home">
		<h3>행사일정</h3>
		
			<div>
				<img id="eventschedule01" src="<%=request.getContextPath() %>/resources/images/hanriver.jpg" >
			</div>
			<div>
				<img id="eventschedule02" src="<%=request.getContextPath() %>/resources/images/hanriver.jpg" >
			</div>
			<div>
				<img id="eventschedule03" src="<%=request.getContextPath() %>/resources/images/hanriver.jpg" >			
			</div>
			<div>
				<img id="eventschedule04" src="<%=request.getContextPath() %>/resources/images/hanriver.jpg" >			
			</div>
		
		
		
		<a id="eventdetaillink" class="link" href=""> 행사 더 보기 &gt; </a>
		
		<br><br><br><br><br>
		
	
			
	</div>
	
	<br><br><br><br><br>
	<br><br><br><br><br>
	<br><br><br><br><br>
	
	<div id="community" class="home">
		<h3>커뮤니티</h3>
		<div id="review" class = "commbox">			
			<img src="<%=request.getContextPath() %>/resources/images/hanriver.jpg" width="500">
			<a class="comtext link" href=""><h4>후기</h4></a>
		</div>
		
		<div  id="qna" class = "commbox">
			<img src="<%=request.getContextPath() %>/resources/images/pohanghand.jpg" width="500">
			<a class="comtext link" href="#"><h4>Q & A</h4></a>
			
			<!-- commbox=community box
				 comtext=community link text
			 -->
		</div>		
	</div>

		<br><br><br><br><br>
		<br><br><br><br><br>		
</section>

<%@ include file = "/views/common/footer.jsp"%>

