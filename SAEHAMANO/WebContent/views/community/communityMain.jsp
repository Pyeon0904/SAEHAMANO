<!-- 210412(월) 22:57 편준장 (최종수정자) -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/header.jsp"%>


<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>커뮤니티 메인페이지</title>
		
		<style>
			/* 상단 bg - height 220px 고정!!! */
			#up_bg {
				height: 220px; 
				margin: 70px;
			}
		
			#pageName{
				color : teal;
			}
			
			#community_container{
				margin: 0px auto;
			}	
			
			#content {
    			margin: 70px;
    			padding : 0px;
   				width: 600px;
   				min-height: 10px;
			}
			
            .review {
                width : 300px;
                height: 250px;
                border: 1px border #bfbfbf;
                padding: 10px 10px 20px 10px;
                background-color: #fff;
                box-shadow: 2px 2px 3px rgb(202, 196, 196);
                position: relative;
                left: 30px;
                top: -138px;
            }
            .review > img {
                width : 300px;
                height: 180px;
            }
           
           .captionReview {
               text-align: center;
               color: teal;
               font-family: "아리따돋움";
               font-weight: 600;
               font-size: 16px;
           }
           
           .qna {
           /*width, height : 사진 뒤 흰배경 크기 설정*/
                width : 300px;
                height : 250px;
                border: 1px border #bfbfbf;
                padding: 10px 10px 20px 10px;
                background-color: #fff;
                box-shadow: 2px 2px 3px rgb(202, 196, 196);
                align: center;
                position: relative;
			/*left, top : 사진 위치 설정*/
                left: 500px;
                top: -670px;
            }
            .qna > img {
                width : 300px;
                height: 180px;
            }
           
           .captionQna {
               text-align: center;
               color: teal;
               font-family: "아리따돋움";
               font-weight: 600;
               font-size: 16px;
           }
           
        </style>
		
	</head>
	<body>
	<img id="up_bg" src="<%=request.getContextPath() %>/resources/images/detailbggreen.png">
       	<div id="content">
       		<h2 id="pageName">커뮤니티</h2>
       		<hr>
       		<p><strong>후기</strong>와 <strong>Q&A</strong>를 통해 더욱 풍부한 국보문화재 관람이 되시길 바랍니다.</p>	
       	
       	
	       	<section>
	       		<div id="community_container">
				        <div class="review">
				            <img src="<%=request.getContextPath() %>/resources/images/hanriver.jpg" usemap="#maptest">
				            <p class="captionReview">후기 작성</p>
				            <map name="maptest">
				                <area shape="rect" coords="0,0,6000,3658" href="communityReview.jsp">
				            </map>
				        </div>
				        
				        <div class="qna">
				            <img src="<%=request.getContextPath() %>/resources/images/pohanghand.jpg" usemap="#maptest">
				            <p class="captionQna">Q & A</p>
				            <map name="maptest">
				                <area shape="rect" coords="0,0,6000,3658" href="communityQna.jsp">
				            </map>
				        </div>
				</div>
	        </section>
        </div>
	</body>
</html>

<%@ include file="/views/common/footer.jsp"%>
