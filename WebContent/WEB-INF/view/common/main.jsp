<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main</title>
    <!--css-->
    <link href="/spoMatch/css/loginOK.css" rel="stylesheet" type="text/css"/>
    
</head>
<body>

<%@include file="../common/header.jsp" %>

<section>
    <!--header-->
    <div id="header">
        <!--사진부분-->
        <div class="header_pic">
            <div><img class="header_pic1" src="img/loginOK/header/header4.jpg" /></div>
            <div class="header_pic2"></div>
            <div class="header_pic3"><img src="img/loginOK/header/header5.jpg" /></div>
        </div>
        <!--글자부분-->
        <div class="header_text">
            <p class="main_text">SPOMATCH</p>
            <p class="sub_text">혼자하는 운동은 이제 그만! 즐겁게 운동하자.</p>
        </div>
    </div>
    <!--gallery 부분-->
    <div class="gallery_subject_background">
        <!--제목부분-->
        <h2 class="gallery_subject">Sport Matching</h2>
        <!--주황색뒷배경-->
        <div class="gallery_background">
            <div class="gallery_background1">&nbsp;</div>
            <div class="gallery_background2">&nbsp;</div>
        </div>
        <!--gallery 사진부분-->
        <div class="gallery">
            <div class="gallery_first" >
                <div class="first_1"><img src="img/loginOK/gallery/gallery1.jpg" ></div>
                <div class="first_2"><img src="img/loginOK/gallery/gallery2.jpg" ></div>
            </div>
            <div class="gallery_second">
                <div class="second_1"><img src="img/loginOK/gallery/gallery3.jpg" alt=""></div>
                <div class="second_2"><img src="img/loginOK/gallery/gallery4.jpg" alt=""></div>
            </div>
        </div>
    </div>
    <!--Our Method-->
    <div class="Method">
        <!--제목부분-->
        <h2 class="method_subject">주요 기능</h2>
        <!--검은색뒷배경-->
        <div class="method_background">
            <div class="method_background1">&nbsp;</div>
            <div class="method_background2">&nbsp;</div>
        </div>
        <!--주요 기능들-->
        <div class="Method_info">
            <div class="info info_1">
                <a href="listMatch.spo"><img class="info_pic1" src="/spoMatch/img/loginOK/method/method6.jpg" style="width: 293px;"/></a>
                <div>
                    <p class="info_subject">매칭시스템</p>
                    <p class="info_text">매칭 등록과 신청을 통해<br> 다른 사람들과 함께 운동을<br>하실수 있습니다.</p>
                </div>
            </div>
            <div class="info info_2">
                <a href="selectInfoDiet.spo"><img class="info_pic2" src="/spoMatch/img/loginOK/method/method2.jpg" style="width: 293px; height: 383px;"/></a>
                <p class="info_subject">식단관리</p>
                <p class="info_text">매일 자신이 먹은 식단을 저장하고<br> 칼로리와 영영 성분을 관리하세요.</p>
            </div>
            <div class="info info_3">
                <a href="selectInfoWorkout.spo"><img class="info_pic3" src="/spoMatch/img/loginOK/method/method3.jpg" style="width: 293px; height: 383px;"/></a>
                <p class="info_subject">운동계획</p>
                <p class="info_text">플래너를 이용해 운동 계획을<br> 세우고 실천하세요.</p>
            </div>
            <div class="info info_4">
                <a href="listboard.spo"><img class="info_pic4" src="/spoMatch/img/loginOK/method/method4.jpg" style="width: 293px; height: 383px;"/></a>
                <p class="info_subject">정보공유</p>
                <p class="info_text">자신만의 팁과 정보를<br>게시판에서 공유해주세요.</p>
            </div>
        </div>
    </div>
</section>

<%@include file="../common/footer.html" %>
</body>
</html>