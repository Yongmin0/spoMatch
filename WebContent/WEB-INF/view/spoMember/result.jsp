<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과 화면</title>
    
<%
   Object obj = request.getAttribute("aList");

   if(obj != null){
      int nCnt = ((Integer)obj).intValue();
      if(nCnt > 0){
         System.out.println("입력된 건 수 >>>" + nCnt + "건");
         
%>

      <script>
         location.href= "/spoMatch/spoUpdateForm.spo";
      </script>
<%
      }
   }else{
      out.println("회원 입력이 실패했습니다.");
   }
%>
</head>
<body>

</body>
</html>