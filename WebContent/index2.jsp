<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kosmo62.spomatch.login.vo.SpoLoginVO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>SPOMATCH</title>
        <!-- Favicon-->
			<link rel="icon" type="/spoMatch/image/x-icon" href="img/favicon.ico" />
		<!-- Font Awesome icons (free version)-->
			<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
		<!-- Google fonts-->
			<link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet" />
			<link href="https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic" rel="stylesheet" type="text/css" />
			<link href="https://fonts.googleapis.com/css2?family=Kalam:wght@300;400;700&display=swap" rel="stylesheet">
			<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;700&display=swap" rel="stylesheet">
		<!-- CSS -->
			<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
			<link rel="stylesheet" href="http://jqueryui.com/resources/demos/style.css">
			<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
			<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<!-- Third party plugin CSS-->
        	<link href="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/magnific-popup.min.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        	<link href="/spoMatch/css/loginForm.css" rel="stylesheet" />
        <!-- 카카오톡 API -->
        	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
		<!--로그인 기능 스크립트-->
        	<script defer type="text/javascript" src="/spoMatch/js/loginForm.js"></script>
        
<%
	String message = (String)request.getAttribute("message");
	
	System.out.println("message >>> " + message);
	if(message != null){
		%>
		<script type="text/javascript">
			alert('<%= message %>');
		</script>
		<%
	}
%>
        
		<script type="text/javascript">
		
			function loginAction(){
				document.loginForm.method="POST";
				document.loginForm.action="login.spo";
				document.loginForm.submit();
			}
			
			function registAction(){
				document.loginForm.method="POST";
				document.loginForm.action="memberAgree.spo";
				document.loginForm.submit();
			}
			
			//엔터키 누르면 로그인 실행
			function enterkey() {
				if(window.event.keyCode == 13) {
					console.log("엔터 누름");
					
					loginAction();
					
				}
			}
		
		</script>
        
    </head>
    <body id="page-top">
        <!-- Masthead-->
        <header class="masthead">
      	 	<video id="videoId" muted autoplay loop >
			   <source src="/spoMatch/img/video/bg.mp4" id="videoSrc" type="video/mp4"> 
			</video>
            <div class="container h-100">
                <form id="loginForm" name="loginForm" class="login-form">
                    <div>
                        <!-- head 부분 -->
                        <h1>SPOMATCH</h1>
                        <!-- Username input 태그 부분 -->
                        <div class="textb">
                            <input type="text" id="smb_id" name="smb_id" required>
                            <div class="placeholder">ID</div>
                        </div>
                        <!-- Password input 태그 부분 -->
                        <div class="textb">
                            <input type="password" id="smb_pw" name="smb_pw" onkeyup="enterkey()" required>
                            <div class="placeholder">Password</div>
                            <div class="show-password fas fa-eye-slash"></div>
                        </div>
                        <!-- 연동 로그인 부분 -->
                        <div class="otherLogin">
                            <a href="#kakao">
                                <div class="otherLogin_kakao fas fa-comment"></div>
                            </a>
                            <a href="#google">
                                <div class="otherLogin_google"><img src="/spoMatch/img/icon_google.png" alt="" style="width: 30px; height: 30px; margin-top: 10px;"></div>
                            </a>
                            <!--<div class="fas fa-check"></div>
                            Stay signed in-->
                        </div>
                        <!-- 아래 submit부분 -->
                        <div class="submit">
                            <button class="btn" id="loginbtn" onclick="loginAction()"><i class="fas fa-arrow-right"></i></button>
                        	<a href="#" id="registbtn" onclick="registAction()">Create Account</a>
                        </div>
                    </div>
                </form>
            </div>
        </header>
        <!-- 카카오톡 연동 로그인 스크립트 -->
   		<script type='text/javascript'>
		  //<![CDATA[
		    // 사용할 앱의 JavaScript 키를 설정해 주세요.
		    Kakao.init('971004b28ce40a08d7e943f645582990');  //여기서 아까 발급받은 키 중 javascript키를 사용해준다.
		    // 카카오 로그인 버튼을 생성합니다.
		    Kakao.Auth.createLoginButton({
		      container: '#kakao-login-btn',
		      success: function(authObj) {
		    	  Kakao.API.request({
		    		  
		              url: '/v2/user/me',
		
		              success: function(res) {
		            	  
		            	  alert("res >>>" + res);
		
		                    console.log(res.id);//<---- 콘솔 로그에 id 정보 출력(id는 res안에 있기 때문에  res.id 로 불러온다)
		
		                    console.log(res.kaccount_email);//<---- 콘솔 로그에 email 정보 출력 (어딨는지 알겠죠?)
		                            
		                // res.properties.nickname으로도 접근 가능 )
		                    console.log(authObj.access_token);//<---- 콘솔 로그에 토큰값 출력
		         
		         var kaccount_email = res.properties.kaccount_email;    //카카오톡 닉네임을 변수에 저장 (닉네임 값을 다른페이지로 넘겨 출력하기 위해서)
		                    
		         //로그인 결과 페이지로 닉네임 값을 넘겨서 출력시킨다.,
		                  }
		                })
		              },
		              fail: function(error) {
		                alert(JSON.stringify(error));
		              }
		            });
		</script>
        
        <!-- Bootstrap core JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js"></script>
        <!-- Third party plugin JS-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/magnific-popup.js/1.1.0/jquery.magnific-popup.min.js"></script>
        <!-- Core theme JS-->
        <!-- <script src="/spoMatch/js/main_nav.js"></script> -->
    </body>
</html>
