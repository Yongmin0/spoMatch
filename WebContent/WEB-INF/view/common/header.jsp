<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <!-- Navigation -->
   <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
      <div class="container">
         <a class="navbar-brand js-scroll-trigger" href="mainPage.spo"><img src="/spoMatch/img/logo/logo.png" width="155"></a>
         <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
         <div class="collapse navbar-collapse" id="navbarResponsive">
            <ul class="navbar-nav ml-auto my-2 my-lg-0">
                     <li class="nav-item">
                     <a class="nav-link js-scroll-trigger" href="listMatch.spo">스포츠 매칭</a>
                     <div id="mega-menu">
                        <ul class="list_lnb list_matching">
                           <li><a href="insertFormMatch.spo">매칭등록</a></li>
                           <li><a href="listMatch.spo">매칭신청</a></li>
                        </ul>
                     </div>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link js-scroll-trigger" href="listDiet.spo">나만의 플래너</a>
                     <div id="mega-menu">
                        <ul class="list_lnb list_diet">
                           <li><a href="selectInfoDiet.spo">식단관리</a></li>
                           <li><a href="selectInfoWorkout.spo">운동계획</a></li>
                        </ul>
                     </div>
                  </li>
                  <li class="nav-item">
                     <a class="nav-link js-scroll-trigger" href="listboard.spo">팁/공유 게시판</a>
                     <div id="mega-menu">
                        <ul class="list_lnb list_board">
                           <li><a href="listboard.spo">팁공유게시판</a></li>
                           <li><a href="listNotice.spo">공지사항</a></li>
                           <!-- <li><a href="listBoard.spo">1:1문의</a></li> -->
                        </ul>
                     </div>
                  </li>
                  <li class="nav-item"><a class="nav-link js-scroll-trigger" href="goMapTotal.spo">체육관/주차장</a>
                  </li>
                  <!-- <li class="nav-item"><a class="nav-link js-scroll-trigger" href="myPage.spo">마이페이지</a></li> -->
                  <!--날씨-->
                        <li class="nav-item">
                            <div class="weather__current">
                                <img class="weather__current__icon" />
                                <ul class="weather__current__info">
                                    <li class="weather__current__lo"></li>
                                    <li class="weather__current__tem"></li>
                                    <li class="weather__current__id"></li>
                                </ul>
                            </div>
                            <div class="weather__forecast"></div>
                        </li>
                        <!--마이페이지,로그아웃등등-->
                  <li class="nav-item dropdown">
                         <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <span class="nav-chat-badge badge badge-pill badge-info"></span><i class="fas fa-user-circle fa-3x"></i>
                     </a>
                     <div class="nav-item dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                           <% 
                              System.out.println("mf >>>> " +mf);
                              if(mf){
                           %>
                              <a class="dropdown-item" href="goTotalPage.spo">관리자페이지</a>
                           <%      
                              }else{
                           %>
                              <a class="dropdown-item" href="spoUpdateForm.spo">회원정보수정</a>
                              <a class="dropdown-item" href="mypageListMatch.spo">나의 매칭</a>
                              <a class="dropdown-item" href="mylistboard.spo">나의 게시물</a>
                           <%      
                              }
                           %>
                           <a class="dropdown-item" href="logout.spo">로그아웃</a>
                           <hr>
                           <a class="dropdown-item" href="chat.spo">채팅 <i class="far fa-comment-dots"></i></a>
                     </div>
                  </li>
               </ul>
         </div>
      </div>
   </nav>
   
<!-- Bootstrap core JS-->
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
<!-- Third party plugin JS-->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
<!-- 날씨 -->
   <script src="/spoMatch/js/weather.js"></script>