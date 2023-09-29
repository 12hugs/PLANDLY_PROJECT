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
<title>Video Catalog</title>
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
<body>



	<div class="tm-page-wrap mx-auto">
		<div class="position-relative">
			<div class="potition-absolute tm-site-header">
				<div class="container-fluid position-relative">
					<div class="row">
						<div class="col-7 col-md-4">
							<h1 class="tm-site-name">Video Catalog</h1>
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
					<p
						class="pt-5 px-3 tm-welcome-text tm-welcome-text-2 mb-1 mt-lg-0 mt-5 text-white mx-auto">
						여기에<br>명언이나<br>시계넣으면 될 듯?
					</p>
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
						Plandly_MemberVO vo = dao.getMemberByEmail(hostEmail);
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
					<div id="main-container">
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
							<input type="text" id="new-task" placeholder="새로운 할 일을 입력하세요"
								style="display: none;">
							<button id="add-task-button" style="display: none;">추가</button>
							<button id="event-delete-button" class ="w-btn w-btn-indigo"style="display: none;">
								이벤트 삭제
								<!-- 여기에 휴지통 이미지 삽입 -->
							</button>
							<ul id="task-list"></ul>

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
							질문사항이나 문의사항이 있으시면, <br>아래 메일 보내기를 눌러주세요
						</p>
						<a href="mailto:1211dbals@gmail.com?body=문의사항을 작성해주세요."> mail
						</a>
					</div>
				</div>
				<div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-12 mb-4">
					<div class="p-5 tm-bg-gray">
						<h3 class="tm-text-primary mb-4">빠른 이동</h3>
						<ul class="list-unstyled tm-footer-links">
							<li><a href ="Main.jsp">오픈 투두</a></li>
							<li><a href ="calendar.jsp">마이 투두</a></li>
							<div class="dropdown">
                                             <li> <a class="nav-link tm-nav-link infoo">내 정보 <span class="sr-only">(current)</span></a></li>
                                              <div class="dropdown-content">
                                                 <a href="MyPage_1.jsp">정보 수정</a>
                                                 <a href="MyPage_2.jsp">댓글 단 TODO</a>
                                                 <a href="MyPage_3.jsp">찜 한 TODO</a>
                                              </div>
                                            </div>
							

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
						Copyright 2023 smhrd TEAM CARRYPORT - Designed by <a
							href="https://templatemo.com" rel="nofollow" target="_parent">TemplateMo</a>
					</p>

				</div>
			</footer>
		</div>

	</div>


	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/parallax.min.js"></script>
</body>
</html>