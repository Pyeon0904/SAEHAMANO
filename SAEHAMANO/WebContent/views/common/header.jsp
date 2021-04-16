<!--210414 01:33 조한결-->
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>새하마노</title>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/resources/css/main.css">

<style>

/*---------------index 영역----------------*/

/*배경 이미지(산모양) 삽입*/
	#background {
		/*position: absolute;
		top:0px;
		left:0px;
		*/
		
		background-image: url(<%= request.getContextPath ()%>/resources/images/backgroundsepia.png);
		
		
	}

/*메인에 보여지는 세부페이지 틀 설정*/	
	div {
		width: 900px;
		height: 400px;
		margin: 180px 300px;
	}

/*메인에서 세부페이지로 이동하는 링크 설정*/
	.link {
		text-decoration: none
	}
	
	#left{
		position:absolute;
		left:300px;
		
	}
	
	#right{
		position:absolute;
		right:100px;
		
	}
</style>

<script>

        $(document).on('mouseover', '.menu a', function () {
            $('.detailtab').slideDown(200);
        });
        
        $(document).on('mouseleave', 'nav', function () {
                 $('.detailtab').slideUp(200);
            
        });
    </script>



</head>
<body id="backgroundimg">
	<header>

		<a href="#"> <img class="logo"
			src="<%=request.getContextPath() %>/resources/images/logo.png" />
		</a>



		<nav class="menu">
			<ul class="maintab">

				<li><a href="#">소개</a>
					<ul class="detailtab">
						<li><a href="<%= request.getContextPath() %>/Intro/KoreaIntro">대한민국 소개</a></li>
                       				<li><a href="<%= request.getContextPath() %>/Intro/SaehamanoIntro">새하마노 소개</a></li>
                       				<li><a href="<%= request.getContextPath() %>/Intro/NoticeBoard">공지사항</a></li>
					</ul></li>

				<li><a href="#">문화안내</a>
					<ul class="detailtab">
					</ul></li>

				<li><a href="#">행사 일정</a>
					<ul class="detailtab">
						<li><a href="#">행사 일정</a></li>
						<li><a href="#">지역 축제</a></li>
					</ul></li>

				<li><a href="#">커뮤니티</a>
					<ul class="detailtab">
						<li><a href="#">Q&A</a></li>
						<li><a href="#">후기</a></li>
					</ul></li>

			</ul>

		</nav>

	</header>
