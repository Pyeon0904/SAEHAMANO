<!-- 210415 23:10 조한결 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/views/common/header.jsp"%>

<style>

@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'GmarketSansLight';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: 'Arita-buri-SemiBold';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Arita-buri-SemiBold.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}



.topbg{
	margin-top: 0px;
	margin-left: 0px;
	height:200px;
	width:100%;
	background-image:url(<%=request.getContextPath()%>/resources/images/detailbgblue-06.png);
	background-repeat:repeat-x;
	
}

#aaa{
	width:1000px;
	height:800px;
}

.arrow{

}
section div {
	float:center;
}

#section{
	top:10%;
	left:20%;
}

</style>

<!-- 
<script>
	$(function(){
	    $('.topbg').slideUp();
	    $('.topbg').scroll(function(){
	        // $(this).next('p').slideDown();
	        $(topbg).slideToggle(1000);
	    });
	})
</script>
-->

<div class="topbg">
	<p></p>
</div>

<section id="section">

	
	<h4>지역 행사</h4>
	<div id="bodybg">
		<a class="arrow">&lt;</a>
		<img src="<%=request.getContextPath() %>/resources/images/hanriver.jpg" width="750"/>
		<a class="arrow">&gt;</a>
		
	</div>
	
	<div id="month-festival">
		<a class="arrow">&lt;</a>
		<span>5월의 축제</span>>
		<a class="arrow">&gt;</a>
	</div>
	
	<div>
		<img id="festival-left" src="<%=request.getContextPath() %>/resources/images/hanriver.jpg" width="225"/>
		<img id="festival-center" src="<%=request.getContextPath() %>/resources/images/hanriver.jpg" width="300"/>
		<img id="festival-right" src="<%=request.getContextPath() %>/resources/images/hanriver.jpg" width="225"/>
		
	</div>
	
</section>

<%@ include file = "/views/common/footer.jsp"%>

