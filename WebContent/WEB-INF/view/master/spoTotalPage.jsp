<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

$(document).ready(function(){
	var url = "/spoMatch/goMemberPage2.spo";
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
				        function ws(data)
				        {
				        	console.log("acyncMovePage(url) 진입 성공>>> : ");
				        
				        }
				       	function we()
				       	{
				       		console.log("whenError() 진입 >>>> :");
				       	}
        
			        $.ajax(ajaxOption).done(function(data){
			            // Contents 영역 삭제
			            $('#contents').children().remove();
			            // Contents 영역 교체
			            $('#contents').html(data);
			        });
    }  
 </script>
</head>
<body>
<%@ include file="../common/header.jsp" %>

<div id ="contents"></div>
<%@ include file="../common/footer.html" %>
</body>
</html>