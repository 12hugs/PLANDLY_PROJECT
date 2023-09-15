
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
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/templatemo-video-catalog.css">


</head>

<style>
.mx-auto tm-content-container {
	display: flex;
}

.img1 {
	width: 100px; /* 원하는 가로 크기로 설정하세요. */
	height: auto; /* 'auto'로 설정하면 가로 크기에 맞게 세로 크기가 자동 조절됩니다. */
}

.card-footer {
	display: flex;
}

.card-header {
	display: flex;
	justify-content: flex-end;
}

.card-body {
	padding-top: 0 !important;
	padding-bottom: 0 !important;
}

.card {
	background-color: var(--c-background-primary) !important;
	box-shadow: 0 3px 3px 0 rgba(0, 0, 0, 0.05), 0 5px 15px 0
		rgba(0, 0, 0, 0.05) !important;
	border-radius: 8px !important;
	overflow: hidden !important;
	display: flex !important;
	flex-direction: column !important;
	padding-left: 0 !important;
	padding-right: 0 !important;
}

.toggleSwitch {
	width: 100px;
	margin: 30px;
	height: 50px;
	display: block;
	position: relative;
	border-radius: 30px;
	background: #838181a4 !important;
	box-shadow: 0 0 16px 3px rgba(0 0 0/ 15%);
	cursor: pointer;
}

.toggleSwitch .toggleButton {
	width: 40px;
	height: 40px;
	position: absolute;
	top: 50%;
	left: 4px;
	transform: translateY(-50%);
	border-radius: 50%;
	background: #ffefef00;
}

.toggleSwitch.active {
	background: #030202be;
}

.toggleSwitch.active .toggleButton {
	left: calc(100% - 44px);
	background: #838181a4 !important;
}

.toggleSwitch, .toggleButton {
	transition: all 0.2s ease-in;
}

.yj_title{
	font-size: x-large;
}

.tm-catalog-item {
    text-align: left;!important
}
</style>
<body>

	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>

	<%
	// 인생카운트다운 시계 로직
	Plandly_MemberVO vo = (Plandly_MemberVO) session.getAttribute("vo");
	vo.setEmail(vo.getEmail());
	System.out.println(vo.getEmail() + vo.getPw() + vo.getAge() + vo.getGender() + vo.getNickName());
	String age = vo.getAge();
	System.out.println(age);
	Lifecount watch = new Lifecount();
	String lifeWatch = watch.counting(age);
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
			<div class="position-absolute tm-site-header">
				<div class="container-fluid position-relative">
					<div class="row">
						<div class="col-7 col-md-4">
							<a href="index.html"
								class="tm-bg-black text-center tm-logo-container"> <i
								class="fas fa-video tm-site-logo mb-3"></i>
								<h1 class="tm-site-name">Video Catalog</h1>
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
												class="nav-link tm-nav-link" href="#">오픈투두<span
													class="sr-only">(current)</span></a></li>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="calendar.jsp">마이투두</a></li>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="./MyPage.jsp">내 정보</a></li>
										</ul>
									</div>
								</nav>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="tm-welcome-container text-center text-white">
				<div class="tm-welcome-container-inner">
					<p class="tm-welcome-text mb-1 text-white">Video Catalog is
						brought to you by TemplateMo.</p>
					<p class="tm-welcome-text mb-5 text-white">This is a full-width
						video banner.</p>
					<a href="#content"
						class="btn tm-btn-animate tm-btn-cta tm-icon-down"> <span>Discover</span>
					</a>
				</div>
			</div>

			<div id="tm-video-container">
				<video autoplay muted loop id="tm-video">
					<!-- <source src="video/sunset-timelapse-video.mp4" type="video/mp4"> -->
					<source src="video/wheat-field.mp4" type="video/mp4">
				</video>
			</div>

			<i id="tm-video-control-button" class="fas fa-pause"></i>
		</div>

		<div class="container-fluid">
			<div id="content" class="mx-auto tm-content-container">
				<main>
					<div class="row">
						<div class="col-12">
							<h2 class="tm-page-title mb-4">Our Video Catalog</h2>
							<div class="tm-categories-container mb-5">
								<h3 class="tm-text-primary tm-categories-text">Categories:</h3>
								<ul class="nav tm-category-list">
									<li class="nav-item tm-category-item"><a href="#"
										class="nav-link tm-category-link active">All</a></li>
									<li class="nav-item tm-category-item"><a href="#"
										class="nav-link tm-category-link">Drone Shots</a></li>
									<li class="nav-item tm-category-item"><a href="#"
										class="nav-link tm-category-link">Nature</a></li>
									<li class="nav-item tm-category-item"><a href="#"
										class="nav-link tm-category-link">Actions</a></li>
									<li class="nav-item tm-category-item"><a href="#"
										class="nav-link tm-category-link">Featured</a></li>
								</ul>
							</div>
						</div>
					</div>


					<div class="row tm-catalog-item-list">


						<!-- 오픈 TODO 시작점 (반복되는 부분)-->
						<!-- ========================================================================================== -->

						<%
						for (int i = 0; i < openTodo.size(); i++) {
						%>
						<div class="col-lg-4 col-md-5 col-sm-6 col-12 tm-catalog-item text-left">
							<div class="p-4 tm-bg-gray tm-catalog-item-description">
								<div>
									<span><img class="img1"
										src="https://assets.codepen.io/285131/github.svg"></span>
									<h3><%=openTodo.get(i).getNickname()%></h3>
								</div>
							</div>
							<div class="p-4 tm-bg-gray tm-catalog-item-description">
								<p class="yj_title"><%=openTodo.get(i).getTitle()%></p>
							</div>
							<div class="p-4 tm-bg-gray tm-catalog-item-description">
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
							<div class="p-4 tm-bg-gray tm-catalog-item-description">
								<h3>Like</h3>
								<h3><%=openTodo.get(i).getCate()%></h3>
								<h3>댓글</h3>
							</div>
						</div>
						<%
						}
						%>

						<!-- 오픈 TODO 끝점 -->
						<!-- ========================================================================================== -->

					</div>

					<!-- Catalog Paging Buttons -->
					<div>
						<ul class="nav tm-paging-links">
							<li class="nav-item active"><a href="#"
								class="nav-link tm-paging-link">1</a></li>
							<li class="nav-item"><a href="#"
								class="nav-link tm-paging-link">2</a></li>
							<li class="nav-item"><a href="#"
								class="nav-link tm-paging-link">3</a></li>
							<li class="nav-item"><a href="#"
								class="nav-link tm-paging-link">4</a></li>
							<li class="nav-item"><a href="#"
								class="nav-link tm-paging-link">></a></li>
						</ul>
					</div>
				</main>

				<!-- Subscribe form and footer links -->
				<div class="row mt-5 pt-3">
					<div class="col-xl-6 col-lg-12 mb-4">
						<div class="tm-bg-gray p-5 h-100">
							<h3 class="tm-text-primary mb-3">Do you want to get our
								latest updates?</h3>
							<p class="mb-5">Please subscribe our newsletter for upcoming
								new videos and latest information about our work. Thank you.</p>
							<form action="" method="GET" class="tm-subscribe-form">
								<input type="text" name="email" placeholder="Your Email..."
									required>
								<button type="submit"
									class="btn rounded-0 btn-primary tm-btn-small">Subscribe</button>
							</form>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-12 mb-4">
						<div class="p-5 tm-bg-gray">
							<h3 class="tm-text-primary mb-4">Quick Links</h3>
							<ul class="list-unstyled tm-footer-links">
								<li><a href="#">Duis bibendum</a></li>
								<li><a href="#">Purus non dignissim</a></li>
								<li><a href="#">Sapien metus gravida</a></li>
								<li><a href="#">Eget consequat</a></li>
								<li><a href="#">Praesent eu pulvinar</a></li>
							</ul>
						</div>
					</div>
					<div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-12 mb-4">
						<div class="p-5 tm-bg-gray h-100">
							<h3 class="tm-text-primary mb-4">Our Pages</h3>
							<ul class="list-unstyled tm-footer-links">
								<li><a href="#">Our Videos</a></li>
								<li><a href="#">License Terms</a></li>
								<li><a href="#">About Us</a></li>
								<li><a href="#">Contact</a></li>
								<li><a href="#">Privacy Policies</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- row -->

				<footer class="row pt-5">
					<div class="col-12">
						<p class="text-right">
							Copyright 2020 The Video Catalog Company - Designed by <a
								href="https://templatemo.com" rel="nofollow" target="_parent">TemplateMo</a>
						</p>
					</div>
				</footer>
			</div>
			<!-- tm-content-container -->
		</div>

	</div>
	<!-- .tm-page-wrap -->
	<script>
   /* 공개키 토글  */
        const toggleList = document.querySelectorAll(".toggleSwitch");

        toggleList.forEach(($toggle) => {
        $toggle.onclick = () => {
            $toggle.classList.toggle('active');
        }
        });

        function setVideoSize() {
            const vidWidth = 1920;
            const vidHeight = 1080;
            let windowWidth = window.innerWidth;
            let newVidWidth = windowWidth;
            let newVidHeight = windowWidth * vidHeight / vidWidth;
            let marginLeft = 0;
            let marginTop = 0;

            if (newVidHeight < 500) {
                newVidHeight = 500;
                newVidWidth = newVidHeight * vidWidth / vidHeight;
            }

            if(newVidWidth > windowWidth) {
                marginLeft = -((newVidWidth - windowWidth) / 2);
            }

            if(newVidHeight > 720) {
                marginTop = -((newVidHeight - $('#tm-video-container').height()) / 2);
            }

            const tmVideo = $('#tm-video');

            tmVideo.css('width', newVidWidth);
            tmVideo.css('height', newVidHeight);
            tmVideo.css('margin-left', marginLeft);
            tmVideo.css('margin-top', marginTop);
        }

        $(document).ready(function () {
            /************** Video background *********/

            setVideoSize();

            // Set video background size based on window size
            let timeout;
            window.onresize = function () {
                clearTimeout(timeout);
                timeout = setTimeout(setVideoSize, 100);
            };

            // Play/Pause button for video background      
            const btn = $("#tm-video-control-button");

            btn.on("click", function (e) {
                const video = document.getElementById("tm-video");
                $(this).removeClass();

                if (video.paused) {
                    video.play();
                    $(this).addClass("fas fa-pause");
                } else {
                    video.pause();
                    $(this).addClass("fas fa-play");
                }
            });
        })
</script>

</body>
</html>