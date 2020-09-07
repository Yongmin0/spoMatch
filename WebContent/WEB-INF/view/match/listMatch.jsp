<%@page import="kosmo62.spomatch.common.SessionUtil"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="kosmo62.spomatch.match.vo.SpoMatchVO"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>매칭 리스트</title>
<link rel="stylesheet" type="text/css" href="css/match/match.css" />
<link rel="stylesheet" type="text/css" href="packages/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="packages/slick/slick-theme.css"/>
<script type="text/javascript" src="packages/slick/slick.min.js"></script>

<script type="text/javascript">
   const DATEVAL = new Date();
   $(document).ready(function() {
         setDateBtn();   
         //첫페이지 기본 선택 날짜 오늘 날짜 
        $("#smc_date").val(DATEVAL.getFullYear() + "-" + (DATEVAL.getMonth() + 1) + "-" +DATEVAL.getDate());
        searchPage(1);
         
        

        $(".select_box1_2 > li > a").click(function(){
         $(this).parent().parent().find(".isactive").removeClass("isactive");
         $(this).addClass("isactive");
      });
       /* =====================================   
          2020. 08. 30 일요일 문성아 수정
                게시판 형식 디자인 변경으로 제목 이벤트 추가      
       ==================================== */
      //제목클릭 이벤트
      $(document).on("click",".goDetail", function(){
         var smc_no = $(this).parents("div").attr("data-no");
         
         $("#smc_no").val(smc_no);
        //$("#smb_no").val(smb_no);
         //상세페이지로 이동
         $("#viewForm").attr({
            "method":"post",
            "action":"viewMatch.spo"
         }).submit();
      });//end of goDetail click 
      
      $("#insertboard").click(function(){
         $("#smc_no").val("");
         $("#viewForm").attr({
            "method":"post",
            "enctype":"application/x-www-form-urlencoded",
            "action":"/spoMatch/insertFormMatch.spo",
         }).submit();
      });
      
      
      
      //-==================== 마감된 글인 경우 =======
      $(".finishBtn").click(function(){
         alert("마감된 매칭입니다.");
      });
      
      $(".select_box1_1-Date").click(function(){
         var plusval = $(this).children('div').attr("class");
         var plusDate = new Date;
         plusDate.setDate(DATEVAL.getDate() + parseInt(plusval));
         $("#smc_date").val(plusDate.getFullYear() + "-" + (plusDate.getMonth() + 1) + "-" +plusDate.getDate());
         $(this).parent().parent().parent().find(".isactive").removeClass("isactive");
         $(this).addClass("isactive");
         searchPage(1);
      });
      $(document).on("click",".viewMatchBtn", function(){
         $("#smc_no").val($(this).parent().parents("div").attr("data-no"));
         $("#viewForm").attr("action","viewMatch.spo");
         $("#viewForm").submit();
      });
      
   /* ========================================= 슬릭 슬라이더 세팅 =========================================== */   
      // slick 파괴
      $.noConflict();
      $('#slider-div').slick("unslick");
      $('.select_box1_1-bt').slick({
         infinite: false , /* 맨끝이미지에서 끝나지 않고 다시 맨앞으로 이동 */
         slidesToShow: 7, /* 화면에 보여질 이미지 갯수*/
          slidesToScroll: 1,  /*  스크롤시 이동할 이미지 갯수 */
          autoplay: false, /* 자동으로 다음이미지 보여주기 */
          dots:false,
          prevArrow : "<button type='button' class='slick-prev'>Previous</button>",      // 이전 화살표 모양 설정
         nextArrow : "<button type='button' class='slick-next'>Next</button>",      // 다음 화살표 모양 설정
          responsive: [
            { /* 반응형웹*/
                  breakpoint: 1024,
                  settings: {
                  slidesToShow: 7,
                  slidesToScroll: 1,
                  infinite: true,
                  dots: true
            }
         },
              {  /* 반응형웹*/
                    breakpoint: 960, /*  기준화면사이즈 */
                    settings: {slidesToShow:7 } /*  사이즈에 적용될 설정 */
             },
             { /* 반응형웹*/
                    breakpoint: 768, /*  기준화면사이즈 */
                    settings: {slidesToShow:7 } /*  사이즈에 적용될 설정 */
             }]
      });
      
   });

//=====================================================================================   
   function searchPage(curPage) {
      var urlVal = "searchMatch.spo";
      var typeVal = "post";
      var dataVal = {
         smc_category : $("#smc_category").val(),
         smc_local : $("#smc_local").val(),
         smc_subject : $("#smc_subject").val(),
         smc_date : $("#smc_date").val(),
         spg_curPage : curPage,
      };
      $.ajax({
         url : urlVal,
         type : typeVal,
         data : dataVal,
         success : sS,
         error : sE
      });
      
   }
   
   function sS(data)  {
      printList(data);

      $(".countText").text((data.length > 0 ? data[0].spg_totalSize : '0'));
      
   }
   function sE() {
      alert("error");
   }

   // ================================= 날짜 검색 버튼 세팅 ====================================
      function setDateBtn() {
         var week = new Array('일', '월', '화', '수', '목', '금', '토');
         
         var dateStr = "";
         for(var i = 0 ; i <= 14; i++){
            var dateVal2 = new Date;
            dateStr = "";
            dateVal2.setDate(dateVal2.getDate() + i);
            if(i == 0){
               dateStr += "<div class='select_box1_1-Date Date"+ dateVal2.getDay() +" isactive'>";
            }else{
               dateStr += "<div class='select_box1_1-Date Date"+ dateVal2.getDay() +"'>";
            }
            dateStr += "<div class='" + i + "'>";
            dateStr += "<p>" + dateVal2.getDate() + "</p>"
            dateStr += "<span>" + week[dateVal2.getDay()] + "</span></div>";
            dateStr += "</div>";
            $(".select_box1_1-bt").append(dateStr);
         }   
        

      }
   
   
   function localSelect(no){
      $("#smc_local").val(no);
      searchPage(1);
   }
   
   
   function printList(data){
      var listStr = "";
      var pageData = "";
      $(".board_content").empty();
      $("#paging-Area").empty();
      if(data != null && data.length >0){
         for(var i = 0 ; i < data.length ; i++){
            listStr += "<div class='board_content' data-no ='"+ data[i].smc_no +"'>";
            listStr += "<div class='content content_num' style='width: 10%;'>" + parseInt(data[i].smc_no.replace(/[^0-9]/g,'')) + "</div>";
            listStr += "<div class='content content_local' style='width: 10%;'>" + data[i].smc_localval + "</div>";
            listStr += "<div class='content content_category' style='width: 10%;'>" + data[i].smc_categoryval + "</div>";
            listStr += "<div class='content content_date' style='width: 10%;'>" + data[i].smc_date + "</div>";
            listStr += "<div class='content content_time' style='width: 15%;'>" + data[i].smc_sttime + " ~ " + data[i].smc_endtime + "</div>";
            listStr += "<div class='content content_subject goDetail' style='width: 30%;'>" + data[i].smc_subject + "</div>";
            listStr += "<div class='content content_apply' style='width: 5%;'>" + data[i].smc_apply + "/"  + data[i].smc_maxapl + "</div>";
            if(data[i].smc_apply >= data[i].smc_maxapl){
               listStr += "<div class='content content_detail' style='width: 10%;'><button class='finishBtn' id='";
               listStr += data[i].smc_no + "'disabled >마감</button></div></div>";
            }else{
               listStr += "<div class='content_detail' style='width: 10%;'><button class='viewMatchBtn' id='" 
                  listStr += data[i].smc_no + "'>상세보기</button></div></div>";
            }
         }
         
         //한 페이지에 보여질 게시물 수 
         var spg_pageSize = data[0].spg_pageSize;
         //그룹의 크기
         var spg_groupSize = data[0].spg_groupSize;
         // 전체 게시물의 개수
         var spg_totalSize = data[0].spg_totalSize;
         //현재 페이지
         var spg_curPage = data[0].spg_curPage;
         // 전체 페이지의 개수
         var pageCount = 0;
         // 전체게시물수와 페이지크기를 가지고 전체 페이지 개수를 계산함.
         // 소수점에 따라 계산상의 오류가 없도록 한것임.
         pageCount = Math.ceil(spg_totalSize / (spg_pageSize));
         // 현재그룹 설정
         var curGroup = Math.floor((spg_curPage-1) / spg_groupSize);
         var linkPage = curGroup * spg_groupSize;

         pageData += "<p align='center'>"
         pageData += "<input type='hidden' id='spg_curPage' name='spg_curPage'/>"
         pageData += "<ul class='paging model'>"
         // 첫번째 그룹인 아닌경우
         if(curGroup > 0) {
         pageData += "<li><span onclick='searchPage(1)' class='linkPageBtn'><i class='fa fa-angle-double-left fa-2' aria-hidden='true'></i>&nbsp;&nbsp;&nbsp;</span></li>"
         pageData += "<li><span onclick='searchPage("+linkPage+")' class='prev linkPageBtn'><i class='fa fa-angle-left fa-2' aria-hidden='true'></i>&nbsp;&nbsp;&nbsp;</span></li>";
         }else{
         pageData += "<li><a class='noLink'><i class='fa fa-angle-double-left fa-2' aria-hidden='true'></i>&nbsp;&nbsp;&nbsp;</a></li>";
         pageData += "<li><a class='noLink'><i class='fa fa-angle-left fa-2' aria-hidden='true'></i>&nbsp;&nbsp;&nbsp;</a></li>"
         }
         // 다음 링크를 위해 증가시킴
         linkPage++;
         var loopCount = spg_groupSize;
         // 그룹범위내에서 페이지 링크만듬.
         while((loopCount > 0) && (linkPage <= pageCount)){
            if(linkPage == spg_curPage){
               pageData += "<li><span onclick='searchPage("+linkPage+")' class='linkPageBtn active'>"+linkPage+"&nbsp;</span></li>";
            }else{
               pageData += "<li><span onclick='searchPage("+linkPage+")' class='linkPageBtn'>"+linkPage+"&nbsp;</span></li>";
            }
            linkPage++;
            loopCount--;
         }
         // 다음그룹이 있는 경우
         if(linkPage <= pageCount)
         {
         pageData += "<li class='next'><span onclick='searchPage("+linkPage+")' class='linkPageBtn'><i class='fa fa-angle-right fa-2' aria-hidden='true'></i>&nbsp;&nbsp;&nbsp;</span></li>";
         pageData += "<li><span onclick='searchPage("+pageCount+")' class='linkPageBtn'><i class='fa fa-angle-double-right fa-2' aria-hidden='true'></i>&nbsp;&nbsp;&nbsp;</span></li>";
         }
         else
         {
         pageData += "<li><a class='noLink'><i class='fa fa-angle-right fa-2' aria-hidden='true' ></i>&nbsp;&nbsp;&nbsp;</a></li>";
         pageData += "<li><a class='noLink'><i class='fa fa-angle-double-right fa-2' aria-hidden='true'></i>&nbsp;&nbsp;&nbsp;</a></li>";
         }
         pageData += "</ul>";
         pageData += "</p>";

      }else{
         listStr += "<div class='board_nondate'>";
         listStr += "<span>등록된 데이터가 존재하지 않습니다...😥</span>";
         listStr += "</div></div>";
      }
      
      $("#paging-Area").append(pageData);
      $(".list-Area").html(listStr);
      if($(".linkPageBtn").text() == spg_curPage){
  		$(this).addClass("active");	  
      }
 
         
	}
   
</script>
</head>
<body>
<%@include file="../common/header.jsp" %>
<!-- Content -->
<section>
   <div class="container">
<%
Object obj = request.getAttribute("matchList");
List<SpoMatchVO> list = (List<SpoMatchVO>)obj;
%>

      <h1>Matching List</h1>
      <div>
         <div class="sub">
            <div class="select_box1_1">
               <div class="select_box1_1-bt">
                </div>
            </div>
            <div>
               <input type="hidden" name="smc_date" id="smc_date">
               <input type="hidden" name="smc_local" id="smc_local">
               <ul class="select_box1_2">
                  <li><a onclick="localSelect('')" class="isactive">전체</a></li>
                  <li><a onclick="localSelect('01')">서울</a></li>
                  <li><a onclick="localSelect('02')">경기</a></li>
                  <li><a onclick="localSelect('03')">인천</a></li>
               </ul>
            </div>
         </div> <%-- select_box1 end --%>
         <div class="select_box2">
            <div class="sub_category">
               <select name="smc_category" id="smc_category" onchange="searchPage(1)">
                  <option value="">전체(종목)</option>
                  <option value="01">축구</option>
                   <option value="02">농구</option>
                   <option value="03">야구</option>
                   <option value="00">기타</option>
               </select>
            </div>
            <div class="sub_search d1">
               <input type="text" name="smc_subject" id="smc_subject" />
               <button class="searchMatchBtn"><i class="fa fa-search fa-4" aria-hidden="true"></i></button>
            </div>
         </div> <%-- select_box2 end --%>
         <div class="sub_total_insertbtn">
            <span>총 <span class="countText"><%=list.get(0).getSpg_totalSize()!=null?list.get(0).getSpg_totalSize():0 %></span>개의 매치</span>
            <div>
               <input class="sub_insertbtn" type="button" value="글쓰기" id="insertboard" >
            </div>
         </div>
         <div>
            <form name="viewForm" id="viewForm" method="post">
               <input type="hidden" name="smc_no" id="smc_no" >
               <input type="hidden" name="smb_no" id="smb_no" >
            </form>
               <div>
                  <div class="board">
                     <div class="board_info">
                        <div class="info info_num" style="width: 10%;">No.</div>
                        <div class="info info_local" style="width: 10%;">지역</div>
                        <div class="info info_category" style="width: 10%;">종목</div>
                        <div class="info info_date" style="width: 10%;">날짜</div>
                        <div class="info info_time" style="width: 15%;">시간</div>
                        <div class="info info_subject" style="width: 30%;">제목</div>
                        <div class="info info_apply" style="width: 5%;">인원</div>
                        <div class="info info_detail" style="width: 10%;">상세보기</div>
                     </div>
                  <div class="list-Area">
            <%
                  if(list != null && list.size() > 0){   
                     for(SpoMatchVO row : list){
            %>
                     <div class="board_content" data-no ="<%= row.getSmc_no() %>">
                        <div class="content content_num" style="width: 10%;"><%=Integer.parseInt(row.getSmc_no().substring(2)) %></div>
                        <div class="content content_local" style="width: 10%;"><%=row.getSmc_localval() %></div>
                        <div class="content content_category" style="width: 10%;"><%=row.getSmc_categoryval() %></div>
                        <div class="content content_date" style="width: 10%;"><%=row.getSmc_date() %></div>
                        <div class="content content_time" style="width: 15%;"><%=row.getSmc_sttime() %> ~ <%=row.getSmc_endtime() %></div>
                        <div class="content content_subject goDetail" style="width: 30%;"><%=row.getSmc_subject() %></div>
                        <div class="content content_apply" style="width: 5%;"><%=row.getSmc_apply() %> / <%=row.getSmc_maxapl() %></div>
                        <div class="content content_detail" style="width: 10%;">
                           <button class="viewMatchBtn" >상세보기</button>
                        </div>
                     </div>
                        
            <%
                     }
            %>
                     </div>
            <%
                  }else{
            %>   
                     <div class="board_nondate">
                        <span>등록된 데이터가 존재하지 않습니다...😥</span>
                     </div>
                  </div>
            <%
                     }
            if(list != null && list.size() > 0){
               SpoMatchVO svo = list.get(0);
            %>
               <div id="paging-Area" class="paging_Box">
                  <input type="hidden" name="spg_curPage" id="spg_curPage" />
                  <jsp:include page="../paging.jsp" flush="true">
                     <jsp:param name="url" value="listMatch.spo"/>
                     <jsp:param name="spg_pageSize" value="<%=svo.getSpg_pageSize() %>" />
                     <jsp:param name="spg_totalSize" value="<%=svo.getSpg_totalSize() %>" />
                     <jsp:param name="spg_groupSize" value="<%=svo.getSpg_groupSize() %>" />
                     <jsp:param name="spg_curPage" value="<%=svo.getSpg_curPage() %>" />
                  </jsp:include>
               </div>
         <%       
            } 
         %>
            </div>
            <br>
         </div>
      </div>
   </section>
<!--footer-->
<%@include file="../common/footer.html" %>
<!--//footer-->
</body>
</html>