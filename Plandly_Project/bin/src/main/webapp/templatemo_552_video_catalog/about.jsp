<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Video Catalog</title>
<link rel="stylesheet" href="fontawesome/css/all.min.css">
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
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.10.7/dayjs.min.js"></script>
<!-- ===================================================================================================== -->


<!-- ===================================================================================================== -->
<!-- [자바스크립트 코드 지정] -->
<!-- ===================================================================================================== -->
<script src="js/calendar.js"></script>
<script src="js/todo.js"></script>


</head>
<body>
	<div class="tm-page-wrap mx-auto">
		<div class="position-relative">
			<div class="potition-absolute tm-site-header">
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
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="index.html">Videos</a></li>
											<li class="nav-item active"><a
												class="nav-link tm-nav-link" href="about.html">About <span
													class="sr-only">(current)</span></a></li>
											<li class="nav-item"><a class="nav-link tm-nav-link"
												href="contact.html">Contact</a></li>
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
						Another Image BG<br>it can be fixed.<br>Content will
						simply slide over.
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

					<div id="main-container">
						<div id="calendar-container">
							<!-- 캘린더 -->
							<div id="calendar"></div>
						</div>
						<div id="todo-container">
							<h3 id="event-title"></h3>
							<span id="isPublic-set" style="display: none;">공개/비공개</span> <label
								class="isPublic-switch"> <input type="checkbox"
								id="isPublic-togBtn">
								<div class="isPublic-slider round" id="isPublic-slider"
									style="display: none;"></div>
							</label>
							<p id="event-date"></p>
							<select id="category-dropdown" style="display: none;">
								<option value="">-- 카테고리 선택 --</option>
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
							<button id="event-delete-button" style="display: none;">
								이벤트 삭제
								<!-- 여기에 휴지통 이미지 삽입 -->
							</button>
							<input type="text" id="new-task" placeholder="새로운 할 일을 입력하세요"
								style="display: none;">
							<button id="add-task-button" style="display: none;">추가</button>
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

				</div>

				<div class="parallax-window" data-parallax="scroll"
					data-image-src="img/about-2.jpg"></div>

				<div class="mx-auto tm-content-container mt-4 px-3">
					<div class="row tm-catalog-item-list mb-4">
						<div class="col-lg-4 col-md-6 col-sm-12 tm-catalog-item">
							<div class="tm-bg-gray p-4">
								<i class="fas fa-headphones fa-5x p-3 mb-4 tm-about-icon"></i>
								<h3 class="tm-text-primary mb-3">Cras convallis mollis
									justo</h3>
								<p>Sed dapibus vulputate diam nec hendrerit. In libero
									purus, interdum vitae purus nec, convallis sollicitudin nunc.
									Curabitur maximus maximus ex a scelerisque.</p>
							</div>
						</div>
						<div class="col-lg-4 col-md-6 col-sm-12 tm-catalog-item">
							<div class="tm-bg-gray p-4">
								<i class="fas fa-broadcast-tower fa-5x p-3 mb-4 tm-about-icon"></i>
								<h3 class="tm-text-primary mb-3">Nullam dictum pretium</h3>
								<p>Quisque vestibulum lectus eros, tincidunt ultricies ante
									euismod non. Ut sed consequat est, quis lobortis lorem. Nullam
									dictum pretium mauris eu aliquam.</p>
							</div>
						</div>
						<div class="col-lg-4 col-md-6 col-sm-12 tm-catalog-item">
							<div class="tm-bg-gray p-4">
								<i class="fas fa-film fa-5x p-3 mb-4 tm-about-icon"></i>
								<h3 class="tm-text-primary mb-3">Etiam in quam dolor</h3>
								<p>Aliquam in congue diam, non tincidunt ligula. Suspendisse
									facilisis elit eget quam semper aliquet. Donec ut purus
									aliquet, imperdiet lacus id, faucibus lectus.</p>
							</div>
						</div>
						<div class="col-lg-4 col-md-6 col-sm-12 tm-catalog-item">
							<div class="tm-bg-gray p-4">
								<i class="far fa-map fa-5x p-3 mb-4 tm-about-icon"></i>
								<h3 class="tm-text-primary mb-3">Duis ornare felis nec orci</h3>
								<p>Nam dapibus lectus ultricies neque feugiat eleifend.
									Donec ornare dolor suscipit metus hendrerit, vel malesuada
									neque mattis. Fusce posuere cursus mattis.</p>
							</div>
						</div>
						<div class="col-lg-4 col-md-6 col-sm-12 tm-catalog-item">
							<div class="tm-bg-gray p-4">
								<i class="fas fa-rainbow fa-5x p-3 mb-4 tm-about-icon"></i>
								<h3 class="tm-text-primary mb-3">Class aptent taciti
									sociosqu</h3>
								<p>Maecenas et libero in eros laoreet finibus sed vitae
									diam. Etiam consetetur, nunc sed pretium elementum, diam erat
									fringilla tortor, placerat condimentum.</p>
							</div>
						</div>
						<div class="col-lg-4 col-md-6 col-sm-12 tm-catalog-item">
							<div class="tm-bg-gray p-4">
								<i class="fas fa-cloud-sun-rain fa-5x p-3 mb-4 tm-about-icon"></i>
								<h3 class="tm-text-primary mb-3">Suspendisse ut malesuada</h3>
								<p>Vestibulum non lectus id lacus aliquet porttitor in non
									nulla. Aenean urna diam, finibys id lorem nec, feugiat
									convallis dolor. Integer aliquam, eros eget rutrum iaculis.</p>
							</div>
						</div>
					</div>
				</div>

				<div class="parallax-window" data-parallax="scroll"
					data-image-src="img/about-3.jpg"></div>
			</div>
		</main>

		<div class="container-fluid tm-content-container mx-auto pt-5">
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
	</div>

	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/parallax.min.js"></script>
</body>
</html>