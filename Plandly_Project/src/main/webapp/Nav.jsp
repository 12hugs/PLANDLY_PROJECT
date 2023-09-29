<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="com.plandly.controller.Lifecount" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./nav.css">
</head>
<body>
<% %>
<nav>
   
        <ul id="nav-ul">
            <li>
                <img id = "로고"src="" alt="">로고이미지
            </li>
          <li>
          </li>
          <li>
            <a class ="nav-item" href="#"><b>OPEN TODO</b></a>
          </li>

         
          <li >
            <a class ="nav-item" href="#"><b>MY TODO</b></a>
          </li>
            <!-- 내 정보 드롭다운 메뉴 -->
          <li class="dropdown">
            <!-- 드롭다운 트리거 -->  
            <a class ="nav-item" href="#" class="dropbtn"><b>내 정보</b></a>

            <!-- 드롭다운 컨텐츠 -->
            <div class="dropdown-content">
                <!-- 드롭다운 항목들 -->
                <a href="#">계정 정보 변경</a> 
                <a href="#">댓글 </a> 
                <a href="#">좋아요 </a> 
                <!-- 추가적인 항목들을 원하는 만큼 작성할 수 있습니다 -->
            </div>

        </li>

      </ul> 
      </nav>
      <!-- 네비바 클릭했을 때 색깔 주는 효과  -->
      <script src="//code.jquery.com/jquery-3.7.0.min.js"></script> <!-- jQuery 라이브러리 추가 -->
  <!--  <script type="text/javascript">
     $(document).ready(function() {
       $("li").click(function() {
         // 모든 li에서 selected 클래스 제거
         $("li").removeClass("selected");
         
         // 클릭한 li에 selected 클래스 추가
         $(this).addClass("selected");
       });
     });
     $(document).ready(function() {
       // DB에서 받아온 생일 변수 (YYYY-MM-DD 형식)
       var age = "1990-01-01";

       // 85세까지 남은 시간 계산
       var remainingTime = calculateRemainingTime(age);

       // 네비바 위에 동적으로 텍스트 삽입
       $("#nav-ul").prepend("<li>" + remainingTime + " 남음</li>");
     });

     function calculateRemainingTime(age) {
      var now = new Date();
      var age = new Date(age);
      
      // 85세 기준 시간 계산
      var eightyFifthBirthday = new Date(
        age.getFullYear() + 85,
        age.getMonth(),
        age.getDate(),
        age.getHours(),
        age.getMinutes(),
        age.getSeconds()
      );

      // 남은 시간 계산
      var remainingMilliseconds = eightyFifthBirthday - now;
      
      // 일, 시간, 분, 초 변환
      var days = Math.floor(remainingMilliseconds / (1000 * 60 * 60 * 24));
      var hours = Math.floor((remainingMilliseconds % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      var minutes = Math.floor((remainingMilliseconds % (1000 * 60 * 60)) / (1000 * 60));
      var seconds = Math.floor((remainingMilliseconds % (1000 * 60)) / 1000);

      return days + "일 " + hours + "시간 " + minutes + "분 " + seconds + "초";
     }

   </script> -->
</body>
</html>