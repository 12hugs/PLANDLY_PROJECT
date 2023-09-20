<%@page import="com.plandly.controller.Lifecount"%>
<%@page import="com.plandly.model.FamousVO"%>
<%@page import="java.util.Map"%>
<%@page import="com.plandly.model.OpenTodoVO"%>
<%@page import="java.util.List"%>
<%@page import="com.plandly.model.Plandly_MemberVO"%>
<%@page import="com.plandly.model.Plandly_MemberDAO"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PLANDLY</title>
<link rel="stylesheet" href="fontawesome/css/all.min.css">
<link rel="stylesheet" href="css/fontStyle.css">
<!-- https://fontawesome.com/ -->
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap"
	rel="stylesheet">
<!-- https://fonts.google.com/ -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/templatemo-video-catalog.css">



<!-- 내부 CSS 스타일 지정 -->

<link rel="stylesheet" href="css/calendarStyles.css">
<link rel="stylesheet" href="css/todo.css">
<link rel="stylesheet" href="css/calContainer.css">

<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css'>
<!-- ===================================================================================================== -->
<!-- [CDN 주소 설정] -->
<!-- ===================================================================================================== -->
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'
	rel='stylesheet' />
<link rel="stylesheet" href="css/Menu.css">
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.10.7/dayjs.min.js"></script>
	<style type="text/css"> 
	*{
	font-family: 'Pretendard-Regular';}
	</style>
<!-- ===================================================================================================== -->


<!-- ===================================================================================================== -->
<!-- [자바스크립트 코드 지정] -->
<!-- ===================================================================================================== -->

<script type="text/javascript">
	<%
	Map<String, Object> mySession = (Map<String, Object>) request.getSession().getAttribute("mySession");
	String hostEmail = request.getParameter("email");
	
	String email = (String)mySession.get("loginEmail");
	//String email = (String) session.getAttribute("loginEmail");
	System.out.println(hostEmail);
	System.out.println(email);%>
	window.hostEmail = '<%=hostEmail%>';
	window.email = '<%=email%>';
</script>
<script src="js/calendar.js">
	
</script>
<script src="js/todo.js"></script>

</head>
<style type="text/css">


div#countdown {
    display: flex;
    transform: scale(2);
    justify-content: center;
    align-items: flex-end;
    margin-top: 200px;
}

.timer{
	display: flex;
	align-items: center;
	justify-content: center;
	margin: 8px;
}

.time h2{
	font-weight: bold;
	font-size: 36px;
	line-height: 1;
	margin: 0 0 5px;
}

.w-3.text.left {
    margin-top: 80px;
    font-size: larger;
}

@media{
	h1{
		font-size: 45px;
	}
	.time{
		margin: 5px;
	}
	.time h2{
		font-size: 12px;
	}
	.time small{
		font-size: 10px;
	}
}

</style>
<body>
<%
	// 명언
	int ranInt = (int) (Math.random() * 138);

	System.out.println(ranInt);

	Plandly_MemberDAO famousDAO = new Plandly_MemberDAO();
	FamousVO famousVO = famousDAO.famous(ranInt);

	System.out.println("컨텐츠 : " + famousVO.getContent());

	System.out.print(famousVO.getContent());
	System.out.print(famousVO.getAuthor());
	%>
<%
Plandly_MemberVO vo = (Plandly_MemberVO) session.getAttribute("vo"); //
vo.setEmail(vo.getEmail()); //
String age = vo.getAge(); //
System.out.println(age); //
Lifecount watch = new Lifecount(); // 
String lifeWatch = watch.counting(age); //
%>

	<div class="tm-page-wrap mx-auto">
		<div class="position-relative">
			<div class="potition-absolute tm-site-header">
				<div class="container-fluid position-relative">
					<div class="row">
						<div class="col-7 col-md-4">
							<a href="Main.jsp"
								class="tm-bg-black text-center text-white tm-logo-container">
								<h1 class="tm-site-name">PLANDLY</h1>
							</a>
						</div>
						<div class="col-5 col-md-8 ml-auto mr-0">
							<div class="tm-site-nav">
								<nav class="navbar navbar-expand-lg mr-0 ml-auto"
									id="tm-main-nav">
									<button
										class="navbar-toggler tm-bg-black py-2 px-3 mr-0 ml-auto collapsed"
										type="button" data-toggle="collapse" data-target="#navbar-nav"
										aria-controls="navbar-nav" aria-expanded="false"
										aria-label="Toggle navigation">
										<span> <i class="fas fa-bars tm-menu-closed-icon"></i>
											<i class="fas fa-times tm-menu-opened-icon"></i>
										</span>
									</button>
									<div class="collapse navbar-collapse tm-nav" id="navbar-nav">
										<ul class="navbar-nav text-uppercase">
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="Main.jsp">오픈투두</a></li>
											<li class="nav-item active"><a
												class="nav-link tm-nav-link" href="calendar.jsp">마이투두 <span
													class="sr-only">(current)</span>
											</a></li>
											
											<li class="nav-item" style="color:white">
                                            <div class="dropdown">
                                              <a class="nav-link tm-nav-link">내 정보 <span class="sr-only">(current)</span></a>
                                              <div class="dropdown-content">
                                                 <a href="MyPage_1.jsp">정보 수정</a>
                                                 <a href="MyPage_2.jsp">댓글 단 TODO</a>
                                                 <a href="MyPage_3.jsp">찜 한 TODO</a>
                                              </div>
                                           </div>
                                          </li>
                                          <!-- 영준 : 추가해야함. -->
											<li class="nav-item" onclick="kakaoLogout();"><a
												class="nav-link tm-nav-link" href="Logout">로그아웃</a></li>
										</ul>
									</div>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="tm-welcome-container tm-fixed-header tm-fixed-header-2">
				<div class="text-center">
					<div id="countdown" class="countdown text-white">
					
						<div class="timer">
						 <h2 id="days"></h2>
						 <small>일</small>
						</div>
						<div class="timer">
						 <h2 id="hours"></h2>
						 <small>시</small>
						</div>
						<div class="timer">
						 <h2 id="minutes"></h2>
						 <small>분</small>
						</div>
						<div class="timer">
						 <h2 id="seconds"></h2>
						 <small>초</small>
						</div>
						
					</div>
				</div>
				<div class="text-center" style="color: white">
					<%
               if (famousVO.getAuthor() != null) {
               %>
               <div class="w-3 text left" style="text-align:-webkit-center"><%=famousVO.getContent()%></div>
               <div class="text right" style="text-align: -webkit-center">-&nbsp;&nbsp;<%=famousVO.getAuthor()%>&nbsp;&nbsp;-</div>
               <%
               } else {   
               %>
               <div class="w-3 text left" style="text-align:-webkit-center"><%=famousVO.getContent()%></div>
               <%
               }
               %>
				</div>
			</div>

			<div id="tm-fixed-header-bg"></div>
			<!-- Header image -->
		</div>

		<!-- 캘린더 시작 -->
		<main>
			<div class="container-fluid px-0">

				<div class="mx-auto tm-content-container">

					<%
					if (hostEmail != null) {
						// DAO를 통해 email에 해당하는 사용자의 닉네임 가져오기
						Plandly_MemberDAO dao = new Plandly_MemberDAO();
						vo = dao.getMemberByEmail(hostEmail);
						String nickname = vo.getNickName();
					%>

					<div>
						<h1 class="calendarHolder"><%=nickname%>님의 캘린더
						</h1>
					</div>

					<%
					} else {
					%>

					<div>
						<h1 class="calendarHolder">나의 캘린더</h1>
						<hr class="title-hr">
					</div>

					<%
					}
					%>
					<div class="d-flex justify-content-between main-container">
						<div id="calendar-container">
							<!-- 캘린더 -->
							<div id="calendar"></div>
						</div>
						<div id="todo-container">
							<p id="event-date"></p>
							<h3 id="event-title" style="display: none;"></h3>
							
							
							<div class="sec-box">
							<span id="isPublic-set" style="display: none;">공개여부</span> 
							</div>
							<div class="sec-box">
							<label class="isPublic-switch"> <input type="checkbox" id="isPublic-togBtn">
								<div class="isPublic-slider round" id="isPublic-slider" style="display: none;"></div>
							</label>
							</div>
							
							<select id="category-dropdown" style="display: none;" >
								<option value="" >-- 카테고리 선택 --</option>
								<option value="공부">공부</option>
								<option value="시험">시험</option>
								<option value="과제">과제</option>
								<option value="입시">입시</option>
								<option value="수능">수능</option>
								<option value="일상">일상</option>
								<option value="운동">운동</option>
								<option value="건강">건강</option>
								<option value="여행">여행</option>
								<option value="음악">음악</option>
								<option value="친구">친구</option>
								<option value="응원">응원</option>
								<option value="봉사">봉사</option>
							</select>
							
							
							<br>
							<div class="todo-box">
							<input type="text" id="new-task" placeholder="새로운 할 일을 입력하세요"
								style="display: none;">
							<button id="add-task-button" style="display: none;">추가</button>
							</div>
							<br>
							<ul id="task-list"></ul>
							
						<button id="event-delete-button" class ="w-btn w-btn-indigo"style="display: none;">
								이벤트 삭제
								<!-- 여기에 휴지통 이미지 삽입 -->
							</button>
							</div>
							<div class='like-container' id="like-container"
								style="display: none;">
								<button class='like-button'>
									<i class='far fa-heart'></i>
									<!-- 기본 하트 아이콘 -->
								</button>
								<span class='like-counter'>0</span>
								<!-- 좋아요 카운트 표시 -->
							</div>
						</div>
					</div>

					<!-- 여기까지 캘린더 -->
		</main>

		<div class="container-fluid tm-content-container mx-auto pt-4">	
		
         <!-- Subscribe form and footer links -->

         <div class="row mt-5 pt-3">
            <div class="col-xl-6 col-lg-12 mb-4">
               <div class="tm-bg-gray p-5 h-100">
                  <h3 class="tm-text-primary mb-3">문의사항</h3>
                  <br>
                  <p class="mb-5">
                     질문 혹은 문의사항이나 오류가 있으면 아래 mail을 눌러주세요.
                  </p>
                  <a href="mailto:1211dbals@gmail.com?body=문의사항을 작성해주세요."> mail
                  </a>
               </div>
            </div>
            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-12 mb-4">
               <div class="p-5 tm-bg-gray h-100">
                  <h3 class="tm-text-primary mb-4">CarryPort</h3>
                  <ul class="list-unstyled tm-footer-links">
                     <li>진영준</li>
                     <li>한창헌</li>
                     <li>이중호</li>
                     <li>임유민</li>

                  </ul>
               </div>
            </div>
            <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-12 mb-4">
               <div class="p-5 tm-bg-gray h-100">
                  <h3 class="tm-text-primary mb-4">Our Pages</h3>
                  <ul class="list-unstyled tm-footer-links">
                     <li><a href="https://www.instagram.com/always_b.f.f/">진영준
                           인스타그램</a></li>
                     <li><a href="https://www.instagram.com/zuunu0_/">이중호
                           인스타그램</a></li>
                     <li><a
                        href="mailto:qksckdqjs334@gmail.com.com?body=한창헌님에게 메일보내기">한창헌
                           메일</a></li>
                     <li><a href="https://blog.naver.com/yumni_-">임유민 블로그</a></li>
                  </ul>
               </div>
            </div>
         </div>
         <!-- row -->

         <footer class="row pt-5">
            <div class="col-12">
               <p class="text-right">
                  Copyright 2023 smhrd TEAM CARRYPORT - Designed by CarrtPort
               </p>

            </div>
         </footer>
      </div>

   </div>
<script>
  
   

    /*=============타이머======================  */
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

      var totalSeconds = ((parseInt(lifeWatchArr[0]) * (24 * 60 * 60))
            + (parseInt(lifeWatchArr[1]) * (60 * 60))
            + (parseInt(lifeWatchArr[2]) * 60) + parseInt(lifeWatchArr[3]));

      startTimer(totalSeconds);
   </script>
   
   <script type="text/javascript">
	//카카오로그아웃  
	function kakaoLogout() {
	    if (Kakao.Auth.getAccessToken()) {
	      Kakao.API.request({
	        url: '/v1/user/unlink',
	        success: function (response) {
	        	console.log(response)
	        },
	        fail: function (error) {
	          console.log(error)
	        },
	      })
	      Kakao.Auth.setAccessToken(undefined)
	    }
	  }  
	</script>

	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/parallax.min.js"></script>
</body>
</html>