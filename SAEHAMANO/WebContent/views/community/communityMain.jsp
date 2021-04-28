<!-- 210426(월) 11:10 김예원 (최종수정자) -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/headerDetail.jsp"%>
<!-- 구글 Noto 바탕체 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif:wght@400;700&display=swap" rel="stylesheet">
<!-- 구글 Noto 굴림체 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Noto+Serif:wght@400;700&display=swap" rel="stylesheet">


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>커뮤니티 메인페이지</title>
		
		<style>
			
		/*--------------------전체 영역-----------------------------*/
			
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
		     	width:1000px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/
		    	position:relative; 
		    	top:20px;
		     	margin:auto;
		    }
		    
			/*----------------------------------------------------------*/
		
		/* ---------"커뮤니티"(페이지제목)------------- */
			
			#pageName{
				color : white;
				font-family:GmarketSansMedium;
				text-align:center;
				font-size: 25pt;
				
			}
			
			#pageExplain {
				color: white;
				font-family:GmarketSansLight;
				text-align:center;
				font-size: 15pt;
			}
			
		/* ---------------------------------------- */
		
		
		/*--------------- 사진 뒤 배치 영역 ---------------*/
            .review {
                width : 450px;
				float:left;
                position: relative;
            }
           
           .qna {
                width : 450px;
                position: relative;
                left: 100px;
                float:left;
            }
       /*--------------------------------------------------*/
     
	/* -------------- 사진 ----------------- */
            /* 후기 사진 */
            .review > img {
                width : 450px;
                height: 450px;
                border-radius: 30%;
            }
            
            /* QnA 사진 */
            .qna > img {
                width : 450px;
                height: 450px;
                border-radius: 30%;
            }
	/* -------------------------------------- */       
           
	/* ---------사진 아래 캡션text------------- */
           .captionReview {
               text-align: center;
               color: wheat;
               font-family:GmarketSansLight;
               font-weight: 600;
               font-size: 30px;
               margin-top: -250px;
           }
           
           .captionQna {
               text-align: center;
               witdh: 200px;
               color: wheat;
               font-family:GmarketSansLight;
               background-color: #2a1b0a;
               font-weight: 600;
               font-size: 30px;
               margin-top: -250px;
           }
	/* ---------------------------------------- */
        
        </style>
		
	</head>
	<body>
		<div id="box">
	    	<div id="conbox">
	      		
		      	<!------------ 상단 text ------------>
		       		<h2 id="pageName">커뮤니티</h2>
		       		<p id="pageExplain"><strong>후기</strong>와 <strong>Q&A</strong>를 통해 더욱 풍부한 국보문화재 관람이 되시길 바랍니다.</p>	
		      	<!----------------------------------->
	<br>
	<br>
	<br>
	<br>	      		
		       	
		       	<!---------------- 사진 2개 관련 div -------------------->
				       <div class="review">
				            <img src="<%=request.getContextPath() %>/resources/images/commHalf.png" usemap="#maptest">
				            <p class="captionReview">후기 보기</p>
				            <map name="maptest">
				                <area shape="rect" coords="0,0,6000,3658" href="<%=request.getContextPath()%>/community/review">
				            </map>
				        </div>
				        
				        <div class="qna">
					        <img src="<%=request.getContextPath() %>/resources/images/commHalf.png" usemap="#maptest1">
				            <a href="communityQna.jsp"></a>
				            <p class="captionQna">Q & A</p>
				            <map name="maptest1">
				                <area shape="rect" coords="0,0,6000,3658" href="<%=request.getContextPath()%>/community/qna">
				            </map>
				        </div>
				<!----------------------------------------------------------->
					        
			</div>
		</div>
	</body>
</html>

<%@ include file="/views/common/footer.jsp"%>
