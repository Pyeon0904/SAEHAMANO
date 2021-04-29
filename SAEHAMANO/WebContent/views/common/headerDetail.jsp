<!--210418 18:04 조한결-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>새하마노</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>


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

#bg{
	padding:0px;
	background-image:url(<%=request.getContextPath()%>/resources/images/backgroundcircle-dark.png);
	overflow-x:hidden;
	z-index:0;	
}




	.logo {
		margin: 0px;
		position: absolute;
		top: 15px;
		left:5.5%;
		width: 90px;
		display: inline-block;
		z-index:1;
	}


	
/*메뉴바*/
	.menu {
		position: absolute;
		right:0%;
		top: 20px;
		margin:0px;
		width: 600px;
		height:45px;
	}
	
	/*마우스 on*/
	.col:hover{	background-color:#2a1b0a; position:relative; width:600px; height:180px;	}
	
	
	/*하위 메뉴 구분하기*/
	.semititle{ 
			text-align:center;
			display: block;
			font-family: 'GmarketSansMedium';
			font-size: 16px;
			padding: 10px 20px;
			color:white;
			text-decoration: none;
	}

	/*메인 탭*/	
		.maintab {
			
			position:relative;
			left:0px;
			list-style-type: none;
			padding: 0;
			margin: 0;
		}
		
		
		
		/*메인탭 박스?틀? 설정*/
		.maintab li {
			float: left;
			width: 150px;
			position: relative;
			padding: 0;
			line-height: 25px;
		}
		
		/*글자 관련 설정*/
		.submenu {
			text-align:center;
			display: block;
			font-family: 'GmarketSansMedium';
			font-size: 16px;
			padding: 10px 20px;
			color:#948c84;
			text-decoration: none;
		}
	
	
	/*2a1b0a*/
	/*세부 탭*/
		/*세부 탭 기본 설정*/
		.detailtab {
			position: absolute;
			left: 0px;
			width: 200px;
			list-style-type: none;
			padding: 0;
			margin: 0;
			display:none;
		}
		
		

		

</style>
<script>
        $(document).on('mouseover', '.menu a', function () {
        	$('.detailtab').slideDown(0);
        });
        
        $(document).on('mouseleave', 'div', function () {
                 $('.detailtab').slideUp(0);
            
        });
</script>



</head>
<body id="bg">
	<header>
	
		
		<a href="<%= request.getContextPath() %>/"> <img class="logo"
			src="<%=request.getContextPath() %>/resources/images/golo-logo.png" />
		</a>
		
		
	
		<div class="menu">
			<div class="col">
			<ul class="maintab">
				
				<li><a class="semititle" href="<%= request.getContextPath() %>/Intro/KoreaIntro">소개</a>
					<ul class="detailtab">
						<li><a class="submenu" href="<%= request.getContextPath() %>/Intro/KoreaIntro">대한민국 소개</a></li>
                        <li><a class="submenu" href="<%= request.getContextPath() %>/Intro/SaehamanoIntro">새하마노 소개</a></li>
                        <li><a class="submenu" href="<%= request.getContextPath() %>/Intro/NoticeBoard">공지사항</a></li>
					</ul></li>

				<li><a class="semititle" href="<%= request.getContextPath() %>/cultural/list">문화안내</a>
					<ul class="detailtab">
					</ul></li>

				<li><a class="semititle" href="<%= request.getContextPath() %>/event/eventschedule">행사 일정</a>
					<ul class="detailtab">
						<li><a class="submenu" href="<%= request.getContextPath() %>/event/eventschedule">축제 소개</a></li>
					
					</ul></li>

				<li><a class="semititle" href="<%= request.getContextPath() %>/community/main">커뮤니티</a>
					<ul class="detailtab">
						<li><a class="submenu" href="<%= request.getContextPath() %>/community/qna">Q&A</a></li>
						<li><a class="submenu" href="<%= request.getContextPath() %>/community/review">후기</a></li>
					</ul></li>

			</ul>
			</div>
		</div>

	</header>
	