<%@page import="com.plandly.controller.Lifecount"%>
<%@page import="com.plandly.model.Plandly_MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="//code.jquery.com/jquery-3.7.0.min.js"></script>

<link rel="stylesheet" href="css/Nav.css">
<link rel="stylesheet" href="css/MyPage.css">


    <script defer type="text/javascript" src="js/MyPage.js"></script>
<body>

   <% // 인생카운트다운 시계 로직
   Plandly_MemberVO vo = (Plandly_MemberVO)session.getAttribute("vo");
   System.out.println(vo.getEmail()+vo.getPw()+vo.getAge()+vo.getGender()+vo.getNickName());
   String age = vo.getAge();
   System.out.println(age);
   Lifecount watch = new Lifecount();
   String lifeWatch = watch.counting(age);
%>

<nav>
      <!-- 타이머 넣는 박스 -->
       <!-- 인생카운트시계 텍스트 -->
       <!-- 인생카운트시계 텍스트 -->
    <div id="countdown" class="countdown">
	    <div class = "timer">
	      <h2 id ="days"></h2>
	      <small>Days</small>
	    </div>
	    <div class = "timer">
	      <h2 id ="hours"></h2>
	      <small>Hours</small>
	    </div>
	    <div class = "timer">
	      <h2 id ="minutes"></h2>
	      <small>Minutes</small>
	    </div>
	    <div class = "timer">
	      <h2 id ="seconds"></h2>
	      <small>Seconds</small>
	    </div>
    </div>

        <ul id="nav-ul">
            <li><img id ="logo" src="./Img/logo.png" alt="" ></li>       
            <li><a class ="nav-item" href="./Main.jsp"><b>OPEN TODO</b></a></li>      
            <li><a class ="nav-item" href="./calendar.jsp"><b>MY TODO</b></a></li>

            <!-- 내 정보 드롭다운 메뉴 -->
            <li>
                <!-- 드롭다운 트리거 -->  
                <a class ="nav-item dropbtn" href="./MyPage.jsp"><b>내 정보</b></a>

                <!-- 드롭다운 컨텐츠 -->
               <!--  <div class="dropdown-content">
                    드롭다운 항목들
                    <a href="#">계정 정보 변경</a> 
                    <a href="#">내가 쓴 댓글 </a> 
                    <a href="#">좋아요 누른 게시물</a> 
                <a href="#">친구 TODOLIST</a> 
                추가적인 항목들을 원하는 만큼 작성할 수 있습니다
            </div> -->

        </li>

      </ul> 
</nav>


      <div class="content">
        <div class="tabs">
        <div class="tab-header">
          <div class="active">
           <i class="fa fa-code">계정 정보 변경</i> 
          </div>
          <div>
            <i class="fa fa-pencil-square-o">내가 쓴 댓글</i> 
          </div>
          <div>
            <i class="fa fa-bar-chart">좋아요 한 게시물</i> 
          </div>
          <div>
            <i class="fa fa-envelope-o">친구 TODO LIST</i> 
          </div>
        </div>
        <div class="tab-indicator"></div>
        <div class="tab-body">
          <div class="active">
            <h2>계정 정보 변경</h2>
            <p class = "mypage-img"><img src="#DB 에서 이미지 불러오기"></p>
            
            <form action="MemberChange">
	          	<input class = "MyPage-form" type="text" placeholder= "현재 이메일을 입력해주세요"  name="email">
	            <input  class = "MyPage-form"type="text" placeholder="바꿀 닉네임을 입력해주세요"  name="nickName" ><br>  
	          	<input class = "MyPage-form" type="text" placeholder= "바꿀 패스워드를 입력해주세요"  name="pw"> <br> 
	            <input class = "MyPage-form" type="submit" value="개인 정보 변경" >   
            </form>
          </div>
          <div>
            <h2>댓글</h2>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi minus exercitationem vero, id autem fugit assumenda a molestiae numquam at, quisquam cumque. Labore eligendi perspiciatis quia incidunt quaerat ut ducimus?</p>
          </div>
          <div>
            <h2>services</h2>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi minus exercitationem vero, id autem fugit assumenda a molestiae numquam at, quisquam cumque. Labore eligendi perspiciatis quia incidunt quaerat ut ducimus?</p>
          </div>
          <div>
            <h2>contact</h2>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Modi minus exercitationem vero, id autem fugit assumenda a molestiae numquam at, quisquam cumque. Labore eligendi perspiciatis quia incidunt quaerat ut ducimus?</p>
          </div>
        </div>
      </div>

  
   
   <% // 오픈 todo 로직
   //String email = vo.getEmail();
   
   //Plandly_MemberDAO dao = new Plandly_MemberDAO();
   
   //List<String> openTodoList = dao.openTodo(email);
   
   //openTodoList.get(0)
   %>


   
</div>



   <script type="text/javascript">
           // 인생 카운트 시계 JS로직
           $(document).ready(function() {
             $("li").click(function() {
               // 모든 li에서 selected 클래스 제거
               $("li").removeClass("selected");
               
               // 클릭한 li에 selected 클래스 추가
               $(this).addClass("selected");
             });
           });
         
           function startTimer(duration) {
             var timer = duration;
             var daysElement = document.querySelector('#days');
             var hoursElement = document.querySelector('#hours');
             var minutesElement = document.querySelector('#minutes');
             var secondsElement= document.querySelector('#seconds');
           
             setInterval(function () {
               var days, hours, minutes, seconds;
               days = Math.floor(timer / (24 * 60 * 60));
               hours = Math.floor((timer / (60 * 60)) % 24);
               minutes = Math.floor((timer / 60) % 60);
               seconds = timer % 60;
           
               daysElement.textContent = days;
               hoursElement.textContent = hours;
               minutesElement.textContent = minutes;
               secondsElement.textContent = seconds;
           
               if (--timer < 0) {
                 timer = duration; // reset
               }
             }, 1000);
           }
         
           // 카운팅 로직을 실행할 때 window.onload 없이 실행
           var lifeWatchStr = "<%=lifeWatch%>";
           var lifeWatchArr = lifeWatchStr.split("-");
           console.log(lifeWatchArr);
         
           var totalSeconds =
             ((parseInt(lifeWatchArr[0]) * (24 * 60 * 60)) +
             (parseInt(lifeWatchArr[1]) * (60 * 60)) +
             (parseInt(lifeWatchArr[2]) * 60) +
             parseInt(lifeWatchArr[3]));
         
           startTimer(totalSeconds);
           
           $("form").submit(function (event) {
               event.preventDefault(); // 기본 submit 동작을 막음

               $.ajax({
                   type: "POST",
                   url: "MemberChange", // MemberChange 서블릿 경로
                   data: $("form").serialize(), // 폼 데이터를 전송
                   success: function (response) {
                       if (response === "success") {
                           alert("회원 정보 변경 성공!"); // 성공 시 알림 메시지
                           window.location.href = "Main.jsp"; // Main.jsp로 이동
                       } else {
                           alert("회원 정보 변경 실패!"); // 실패 시 알림 메시지
                       }
                   },
                   error: function () {
                       alert("서버 오류 발생!"); // 서버 오류 시 알림 메시지
                   }
               });
           });
      </script>
</body>
</html>