
<%@page import="com.plandly.model.FamousVO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
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
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<link rel="stylesheet" href="css/all.min.css">
<link rel="stylesheet" href="css/OpenTodo.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/templatemo-video-catalog.css">
<link rel="stylesheet" href="css/Menu.css">
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
	

<link
	href="https://fonts.googleapis.com/css2?family=Bagel+Fat+One&family=Gasoek+One&family=Jua&display=swap"
	rel="stylesheet">

<link rel="stylesheet" href="css/fontStyle.css">

<%
Map<String, Object> mySessionData = (Map<String, Object>) request.getSession().getAttribute("mySession");
String openCategory = null;
if (mySessionData != null) {
	openCategory = (String) mySessionData.get("category");
}

System.out.println("받아온 값 : " + openCategory);
%>

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

	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/heart.js"></script>

	<%
	// 인생카운트다운 시계 로직
	Plandly_MemberVO vo = (Plandly_MemberVO) session.getAttribute("vo"); //
	vo.setEmail(vo.getEmail()); //
	Map<String, Object> mySession = new HashMap<>(); //세션 맵
	mySession.put("loginPw", vo.getPw());
	mySession.put("loginNick", vo.getNickName());
	mySession.put("loginEmail", vo.getEmail());
	mySession.put("loginAge", vo.getAge());
	request.getSession().setAttribute("mySession", mySession);
	%>

	<%
	//session.setAttribute("loginEmail", vo.getEmail());
	System.out.println(vo.getEmail() + vo.getPw() + vo.getAge() + vo.getGender() + vo.getNickName());
	String age = vo.getAge(); //
	System.out.println(age); //
	Lifecount watch = new Lifecount(); // 
	String lifeWatch = watch.counting(age); //
	%>

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
	// 오픈 todo 로직

	String email = vo.getEmail();
	Plandly_MemberDAO dao = new Plandly_MemberDAO();
	List<OpenTodoVO> openTodoTask = dao.openTodoTask(); // 중복 제거 전
	List<OpenTodoVO> openTodo = dao.openTodo(); // 중복 제거 후

	System.out.print("중복제거 전" + openTodoTask.size());
	System.out.print("중복제거 후" + openTodo.size());
	%>

	<!--===============================================================  -->





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
											<li class="nav-item active"><a
												class="nav-link tm-nav-link" href="Main.jsp">오픈투두 <span
													class="sr-only">(current)</span></a></li>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="calendar.jsp">마이투두</a></li>
											<li class="nav-item" style="color: white">
												<div class="dropdown">
													<a class="nav-link tm-nav-link">내 정보</a>
													<div class="dropdown-content">
														<a href="MyPage_1.jsp">정보 수정</a> <a href="MyPage_2.jsp">댓글단
															TODO</a> <a href="MyPage_3.jsp">찜 한 TODO</a>
													</div>
												</div>
											</li>
											<!-- 영준 : 추가해야함. -->
											<li class="nav-item" href="javascript:void(0)" onclick="kakaoLogout();"><a
												class="nav-link tm-nav-link" href="Logout" onclick="kakaoLogout();">로그아웃</a></li>
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
				<div class="text-white">
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

		<div class="container-fluid">
			<main>
				<div class="row justify-content-center pt-4">
					<div class="justify-content-center">
						<div class="d-flex justify-content-between">
							<div id="YJ_content">
								<h1>카테고리</h1>
							</div>

							<div class="search">
								<input id="YJ_input" type="text" placeholder="검색어 입력"> <img
									id="YJ_img"
									src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
							</div>

						</div>
						<div>
							<!-- <h3 class="tm-text-primary tm-categories-text">Categories:</h3> -->

							<!-- 추가할 부분 -->
							<ul class="nav d-flex justify-content-start">
								<li class="nav-item tm-category-item"><a href=""
									class="nav-link tm-category-link" style="color: black">전체</a></li>

								<li class="nav-item tm-category-item"><a href=""
									class="nav-link tm-category-link">공부</a></li>

								<li class="nav-item tm-category-item"><a href=""
									class="nav-link tm-category-link">시험</a></li>

								<li class="nav-item tm-category-item"><a href=""
									class="nav-link tm-category-link">과제</a></li>

								<li class="nav-item tm-category-item"><a href=""
									class="nav-link tm-category-link">입시</a></li>

								<li class="nav-item tm-category-item"><a href=""
									class="nav-link tm-category-link">수능</a></li>

								<li class="nav-item tm-category-item"><a href=""
									class="nav-link tm-category-link">일상</a></li>

								<li class="nav-item tm-category-item"><a href=""
									class="nav-link tm-category-link">운동</a></li>

								<li class="nav-item tm-category-item"><a href=""
									class="nav-link tm-category-link">건강</a></li>

								<li class="nav-item tm-category-item"><a href=""
									class="nav-link tm-category-link">여행</a></li>

								<li class="nav-item tm-category-item"><a href=""
									class="nav-link tm-category-link">음악</a></li>

								<li class="nav-item tm-category-item"><a href=""
									class="nav-link tm-category-link">친구</a></li>

								<li class="nav-item tm-category-item"><a href=""
									class="nav-link tm-category-link">응원</a></li>

								<li class="nav-item tm-category-item"><a href=""
									class="nav-link tm-category-link">봉사</a></li>

								<li class="nav-item tm-category-item"><a href=""
									class="nav-link tm-category-link">취미</a></li>
							</ul>

							<script type="text/javascript">
                  $(document).ready(function() {
                       $(".tm-category-item").click(function() {
                         var selectedCategory = $(this).text(); // 선택된 카테고리 텍스트 가져오기
                         

                         console.log(selectedCategory);
                         
                         $.ajax({
                           url: 'GetCate', // 데이터를 보낼 서버의 엔드포인트 URL
                           type: 'POST',
                           data: { category: selectedCategory }, // 서버로 보낼 데이터
                           success: function(response) {
                               if (selectedCategory === "카테고리") {
                                   // "카테고리"를 선택한 경우, 현재 페이지를 다시 로드
                                   location.reload();
                               } 
                           },
                           error: function(jqXHR, textStatus, errorThrown) {
                             // 요청이 실패했을 때 실행할 함수
                             console.error(textStatus, errorThrown);
                           }
                         });
                       });
                     });

                  
                  </script>

						</div>
					</div>
				</div>
				<div class="row tm-catalog-item-list">


					<!-- 오픈 TODO 시작점 (반복되는 부분)-->
					<!-- ========================================================================================== -->

					<%
					for (int i = 0; i < openTodo.size(); i++) {
						if (openCategory == null || openCategory.equals(openTodo.get(i).getCate()) || "전체".equals(openCategory)) {
					%>
					<div class="col-lg-6 col-md-6 col-sm-6 tm-catalog-item card">
						<div
							class="p-4 tm-bg-gray tm-catalog-item-description card-header">

							<img class="img1"
								src="./Img/profile.png"> <a
								href="calendar.jsp?email=<%=openTodo.get(i).getEmail()%>"> <%=openTodo.get(i).getNickname()%>
							</a>
							<button class="bookmark">
								<i class="xi-bookmark xi-2x"
									style="color: rgb(171, 177, 182);; border: none !important;"></i>
							</button>
						</div>
						<div class="p-4 tm-bg-gray tm-catalog-item-description ">
							<p class="yj_title"><%=openTodo.get(i).getTitle()%></p>
						</div>
						<div class="p-4 tm-bg-gray tm-catalog-item-description card-body">
							<ul class="todoList">
								<!-- 할 일 목록을 감싸는 ul 요소 추가 -->
								<%
								for (int k = 0; k < openTodoTask.size(); k++) {
								%>
								<%
								if (openTodoTask.get(k).getCal_num() == openTodo.get(i).getCal_num()) {
								%>
								<li><%=openTodoTask.get(k).getTask()%></li>
								<%
								}
								%>
								<%
								}
								%>
							</ul>
						</div>
						<div
							class="p-4 tm-bg-gray tm-catalog-item-description card-footer">
							<button class="heartBtn" onclick="addLike()">
								<i class=" xi-heart-o xi-2x"> <!--  <li class="like_count" onchange="countPlus()">
                    좋아요 0개 
                </li> -->
								</i>
							</button>
							<h3 class="like_count" onchange="countPlus()">좋아요 0개</h3>


							<!-- 추가해야함!! (영준)-->
							<%
							// 카테고리 값이 null이라면 출력을 하지않고 null이 아니라면 출력을 안하는 로직
							if (openTodo.get(i).getCate() != null) {
								String category = openTodo.get(i).getCate();
								out.print("<h3>#</h3>");
							%>
							<h3><%=category%></h3>
							<%
							}
							%>
							<a href="#">&nbsp;댓글</a>

						</div>
					</div>
					<%
					}
					}
					%>

					<!-- 오픈 TODO 끝점 -->
					<!-- ========================================================================================== -->

				</div>

				<div class="more" align="center">
					<button>더보기</button>
				</div>

				<!-- Catalog Paging Buttons -->
				<div></div>
			</main>


			
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
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script type="text/javascript">
	
		Kakao.init('933b64ba38169aa59da21e60a71d4944');
		function kakaoLogout() {
			if (Kakao.Auth.getAccessToken()) {
				Kakao.API.request({
					url : '/v1/user/unlink',
					success : function(response) {
						console.log(response)
					},
					fail : function(error) {
						console.log(error)
					},
				})
				Kakao.Auth.setAccessToken(undefined)
			}
		}
	</script>
</body>
</html>