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
				       	 alert(xhr.status);
				         alert(thrownError);
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
       	 alert(xhr.status);
         alert(thrownError);
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
#findNearby{
	border-right: 0px;
    border-top: 0px;
   
    background-color: white;
    background-color: #E67F85;
    color: var(--white);
    border-style: none;
    width:200px; height:50px;
    
}
#findToSearch{
	border-right: 0px;
    border-top: 0px;
    background-color: white;
    background-color: #E67F85;
    color: var(--white);
    border-style: none;
   width:200px; height:50px;
}
#left{
	margin-rigth : 10px;
	padding-right : 10px;
	float : left;
}
</style>
</head>
<body>
<%@include file="../common/header.jsp" %>
<!-- Content -->
<section>
	<div class="container">
	<aside class="mini-nav">
		<div id="left">
			<input type="button"  id="findNearby" value="근처찾기" onclick="acyncMovePage1('/spoMatch/goMapPage3.spo')" style="background-color:  #E67F85;" ><br/><br/>
			<input type="button" id="findToSearch" value="검색찾기"  onclick="acyncMovePage2('/spoMatch/goMapPage2.spo')" style="background-color:  #E67F85;">
		</div>
	</aside>
		<div id ="contents">
		</div>		
	</div>
</section>
<%@include file="../common/footer.html" %>
</body>
</html>