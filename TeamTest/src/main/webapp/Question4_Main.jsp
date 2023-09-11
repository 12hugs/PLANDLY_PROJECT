<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String nick = (String)session.getAttribute("nick");
	%>
	
   <fieldset>
      <legend align="center"><%= nick %>님 환영합니다</legend>

      <!-- Question4_Login.jsp 경로로 바꿔주기!! -->
         
   </fieldset>
</body>
</html>