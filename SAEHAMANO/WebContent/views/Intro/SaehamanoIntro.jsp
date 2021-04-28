<!--  새하마노 소개 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/views/common/headerDetail.jsp"%>

<style>
@font-face {
    font-family: 'GmarketSansLight';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansLight.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'GmarketSansMedium';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

/*제일 바탕 영역 설정*/
#box{ 
	background-color:#2a1b0a;
	width:100%;
	height:850px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
	margin-top:330px;
	margin-bottom:100px;
	margin-left:-10px;
	padding:10px;
}	
/*컨텐츠 영역*/
#conbox{
	 position:relative;
	 width:1000px; /*각자 컨텐츠에 맞춰서 가로사이즈 지정하세요,.*/
	 top:0px;
	 margin:auto;
	 align:center;
}

/*소개 테이블 전체 영역 지정*/
.saehamanoIntroTable {
	width: 1000px;
	height:0 auto; 
	 font-family: 'GmarketSansLight';
	margin-top:100px;
	}
	
/* 새하마노 소개 이미지 */
 .saehamanoIntroImg {
 		width: 482px;
 		height: 549px;
 		object-fit:cover;
 }
 
 /* 새하마노 소개 제목*/
 .shmnTitle {
  	color: white;
 	font-size:35px;
 	font-family: 'GmarketSansMedium';
 }
 
 /* 새하마노 설명 영역 지정 */
 .content {
 	width: 500px;
 	height: 300px;
 	padding-top:50px;
 	padding-bottom:20px;
 }

 /* 새하마노 설명 문단 스타일 */
 .shmnIntroContent {
 color: white;
 line-height: 2em;
 padding-right:40px;
 }

/* 새하마노 뜻 문단 스타일*/
.shmnIntroContent span {
  font-size: 18px;
  font-weight : bold;
  color: wheat;
  }

</style>
<div id="box">
<section id="shmnIntro">
	<div id="conbox">
        <table class="saehamanoIntroTable">
	            <tr>
	                <td><span class="shmnTitle">새하마노<br>소개<br></span>
	                </td>
	                <td rowspan="2">
	                <img class="saehamanoIntroImg" src="<%= request.getContextPath() %>/resources/images/Gyeongbokgung1.jpg" alt="새하마노소개">
	                </td>
	            </tr>
            <tr>
                <td class="content">
                <p class="shmnIntroContent">
                 <br><br>
                &nbsp;&nbsp;<span>새하마노</span>는 ‘동, 서, 남, 북에서 불어오는 바람’을 뜻하는 우리말로, 샛바람, 하늬바람, 마파람, 높바람에서 새, 하늬, 마, 높을 따와서 새하마노라 부른다.
                <br>
				&nbsp;&nbsp;대한민국의 문화가 늘 곁에서 부는 바람처럼 일상 속에 자연스럽게 스며들기를 바라는 취지로 ‘새하마노’ 라는 이름을 지었다.<br><br>
				<span>&nbsp;&nbsp;"역사를 잊은 민족에게 미래는 없다"</span><br>&nbsp;&nbsp;대한민국의 역사와 문화재를 쉽고 부담 없이 접하여 한국 문화에 관심을 갖게 되는 발판이 되는 걸 목표로 한다.                 
                </p>
                </td>
            </tr>
        </table>
	</div>
</section>
</div>
<%@ include file="/views/common/footer.jsp"%>
