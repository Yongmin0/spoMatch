<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e3e734327f9b7229d3c34ff48d390d66"></script>
<script type="text/javascript">
	 $(document).ready(function(){
		var url = "/spoMatch/goMapPage3.spo";
		acyncMovePage1(url);
		
	}); 
    function acyncMovePage1(url){
        // ajax option
				       var ajaxOption = 
				       {
						                url : url,
						                async : true,
						                type : "post",
						                dataType : "html",
						                cache : false, //ajax로 통신중 캐시가 남아서 갱신된 데이터를 받아오지 못하는경우
						              	success : ws,
						              	error : we              	
				        };
				        function ws()
				        {
				        	console.log("acyncMovePage(url) 진입 성공>>> : ");
				        }
				       	function we(xhr, ajaxOptions, thrownError)
				       	{
				       	
				       	}
        
			        $.ajax(ajaxOption).done(function(data){
			            // Contents 영역 삭제
			            $('#contents').children().remove();
			            // Contents 영역 교체
			            $('#contents').html(data);
			        });
    }  
    function acyncMovePage2(url){
        // ajax option
     	var ajaxOption = 
     	{
                url : url,
                async : true,
                type : "post",
                dataType : "html",
                cache : false, //ajax로 통신중 캐시가 남아서 갱신된 데이터를 받아오지 못하는경우
              	success : ws,
              	error : we              	
        };
        function ws()
        {
        	console.log("acyncMovePage2(url) 진입 성공>>> : ");
        }
     	function we(xhr, ajaxOptions, thrownError)
       	{
     
       	}
        $.ajax(ajaxOption).done(function(data){
            // Contents 영역 삭제
            $('#contents').children().remove();
            // Contents 영역 교체
            $('#contents').html(data);
        });
    } 
 </script>
<style>
input[id="menuicon"] {display:none;}
input[id="menuicon"] + label {display:block;top: 150px;margin:30px;width:60px;height:50px;position:relative;cursor:pointer;}
input[id="menuicon"] + label span {display:block;position:absolute;width:100%;height:5px;border-radius:30px;background:#000;transition:all .35s;}
input[id="menuicon"] + label span:nth-child(1) {top:0;}
input[id="menuicon"] + label span:nth-child(2) {top:50%;transform:translateY(-50%);} /* style top:calc(50% - 2.5px); margin-top:-2.5px;*/
input[id="menuicon"] + label span:nth-child(3) {bottom:0;}
input[id="menuicon"]:checked + label {z-index:2;}
input[id="menuicon"]:checked + label span {background:#fff;}
input[id="menuicon"]:checked + label span:nth-child(1) {top:50%;transform:translateY(-50%) rotate(45deg);}
input[id="menuicon"]:checked + label span:nth-child(2) {opacity:0;}
input[id="menuicon"]:checked + label span:nth-child(3) {bottom:50%;transform:translateY(50%) rotate(-45deg);}
div[class="sidebar"] {width:300px;    height: 100%;background:#E67F85;position: absolute;top:90px;left:-300px;z-index:1;transition:all .35s;}

input[id="menuicon"]:checked + label + div {left:0;}
#findNearby{
margin-top: 90%;
margin-left: 50px;
    margin-bottom: 20px;
    background-color: #E67F85;
    color: var(--white);
    border-style: none;
   width:200px; height:50px;
}
 #findToSearch{
	margin-left: 50px;
	border-top : 0 px;
    background-color: #E67F85;
    color: var(--white);
    border-style: none;
   width:200px; height:50px;
  }

</style>
</head>
<body>
<%@include file="../common/header.jsp" %>

<input type="checkbox" id="menuicon">
<label for="menuicon">
	<span></span>
	<span></span>
	<span></span>
</label>
<div class="sidebar">
<input type="button"  id="findNearby" value="근처찾기" onclick="acyncMovePage1('/spoMatch/goMapPage3.spo')" style="background-color:  #E67F85;" ><br/><br/>
<input type="button" id="findToSearch" value="검색찾기"  onclick="acyncMovePage2('/spoMatch/goMapPage2.spo')" style="background-color:  #E67F85;">
</div>
</section>
<div class="container" style="padding-top:2%;">
	<div id ="contents" style="margin-bottom:4%">
	</div>
</div>
</section>	
	<%@include file="../common/managerfooter.html" %>
</body>
</html>