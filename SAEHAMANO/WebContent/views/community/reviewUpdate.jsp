<!-- 210428(수) 15:36 김예원 (최종수정자) -->
<!-- 최종 -->
<%@ page import="mvc.community.review.model.vo.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ include file="/views/common/headerDetail.jsp"%>

<%
   Review review = (Review) session.getAttribute("confirmedReview");
%>
<!-- 구글 Noto 바탕체 -->
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Serif:wght@400;700&display=swap"
   rel="stylesheet">
<!-- 구글 Noto 굴림체 -->
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&family=Noto+Serif:wght@400;700&display=swap"
   rel="stylesheet">


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link
   href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/css/select2.min.css"
   rel="stylesheet" />
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.5/js/select2.min.js"></script>

<title>Q&A 글쓰기 페이지</title>

<style>
/* 전체 영역--------------------------------------------------------------------------*/

/*---------------제일 바깥 영역 설정-----------------*/
#box {
   background-color: #948c84;
   width: 100%;
   height: 1000px; /*높이는 각 세부페이지 컨텐츠 보고 알아서 적~당히 설정하기*/
   margin-top: 330px;
   margin-bottom: 100px;
   margin-left: -10px;
   padding: 10px;
}
/*-------------------컨텐츠 영역---------------------*/
#conbox {
   width: 1600px; /* 넓이도 각 세부 페이지 컨텐츠에 맞춰서 설정*/
   position: relative;
   top: 20px;
   margin: auto;
}

/*-----------------------------------------------------------------------------------*/

/* 페이지 상단 TEXT -----------------------------------------------------------------*/

/* ----- 페이지 이름(후기작성 게시판) ----- */
.pageName {
   text-align: center;
   font-family: GmarketSansLight;
   color: white;
}
/* ----- 페이지 설명(국보문화재 관람 후기를 남겨~~~)*/
.pageExplain {
   color: wheat;
}

/*-----------------------------------------------------------------------------------*/

/* 질문 작성 네모 칸에 대한 스타일 */
#title {
   width: 500px;
   height: 20px;
   align: center;
   outline-style: solid;
   outline-color: wheat;
   position: relative; /*z-index 사용해서 배치 앞으로 하기 위해 작성*/
   z-index: 8;
}

/* 말풍선 -----------------------------------------------------*/

/* 말풍선 (질문제목) */
.boardballoonTitle {
   margin-top: 150px;
   margin-left: 50px;
   position: relative;
   font-family: GmarketSansLight;
}

/* 말풍선 (유저정보) */
.boardballoonUser {
    margin-top: -500px;
	margin-left: 1225px;
	position: relative;
	font-family: GmarketSansLight;
}

/* 말풍선 내부 "작성 TIP" */
#titleWriteTip, #userWriteTip {
   		color: green;
		font-weight: 1200;
		position: relative;
		font-family: GmarketSansLight;
}

/*------------------------------------------------------------*/

/* 작성 TABLE -------------------------------------------------*/
/* 테이블 상단 영역 */
.reviewTitleArea {
		margin-top: -520px;
		margin-left: 420px;
		height: 10px;
		font-family: GmarketSansLight;
}

/* dropdown 너비 */
#cultureName {
   width: 400px;
}

div#board-write-container {
   width: 0px;
   margin: 0 auto;
   text-align: center;
}

div#board-write-container h2 {
   margin: 10px;
}

/* 테이블 틀에 대한 스타일 */
table#tbl-board {
   width: 800px;
   margin: 10 auto;
   border: 1px solid black;
   border-collapse: collapse; /* 단선으로 바꿈! */
   background-color: wheat;
   position: relative; /*z-index 사용해서 배치 앞으로 하기 위해 작성*/
   z-index: 6;
}

/* 테이블 th에 대한 스타일 지정 */
#tbl-board th {
   width: 125px;
   border: 1px solid;
   padding: 5px 0;
   text-align: center;
   font-family: GmarketSansLight;
}

/* 테이블 td에 대한 스타일 지정 */
#tbl-board td {
   border: 1px solid;
   padding: 5px 0 5px 10px;
   text-align: left;
   font-family: GmarketSansLight;
}
/*------------------------------------------------------------*/

/*마우스올렸을 때 강조 (제목/작성자/버튼)*/
input:hover {
   background-color: honeydew;
}
</style>

</head>
<body>
   <div id="box">
      <section id="section">
         <div id="conbox">

            <!-- 상단의 TEXT 구현 ---------------------------------------------------------- -->
            <div class="pageName">
               <h1>후기 수정 페이지</h1>
               <hr>
               <h3 class="pageExplain">국보 문화재 관람 후기를 남겨 다른 방문객들에게 도움이 되어주세요!</h3>
            </div>
            <!------------------------------------------------------------------------------- -->

            <!-- 말풍선 구현 ---------------------------------------------------------- -->
            <!-- '질문' 말풍선 + 내부에 text(글) 넣기 구현 -->
            <div style="position: relative;">
               <img class="boardballoonTitle" style="width:330px; height:450px;"
                  src="<%=request.getContextPath()%>/resources/images/boardBalloonTitle.png">
               <div
                  style="left: 120px; width: 450px; bottom: 110px; font-size: 12pt; font-weight: bold; font-family: GmarketSansLight; position: absolute;">
						<p id="titleWriteTip">작성 TIP</p>
                  정확한 답변을 원하시나요?<br> 궁금한 점을 상세하게<br> 알 수 있도록 작성해 보세요!<br>
                  (최소 5자)<br> <br>
                  <p id="writeTip">예시문</p>
                  "숭례문 재건축일?"<br> "수원화성 위치는?"<br>
               </div>
            </div>

            <!-- '유저정보(닉네임,비밀번호)' 말풍선 + 내부에 text(글) 넣기 구현 -->
            <div style="position: relative;">
               <img class="boardballoonUser" style="width:480px; height:330px;"
                  src="<%=request.getContextPath()%>/resources/images/boardBalloonUser.png">
               <div
					style="left: 1325px; width: 450px; bottom: 100px; font-size: 12pt; font-weight: bold; font-family: GmarketSansLight; position: absolute;">
					<p id="userWriteTip">작성 TIP</p>
                  닉네임은 '작성자'에 사용됩니다.<br> 패스워드는 글을 수정, 삭제시 사용됩니다.<br> 계정정보를
                  잊지 않도록 유의해주세요!<br> <br>
               </div>
            </div>
            
            <form action="<%=request.getContextPath()%>/community/review/update" method="POST" enctype="multipart/form-data">
               <input type="hidden" name="re_no" value="<%=review.getRe_no()%>" />
               <input type="hidden" name="rowNum" value="<%=review.getRowNum()%>" />
               <input type="hidden" id="originalFileName" name="originalFileName" value="<%=review.getOriginal_filename()%>">
               <input type="hidden" id="renameFileName" name="renameFileName" value="<%=review.getRenamed_filename()%>">
               
               <div class="reviewTitleArea">
                     <h2>
						<label style="color: wheat; font-family: GmarketSansLight;">&nbsp;&nbsp;&emsp;제목&nbsp;&emsp;
							<input type="text" id="title" style="font-family: GmarketSansMedium; maxlength:80;" value="<%=review.getRe_name()%> "name="title">
						</label>
					</h2>
                    

                     <table id='tbl-board'>
                        <tr>
                        <th>분류</th>
                        <td>
                        <select name="cul_name" id="culture">
                              <option value="<%= review.getCul_name() %>" selected><%= review.getCul_name() %></option>

                        </select> 
                        <script>
                                $(document).ready(function(){                                   
                                    var culturelist = ["서울 숭례문","서울 원각사지 십층석탑","서울 북한산 신라 진흥왕 순수비","여주 고달사지 승탑","보은 법주사 쌍사자 석등","충주 탑평리 칠층석탑","천안 봉선홍경사 갈기비","보령 성주사지 낭혜화상탑비","부여 정림사지 오층석탑","남원 실상사 백장암 삼층석탑","익산 미륵사지 석탑","구례 화엄사 각황전 앞 석등","강진 무위사 극락보전","영천 은해사 거조암 영산전","안동 봉정사 극락전","안동 법흥사지 칠층전탑","영주 부석사 무량수전 앞 석등","영주 부석사 무량수전","영주 부석사 조사당","경주 불국사 다보탑","경주 불국사 삼층석탑","경주 불국사 연화교 및 칠보교","경주 불국사 청운교 및 백운교","경주 석굴암 석굴","경주 태종무열왕릉비","경주 불국사 금동비로자나불좌상","경주 불국사 금동아미타여래좌상","경주 백률사 금동약사여래입상","성덕대왕신종","경주 분황사 모전석탑","경주 첨성대","합천 해인사 대장경판","창년 신라 진흥왕 척경비","창녕 술정리 동 삼층석탑","구례 화엄사 사사자 삼층석탑","상원사 동종","경주 황복사지 삼층석탑","경주 고선사지 삼층석탑","경주 나원리 오층석탑","경주 정혜사지 십삼층석탑","청주 용두사지 철당간","순천 송광사 목조삼존불감","혜심 고신제서","장흥 보림사 남북 삼층석탑 및 석등","영주 부석사 소조여래좌상","부석사 조사당 벽화","하동 쌍계사 진감선사탑비","평창 월정사 팔각 구층석탑","평창 월정사 석조보살좌상","예산 수덕사 대웅전","영암 도갑사 해탈문","강릉 임영관 삼문","합천 해인사 장경판전","구례 연곡사 동 승탑","구례 연곡사 북 승탑","보은 법주사 팔상전","순천 송광사 국사전","화순 쌍봉사 철감선사탑","청양 장곡사 철조약사여래좌상 및 석조대좌","원주 법천사지 지광국사탑비","청자 사자형뚜껑 향로","청자 어룡형 주전자","김제 금산사 미륵전","철원 도피안사 철조비로자나불좌상","보은 법주사 석련지","청자 기린형뚜껑 향로","청자 상감연지원앙문 정병","구례 화엄사 각황전","청자 상감운학문 매병","심지백 개국원종공식녹권","훈민정음","동국정운 권1, 6","금동계미명삼존불입상","금동삼존불감","청자 오리모양 연적","표충사 청동 은입사 향완","이순신 난중일기 및 서간첩 임진장초","의성 탑리리 오층석탑","금동미륵보살반가사유상","경주 구황동 금제여래좌상","경주 구황동 금제여래입상","경주 감산사 석조미륵보살입상","경주 감산사 석조아미타여래입상","금동미륵보살반가사유상","서산 용현리 마애여래삼존상","금동신묘명삼존불입상","개성 경천사지 십층석탑","금관총 금관 및 금제 관식","금관총 금제 허리띠","평양 석암리 금제 띠고리","경주 부부총 금귀걸이","도기 기마인물형 명기","청동 은입사 포류수금문 정병","백자 철화포도원숭이문 항아리","청자 참외 모양 병","청자 투각칠보문뚜껑 향로","청자 구룡형 주전자","청자 음각연화당초문 매병","청자 상감모란문 항아리","김천 갈항사지 동·서 삼층석탑","개성 남계원지 칠층석탑","원주 법천사지 지광국사탑","충주 정토사지 홍법국사탑","광양 중흥산성 쌍사자 석등","전 원주 흥법사지 염거화상탑","산청 범학리 삼층석탑","계유명전씨아미타불비상","백자철화포도문호","계유명삼존천불비상","군위 아미타여래삼존 석굴","이제현 초상","안향 초상","경주 감은사지 동·서 삼층석탑","청자 철화양류문 통형 병","청자 상감모란국화문 참외모양 병","청자 상감당초문 완","청자 상감모란문 표주박모양 주전자","장흥 보림사 철조비로자나불좌상","금동미륵보살반가사유상","금동연가7년명여래입상","용주사 동종","안동 하회탈 및 병산탈","양양 진전사지 삼층석탑","익산 왕궁리 오층석탑 사리장엄구","강릉 한송사지 석조보살좌상","녹유골호(부석제외함)","불국사 삼층석탑 사리장엄구","서울 삼양동 금동관음보살입상","금동관음보살입상","금동보살입상","구미 죽장리 오층석탑","고려말 화령부 호적관련고문서","징비록","청자 동화연화문 표주박모양 주전자","금동보살삼존입상","신윤복필 풍속도 화첩","금동 용두보당","대구 비산동 청동기 일괄 - 검 및 칼집 부속","대구 비산동 청동기 일괄 - 투겁창 및 꺾창","전 고령 금관 및 장신구 일괄","김홍도필 군선도 병풍","나전 화문 동경","정문경","동국정운","화순 대곡리 청동기 일괄","영암 월출산 마애여래좌상","귀면 청동로","전 논산 청동방울 일괄","천전리 암각화","십칠사찬고금통요","십칠사찬고금통요 권17","동래선생교정북사상절 권4, 5","동래선생교정북사상절 권6","송조표전총류 권7","조선왕조실록 정족산사고본","조선왕조실록 태백산사고본","조선왕조실록 오대산사고본","조선왕조실록 적상산사고본","조선왕조실록 봉모당본","조선왕조실록 낙질 및 산엽본","비변사등록","일성록","무령왕 금제관식","무령왕비 금제관식","무령왕 금귀걸이","무령왕비 금귀걸이","무령왕비 금목걸이","무령왕 금제 뒤꽂이","무령왕비 은팔찌","무령왕릉 청동거울 일괄","무령왕릉 석수","무령왕릉 지석","무령왕비 베개","무령왕 발받침","백자 철화매죽문 항아리","청자 인물형 주전자","청자 양각죽절문 병","백자 청화매조죽문 유개항아리","청동 은입사 봉황문 합","진양군영인정씨묘출토유물","청자 퇴화점문 나한좌상","금동 수정 장식 촛대","백자 상감연화당초문 대접","백자 청화‘홍치2년’명 송죽문 항아리","분청사기 인화국화문 태항아리","분청사기 음각어문 편병","분청사기 박지연화어문 편병","김정희필 세한도","장양수 홍패","구미 선산읍 금동여래입상","구미 선산읍 금동보살입상","구미 선산읍 금동보살입상","상지은니 묘법연화경","양평 신화리 금동여래입상","영양 산해리 오층모전석탑","천마총 금관","천마총 관모","천마총 금제 허리띠","황남대총 북분 금관","황남대총 북분 금제 허리띠","경주 98호 남분 유리병 및 잔","황남대총 남분 금목걸이","토우장식 장경호","신라백지묵서 대방광불화엄경 주본 권1~10, 44~50","충주 청룡사지 보각국사탑","단양 신라적성비","단석산 신선사 마애불상군","금동보살입상","봉화 북지리 마애여래좌상","대방광불화엄경 진본 권37","대방광불화엄경 주본 권6","대방광불화엄경 주본 권36","충주 고구려비","합천 해인사 고려목판","경주 천마총 장니 천마도","도리사 세존사리탑 금동 사리기","보협인석탑","감지은니 불공견삭신변진언경권13","백지묵서 묘법연화경","대불정여래밀인수증요의제보살만행수능엄경(언해)","금동탑","흥왕사명 청동 은입사 향완","감지은니 대방광불화엄경 정원본권 31","정선 필 인왕제색도","정선 필 금강전도","아미타삼존도","백자 청화매죽문 항아리","청자 상감용봉모란문 합 및 탁","평창 상원사 목조문수동자좌상","백자 청화매죽문 유개항아리","경복궁 근정전","경복궁 경회루","창덕궁 인정전","창경궁 명정전","종묘 정전","천상열차분야지도 각석","창경궁 자격루","혼천의 및 혼천시계","전 영암 거푸집 일괄","이화 개국공신녹권","산청 석남암사지 석조비로자나불좌상","산청 석남암사지 석조비로자나불좌상 납석사리호","감지은니 묘법연화경","감지금니 대방광불화엄경보현행원품","경주 장항리 서 오층석탑","고산구곡시화도 병풍","소원화개첩","송시열 초상","윤두서 자화상","초조본 대반야바라밀다경 권249","울진 봉평리 신라비","초조본 현양성교론 권11","초조본 유가시지론 권17","초조본 신찬일체경원품차록 권20","초조본 대보적경 권59","공주 의당 금동보살입상","조선방역지도","동궐도","동궐도","이원길 개국원종공신녹권","초조본 대승아비달마잡집론 권14","청자 음각 효문명 연화문 매병","청자 양각연화당초상감모란문 은테 발","청자 음각연화문 유개매병","전 덕산 청동방울 일괄","초조본 대방광불화엄경 주본 권1","초조본 대방광불화엄경 주본 권29","백자 청화죽문 각병","분청사기 상감운룡문 항아리","분청사기 박지철채모란문 자라병","백자 유개항아리","백자 달항아리","백자 청화산수화조문 항아리","포항 냉수리 신라비","초조본 대방광불화엄경 주본 권13","초조본 대방광불화엄경 주본 권2,75","초조본 아비달마식신족론 권12","초조본 아비담비파사론 권11, 17","초조본 불설최상근본대락금강불공삼매대교왕경 권6","청자 모자원숭이모양 연적","초조본 현양성교론 권12","초조본 유가사지론 권32","초조본 유가사지론 권15","도기 기마인물형 뿔잔","초조본 유가사지론 권53","초조본 대방광불화엄경 주본 권36","초조본 대방광불화엄경 주본 권74","성거산 천흥사명 동종","백자 병형 주전자","영주 흑석사 목조아미타여래좌상 및 복장유물","통감속편","초조본 대반야바라밀다경 권162, 170, 463","울주 대곡리 반구대 암각화","백자 ‘천’ ‘지’ ‘현’ ‘황‘명 발","백제 금동대향로","부여 능산리사지 석조사리감","익산 왕궁리 오층석탑","양산 통도사 대웅전 및 금강계단","용감수경 권3~4","평창 상원사 중창권선문","부여 규암리 금동관음보살입상","백자 청화철채동채초충문 병","나주 신촌리 금동관","칠장사 오불회 괘불탱","안심사 영산회 괘불탱","갑사 삼신불 괘불탱","신원사 노사나불 괘불탱","장곡사 미륵불 괘불탱","화엄사 영산회 괘불탱","청곡사 영산회 괘불탱","승정원일기","여수 진남관","통영 세병관","삼국유사 권3~5","삼국유사","삼국유사 권1~2","태안 동문리 마애삼존불입상","해남 대흥사 북미르암 마애여래좌상","백자 달항아리","백자 달항아리","안동 봉정사 대웅전","경주 남산 칠불암 마애불상군","강진 무위사 극락전 아미타여래삼존벽화","순천 송광사 화엄경변상도","문경 봉암사 지증대사탑비","완주 화암사 극락전","조선태조어진","포항 중성리 신라비","동의보감","동의보감","동의보감","월인천강지곡 권상","문경 대승사 목각아미타여래설법상","삼국사기","삼국사기","논산 관촉사 석조미륵보살입상","이제 개국공신교서","기사계첩","청자 '순화4년'명 항아리","부여 왕흥사지 출토 사리기","예천 용문사 대장전과 윤장대","공주 충청감영 측우기","대구 경상감영 측우대","창덕궁 이문원 측우대","정선 정암사 수마노탑"];            
                                    console.log(culturelist); 
                                    $("#culture").select2({
                                       data:culturelist
                                    });

                                 });
                                </script>
                        </td>
                     </tr>
                        <tr>
                           <th>작성자</th>
                           <td>닉네임 &emsp;: <%=review.getReview_nickname()%>
                           </td>

                        </tr>
                        <tr>
                           <th>이미지 파일</th>
                           <td>
                           
                           <input type="file" name="reloadFile" id="reloadFile" value="<%= review.getOriginal_filename()%>">
                              <% if(review.getOriginal_filename() != null && !review.getOriginal_filename().equals("null")) { %>
                              <img id="filedownIcon" src="<%= request.getContextPath() %>/resources/images/filedown.png" width="20" height="20"/>
                              <span id="filename"><%= review.getOriginal_filename() %></span>
                              <% } %>
                           <input type="button" id="deletefile" name="deletefile" value="삭제">
                           <script>
                              $(document).ready(function(){
                                 $("#deletefile").on("click",(e) => {
                                    $("#reloadFile").val('');
                                    $("#originalFileName").val('');
                                    $("#renameFileName").val('');
                                    $("#filename").remove();
                                    $("#filedownIcon").remove();
                                 });
                              });
                           </script>
                           </td>
                        </tr>
                        <tr>
                           <th>내용</th>
                           <td><textarea name="content"
                                 style="width: 650px; resize: none;" cols="60" rows="20"><%=review.getRe_content()%></textarea></td>
                        </tr>
                        <tr>
                           <th colspan="2"><input type="submit" value="등록"> 
                           <button type="button" style="font-family: GmarketSansMedium;" onclick="location.href='<%=request.getContextPath()%>/community/review'">취소</button>
                           <button type="button" id="btnDelete" style="color: #2a1b0a; font-family: GmarketSansMedium;">삭제</button>
                        </tr>
                     </table>
                     <h5 style="color: #696666; font-family: GmarketSansLight">저작권 등 다른 사람의 권리를 침해하거나 명예를 훼손하는
                        게시물은 관련법률에 의해 제재를 받으실 수 있습니다.</h5>
                  </div>
            </form>
         </div>
      </section>
   </div>
<script>
   $(document).ready(() => {
      $("#btnDelete").on("click", (e) => {
         if(confirm("정말로 게시글을 삭제 하시겠습니까?")) {
            location.replace("<%=request.getContextPath()%>/community/review/delete?reviewNo=<%=review.getRe_no()%>");
         }
      });
   });
</script>
</body>
</html>

<%@ include file="/views/common/footer.jsp"%>