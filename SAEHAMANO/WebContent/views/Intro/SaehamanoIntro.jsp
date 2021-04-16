<!-- 210412 24:26 김하린(최종수정자) -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/header.jsp"%>
<!-- 구글 Noto 바탕체 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif:wght@400;700&display=swap" rel="stylesheet">
<!-- font-family:'Noto Serif', serif; -->
<!-- 구글 Noto 굴림체 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Noto+Serif:wght@400;700&display=swap" rel="stylesheet">
<!-- font-family: 'Noto Sans KR', sans-serif; -->

<style>

/*상세페이지 타이틀 백그라운드 이미지*/
.TopBackgroundImg {
		width:0px auto;
		height:220px;
		margin-top: 200px;
	}
	
/*소개 테이블 전체 영역 지정*/
.SaehamanoIntroTable {
  position: relative;
  margin-top:50px;
  margin-left:220px;
	border:1px solid  white;
	}
	
/* 새하마노 소개 이미지 */
 .SaehamanoIntroImg {
 		position: relative;
 		width: 482px;
 		height: 549px;
 		object-fit:cover;
 }
 
 /* 새하마노 소개 제목*/
 .ShmnTitle {
 	color: #373737;
 	font-size:35px;
 	font-family:'Noto Serif', serif;
 }
 
 /* 새하마노 설명 영역 지정 */
 .content {
 	width: 500px;
 	height: 300px;
 	padding-top:110px;
 	padding-bottom:30px;
 }

 /* 새하마노 설명 문단 스타일 */
 .ShmnIntroContent {
 color: #4C4C4C;
font-family: 'Noto Sans KR', sans-serif;
 text-align: justify;
 line-height: 2em;
 padding-right:30px;
 
 }

/* 새하마노 뜻 문단 스타일*/
span[class=ShmnIntroContent] {
  font-family: 'Noto Sans KR', sans-serif;
  font-size: 18px;
  font-weight : bold;
  color: black;
  float: left;
  }
 

</style>
<section id="ShmnIntro">
		<img class="TopBackgroundImg" src="<%= request.getContextPath() %>/resources/images/detailbggreen.png"/>
        <table class="SaehamanoIntroTable">
	            <tr>
	                <td><span class="ShmnTitle">새하마노<br>소개<br></span>
	                </td>
	                <td rowspan="2">
	                <img class="SaehamanoIntroImg" src="<%= request.getContextPath() %>/resources/images/Gyeongbokgung1.jpg" alt="새하마노소개">
	                </td>
	            </tr>
            <tr>
                <td class="content">
                <p class="ShmnIntroContent">
                 <span class="ShmnIntroContent">새하마노는 '동서남북'을 뜻하는 순우리말이다.<br></span>
                 <br><br>
                (제작의도) 나라의 말이 중국과 달라 한문·한자와 서로 통하지 아니하므로
                이런 까닭으로 어리석은 백성이 이르고자 하는 바가 있어도
                끝내 제 뜻을 능히 펴지 못하는 사람이 많다.
                내가 이를 위해 불쌍히 여겨 새로 스물여덟 글자를 만드니
                사람마다 하여금 쉬이 익혀 날마다 씀에 편안케 하고자 할 따름이다.
                </p>
                </td>
            </tr>
        </table>
    
    <!--     새하마노 : 동풍, 서풍, 남풍, 북풍의 순 우리말이에요.
	동서남북이 '새, 하늬, 마, 높'이고
	거기에 바람을 붙여서
	샛바람, 하늬바람, 마파람, 높바람이라 부르죠. -->
	

</section>

<!-- <%@ include file="/views/common/footer.jsp"%> -->
