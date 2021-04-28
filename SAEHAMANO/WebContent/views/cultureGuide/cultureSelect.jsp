<!-- 210424 22:58 김하린 (최종수정자) -->
<!-- 문화안내 조건 선택 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    
<%@ include file="/views/common/headerDetail.jsp" %>

<link rel="stylesheet" type="text/css" href="<%= request.getContextPath() %>/resources/css/cultureGuide.css">

<div id="box">
<section id="culturalSelect">
<div id="conbox">
<span>문화안내</span>
<div id="cs-container">
		<div class="select1">
			<div class="group-box1">
				<h3>지역별</h3>
					<input type="checkbox" name="local" value="seoul">서울시
					<input type="checkbox" name="local" value="gyeonggi">경기도
					<input type="checkbox" name="local" value="gangwon">강원도
					<input type="checkbox" name="local" value="chungcheong">충청도<br>
					<input type="checkbox" name="local" value="jeolla">전라도
					<input type="checkbox" name="local" value="gyeongsang">경상도
					<input type="checkbox" name="local" value="jeju">제주도
					<input type="checkbox" name="local" value="busan">부산<br>
					<input type="checkbox" name="local" value="daegu">대구
					<input type="checkbox" name="local" value="incheon">인천
					<input type="checkbox" name="local" value="gwangju">광주
					<input type="checkbox" name="local" value="daejeon">대전
					<input type="checkbox" name="local" value="ulsan">울산	
			</div>
			<br>
			<div class="group-box2">
				<h3>분류별</h3>
				<input type="checkbox" name="cultural" value="cultural1">유적건조물
				<input type="checkbox" name="cultural" value="cultural2">유물
				<input type="checkbox" name="cultural" value="cultural3">기록유산<br>
				<input type="checkbox" name="cultural" value="cultural4">무형문화재
				<input type="checkbox" name="cultural" value="cultural5">자연유산<br>
				<input type="checkbox" name="cultural" value="cultural6">등록문화재
				<input type="checkbox" name="cultural" value="cultural7">무형유산
			<div class="bt-div">
				<input type="submit"  class="bt-find" value="찾기">
			</div>
			</div>
		
			<div class="select-img">
						    <input type="radio" name="slide" id="slide1" checked>
						    <input type="radio" name="slide" id="slide2">
						    <input type="radio" name="slide" id="slide3">
						    <input type="radio" name="slide" id="slide4">
						  <div class="slide-img">
						        <img class="boxImg" src="<%= request.getContextPath() %>/resources/images/(DB)korea_2.jpg" >
						        <img class="boxImg" src="<%= request.getContextPath() %>/resources/images/(DB)korea_1.jpg" >
						        <img class="boxImg" src="<%= request.getContextPath() %>/resources/images/(DB)korea_2.jpg" >
						        <img class="boxImg" src="<%= request.getContextPath() %>/resources/images/(DB)korea_3.jpg" >
						  </div>
						    <div class="bullets">
						        <label for="slide1">&nbsp;</label>
						        <label for="slide2">&nbsp;</label>
						        <label for="slide3">&nbsp;</label>
						        <label for="slide4">&nbsp;</label>
						    </div>
			</div>
		</div>
</div>
</div>
</section>
</div>
<%@ include file="/views/common/footer.jsp" %>