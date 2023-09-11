<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
   fieldset {
      border-color: blue;
      border-style: dotted;
      width: 300px;
      padding: 20px;
   }

   #box {
      display: flex;
      justify-content: center;
   }

   .input-group {
      display: flex;
      align-items: center;
   }

   .input-group input[type="submit"] {
      margin-top: 10px; /* 로그인 버튼과 입력란 사이 간격 조정 */
   }
</style>

</head>
<body>
<div id = "box">
   <fieldset >
      <legend align="center">도서관리프로그램</legend>

     <!-- Question4_Login.jsp 경로로 바꿔주기!! -->
    <form action="Question4_Main.jsp" method="post">
         <table align="center">
            <tr>
               <td>ID</td>
               <td><input type="text" name="name"></td>
               <!-- 로그인 버튼을 이동한 위치 -->
               <td rowspan="2"><input type="submit" value="로그인"></td> 
            </tr>
            <tr>
               <td>PW</td>
               <td><input type="password" name="java"></td>
            </tr>
            
             <td colspan="2">
               <!-- Question4_Join.jsp 경로로 바꿔주기!! -->
               아이디가 없다면 <a href="Question4_Join.jsp">회원가입</a> 클릭
            </td>
            
         </table>
      </form>

  </fieldset>
</div>
</body>

</html>

