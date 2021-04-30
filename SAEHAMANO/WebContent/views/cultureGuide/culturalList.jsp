<!-- 210427 23:12 김하린 (최종수정자) -->
<!-- 선택한 문화 목록 페이지 culturalSelect 에서 [찾기] 누르면 넘어오는 페이지 -->

<%@page import="mvc.cultureGuide.model.vo.Culture"%>
<%@page import="mvc.common.util.PageInfo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/views/common/headerDetail.jsp" %>

<% 
   List<Culture> list = (ArrayList) request.getAttribute("list");
   PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/css/select2.min.css" rel="stylesheet"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/js/select2.min.js"></script>

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
#box{ 
   background-color:#2a1b0a;
   width:100%;
   height:0 auto; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
   margin-top:330px;
   margin-bottom:100px;
   margin-left:-10px;
   padding:10px;
   color:white;
}
/*컨텐츠 영역*/
   #conbox{
      width:1200px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/
      height:0 auto;
       position:relative; 
       top:20px;
       margin:0 auto;
      font-family: 'GmarketSansLight';
   }
   
/*게시판 타이틀 스타일&위치 지정*/
   div#conbox .cul-title {
      text-align:center;
      font-size: 25pt;
      display:block;
      margin-bottom:70px;
      font-family: 'GmarketSansMedium';
      color:white;
   }
/*드롭박스 크기 지정*/
   select#regionList{width:125px;}
   select#categoryList{width:125px;}
/*검색 부분 영역 지정*/
   div#cul-search {
      width:1200px;
      height: 80px;
      padding-top:50px;
      border-bottom : 2px solid white;
      text-align:center;
   }
/*버튼 위치 조정*/
div#bt-search {display:inline-block;}
/*문화재 리스트 영역 설정*/
#cul-listArea {
      width:1200px;
      height: 200px;
      background:#948c84;
      padding-top:40px;
      margin-top:20px;
   }
/*문화재 리스트 이미지 크기&스타일 지정*/
   div#imgPreview {
      width: 200px;
      height: 150px;
      margin-left:40px;
      overflow:hidden;
      display:inline-block;
      border:2px solid #2a1b0a;
      border-radius:5px;
   }
/*들어가는 이미지 div 지정된 크기에 맞추기*/
   #cul-listArea img{width: 100%; height: 100%; object-fit:cover;}
/*문화재 리스트 > 이름과 설명 부분의 영역지정*/
   #cul-content {
      display:inline-block;
      width: 800px;
      height:150px;
      text-ailgn:left;
      margin-left: 50px;
   }
/* 문화재 리스트 > 문화재 이름 스타일 지정*/
   #cul-content .cul-name{
      display:inline-block;
      width:800px;
      height:50px;
      margin:0;
      font-size:17pt;
      color:#2a1b0a;
      font-family: 'GmarketSansMedium';}
   #cul-content .cul-no{color:#2a1b0a;    font-family: 'GmarketSansMedium';}
   
/*문화재 리스트 > 문화재 설명 부분 스타일 지정 */
   #cul-listArea p {
      display: inline-block;
      width: 800px;
      height: 50px;
      margin:0;
      color: black;
      font-weight:600;
      /*설명이 길어지면 줄임말 붙여서 자르기 */
      overflow:hidden;
      text-overflow: ellipsis;
      white-space: nowrap;
   }
/*자세히보기 버튼 위치 설정*/
   #btn-more{text-align:right;}
/*자세히보기 버튼 스타일 설정*/
#btn-more button {   width:100px;   height:30px;   background:#2a1b0a;   color: wheat;   border:none;   text-align:center;}
#btn-more button:hover{background:#3B2A17;}
/*검색 버튼 스타일 설정*/
#bt-search input {width: 70px; height:27px;    background: none; color:white; border:1px solid white; border-radius:5px; text-align:center;}
#bt-search input:hover{border:2px solid wheat;}
/*페이지바*/
#pageBar{ text-align:center; margin:20px;}
/*페이지바 버튼 스타일 지정*/
#pageBar button {
   font-size: 15px;
   width: 25px; height: 25px;
   margin: 0px 3px;
   background:none;
   border : none;
   color:white;}
/*번호 선택 스타일*/
#pageBar button:disabled{border-bottom:2px solid wheat;   color:wheat;}
/*검색결과 없을 때 나올 안내문구 스타일 지정*/
div#no-result {text-align:center;}
</style>


<div id="box">
<section id="content">
<div id="conbox">
<span class="cul-title"> 문화재 목록 </span>
   <div id="cul-search">
   <form action="<%=request.getContextPath() %>/cultural/list" methods="GET">
      
         <select id="regionList" name="regionList">
                         <option value="" selected> 지역 </option>
                     </select>
   
                     
                          <script>
                             $(document).ready(function(){
                                 var regionList = ['서울특별시','경기도','강원도','충청북도','충청남도', '전라북도','전라남도',
                                    '경상북도','경상남도','제주도','부산광역시','대구광역시','인천광역시','광주광역시','대전광역시','울산광역시'];
                                 $("#regionList").select2({
                                      data:regionList
                                 });
                              });
                          
                          </script>
                          <select id="categoryList" name="categoryList">
                         <option value="" selected>문화재 종류</option>
                     </select>
                     
                          <script>
                             $(document).ready(function(){
                                 var categoryList = ['유적건조물','유물','기록유산','무형문화재','자연유산','등록문화재','무형유산'];
                                 $("#categoryList").select2({
                                      data:categoryList
                                 });
                              });
                             
                          </script>
             <div id="bt-search">
                <input type="submit" value="검색"/>
             </div>
          </form>                
      </div>      
      
      <% if(list.isEmpty()){ %>
      <div id="no-result">
               <p>조건에 해당하는 문화재가 없습니다.</p>
      </div> 
      <% } else{
         for(Culture culture : list){
         //
       %>
      
 <!--  문화재 조회시 목록  -->
      <div id="cul-listArea">
               <div id="imgPreview"><img src="<%= culture.getImg1() %>"/></div>
               <div id="cul-content">
               <span class="cul-no">국보 제  <span><%=culture.getCul_no() %></span>  호</span>
               <span class="cul-name"><%= culture.getCul_name() %></span>
               <p>
               <%= culture.getCul_field() %>
            </p> 
                            <div id="btn-more">
                            <!-- 클릭시 culturalDetails로 넘어감 -->
                               <button onclick="location.href='<%= request.getContextPath() %>/curtural/details?cul_no=<%= culture.getCul_no() %>'">자세히 보기</button>
                            </div>
                </div>
      </div>
      <% }
         }%>
      
      <!--  페이지 바  -->
            <div id="pageBar">
         <!-- 맨 처음으로 -->
         <button onclick="location.href='<%= request.getContextPath() %>/cultural/list?page=1'">&lt;&lt;</button>
         
         <!-- 이전 페이지로 -->
         <button onclick="location.href='<%= request.getContextPath() %>/cultural/list?page=<%= pageInfo.getPrvePage() %>'">&lt;</button>

         <!--  10개 페이지 목록 -->
         <% for(int p= pageInfo.getStartPage(); p <= pageInfo.getEndPage(); p++) {%>
            <%if(p==pageInfo.getCurrentPage()){ %>
               <button disabled><%= p %></button>
            <%} else{ %>
               <button onclick="location.href='<%= request.getContextPath()%>/cultural/list?page=<%= p %>'"><%= p %></button>
            <%} %>
         <% } %>
         <!-- 다음 페이지로 -->
         <button onclick="location.href='<%= request.getContextPath() %>/cultural/list?page=<%= pageInfo.getNextPage() %>'">&gt;</button>
         
         <!-- 맨 끝으로 -->
         <button onclick="location.href='<%= request.getContextPath() %>/cultural/list?page=<%= pageInfo.getMaxPage() %>'">&gt;&gt;</button>
      </div>  
              
   </div>            
</section>
</div>

<%@ include file="/views/common/footer.jsp" %>