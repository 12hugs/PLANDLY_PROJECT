<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <fieldset>
      <legend align="center">도서관리프로그램</legend>

      <!-- Question4_Login.jsp 경로로 바꿔주기!! -->
      <form action="Question4_Main.jsp" method="post">
         <table align="center">
            <tr>
               <td>ID</td>
               <td><input type="text" name="name"></td>
            </tr>
            <tr>
               <td>PW</td>
               <td><input type="text" name="java"></td>
            </tr>
            <tr>
               <!-- Question4_Join.jsp 경로로 바꿔주기!! -->
               <td><a href="Question4_Join.jsp">회원가입</a></td> 
               <td><input type="submit" value="로그인"></td>
            </tr>
         </table>
      </form>
   </fieldset>
</body>
</html>