
<%@page import="com.plandly.model.OpenTodoVO"%>
<%@page import="java.util.List"%>
<%@page import="com.plandly.model.Plandly_MemberDAO"%>
<%@page import="com.plandly.controller.Lifecount"%>
<%@page import="com.plandly.model.Plandly_MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="./Nav.css">
   
</head>

<body>
   <% // 인생카운트다운 시계 로직
   Plandly_MemberVO vo = (Plandly_MemberVO)session.getAttribute("vo");
   System.out.println(vo.getEmail()+vo.getPw()+vo.getAge()+vo.getGender()+vo.getNickName());
   String age = vo.getAge();
   System.out.println(age);
   Lifecount watch = new Lifecount();
   String lifeWatch = watch.counting(age);
   %>
   
   <!-- 인생카운트시계 텍스트 -->
  <!--   <span id="days"></span>일 
    <span id="hours"></span>시 
    <span id="minutes"></span>분 
    <span id="seconds"></span>초
    -->
   <% // 오픈 todo 로직
   
   String email = vo.getEmail();
   Plandly_MemberDAO dao = new Plandly_MemberDAO();
   List<OpenTodoVO> openTodoTask = dao.openTodoTask(); // 중복 제거 전
   List<OpenTodoVO> openTodo = dao.openTodo(); // 중복 제거 후
   
   System.out.print("중복제거 전"+openTodoTask.size());
   System.out.print("중복제거 후"+openTodo.size());
   %>
   
 <nav>
      <!-- 타이머 넣는 박스 -->
       <!-- 인생카운트시계 텍스트 -->
       <div id="MyTimer">
      <div id ="days" class = "timer"></div>
    <div id="hours" class = "timer"></div>시
    <div id="minutes" class = "timer"></div>분 
    <div id="seconds" class = "timer"></div>
    </div>
        <ul id="nav-ul">
            <li>
                <img id = "로고"src="" alt="">로고이미지
            </li>
       
          <li>
            <a class ="nav-item" href="#"><b>OPEN TODO</b></a>
          </li>

         
          <li >
            <a class ="nav-item" href="calendar.jsp"><b>MY TODO</b></a>
          </li>
            <!-- 내 정보 드롭다운 메뉴 -->
          <li class="dropdown">
            <!-- 드롭다운 트리거 -->  
            <a class ="nav-item" href="./MyPage.jsp " class="dropbtn"><b>내 정보</b></a>

            <!-- 드롭다운 컨텐츠 -->
            <div class="dropdown-content">
                <!-- 드롭다운 항목들 -->
                <a href="#">계정 정보 변경</a> 
                <a href="#">내가 쓴 댓글 </a> 
                <a href="#">좋아요 누른 게시물</a> 
                <a href="#">친구 TODOLIST</a> 
                <!-- 추가적인 항목들을 원하는 만큼 작성할 수 있습니다 -->
            </div>

        </li>

      </ul> 
      </nav>

                <%for(int i = 0; i < openTodo.size(); i++){ %>
                <div id="content1_pack" class="content1_pack">
                    <div class="card-grid">
                        <article class="card">
                            <div class="card-header">
                                <div>
                                    <span><img src="" /></span>
                                    <h3><%=openTodo.get(i).getNickname()%></h3>
                                </div>
                            </div>
                            <div class="todo"><%=openTodo.get(i).getTitle()%></div>
                            <div class="card-body">
                              <%for(int k = 0; k < openTodoTask.size(); k++){ %>
            
                                <%if (openTodoTask.get(k).getCal_num() == openTodo.get(i).getCal_num()){ %>
                                   
                                <p><%=openTodoTask.get(k).getTask()%></p> <br>
                             
                                   
                                <%} %>   
                          <%} %>
                            </div>
                            <div class="tag">
                                <a href="#"><%=openTodo.get(i).getCate()%></a>
                            </div>
                        </article>
                    </div>
                </div>
                <%} %>
            </div>

        </div>
       </div>
   
   <% // 오픈 todo 로직
   //String email = vo.getEmail();
   
   //Plandly_MemberDAO dao = new Plandly_MemberDAO();
   
   //List<String> openTodoList = dao.openTodo(email);
   
   //openTodoList.get(0)
   %>



   

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
             days= Math.floor(timer / (24 * 60 * 60));
             hours= Math.floor((timer / (60 * 60)) % 24);
             minutes= Math.floor((timer / 60) % 60);
             seconds= timer % 60;
      
         daysElement.textContent= days;
         hoursElement.textContent= hours;
         minutesElement.textContent= minutes;
         secondsElement.textContent= seconds;
      
         if (--timer < 0) {
             timer = duration; // reset
         }
         }, 1000);
      }
      
      window.onload = function () {
         var lifeWatchStr = "<%=lifeWatch%>";
         var lifeWatchArr = lifeWatchStr.split("-");
         console.log(lifeWatchArr);
      
         var totalSeconds =
             ((parseInt(lifeWatchArr[0]) * (24 * 60 * 60)) +
                 (parseInt(lifeWatchArr[1]) * (60 * 60)) +
                 (parseInt(lifeWatchArr[2]) * 60) +
                 parseInt(lifeWatchArr[3]));
      
         startTimer(totalSeconds);
      };
      
      
   </script>

</body>
</html>