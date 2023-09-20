<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Video Catalog</title>
    <link rel="stylesheet" href="fontawesome/css/all.min.css"> <!-- https://fontawesome.com/ -->
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet">
    <!-- https://fonts.google.com/ -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/templatemo-video-catalog.css">
    <link rel="stylesheet" href="css/MyPage.css">

</head>
<!--

TemplateMo 552 Video Catalog

https://templatemo.com/tm-552-video-catalog

-->
<body>
   <div class="tm-page-wrap mx-auto">
      <div class="position-relative">
         <div class="potition-absolute tm-site-header">
            <div class="container-fluid position-relative">
               <div class="row">                  
                        <div class="col-7 col-md-4">
                            <a href="Main.jsp" class="tm-bg-black text-center tm-logo-container">
                                <i class="fas fa-video tm-site-logo mb-3"></i>
                                <h1 class="tm-site-name">PLANDLY</h1>
                            </a>
                        </div>
                        <div class="col-5 col-md-8 ml-auto mr-0">
                            <div class="tm-site-nav">
                                <nav class="navbar navbar-expand-lg mr-0 ml-auto" id="tm-main-nav">
                                    <button class="navbar-toggler tm-bg-black py-2 px-3 mr-0 ml-auto collapsed" type="button"
                                        data-toggle="collapse" data-target="#navbar-nav" aria-controls="navbar-nav"
                                        aria-expanded="false" aria-label="Toggle navigation">
                                        <span>
                                            <i class="fas fa-bars tm-menu-closed-icon"></i>
                                            <i class="fas fa-times tm-menu-opened-icon"></i>
                                        </span>
                                    </button>
                                    <div class="collapse navbar-collapse tm-nav" id="navbar-nav">
                                        <ul class="navbar-nav text-uppercase">
                                            <li class="nav-item">
                                                <a class="nav-link tm-nav-link" href="Main.jsp">오픈투두</a>
                                            </li>
                                            <li class="nav-item">
                                                <a class="nav-link tm-nav-link" href="calendar.jsp">마이투두</a>
                                            </li>
                                       
                                        <li class="nav-item active">
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
         <div class="tm-welcome-container tm-fixed-header tm-fixed-header-3">
            <div class="text-center">
               <p class="pt-5 px-3 tm-welcome-text tm-welcome-text-2 mb-1 mt-lg-0 mt-5 text-white mx-auto">
                        Talk to Us<br>about any question you have
                    </p>                   
            </div>                
            </div>

            <div id="tm-fixed-header-bg"></div> <!-- Header image -->
      </div>

      <!-- Page content -->
      <main>
         <div class="container-fluid px-0">
            <div class="mx-auto tm-content-container">               
               <div class="row mt-3 mb-5 pb-3">
                  <div class="col-12">
                     <div class="mx-auto tm-about-text-container px-3">
                        <h2 class="tm-page-title mb-4 tm-text-primary">개인 정보 변경</h2>
                        <p class="mb-4"></p>
                     </div>                     
                  </div>                  
               </div>
                    <div class="mx-auto pb-3 tm-about-text-container px-3">
                        <!-- <div class="row"> -->
                            <div class="col-lg-6 mb-5">
                                <form id="info-form" class="is-info" action="" method="POST" class="tm-contact-form">
                                    <div class="form-group pwche">
                                      <input type="password" name="pw" class="form-control rounded-0" placeholder="기존 비밀번호를 입력해주세요" required="" id="pw-1" /><!-- 비밀번호 확인 버튼 -->
                                      <input type="submit" value="확 인" id="pwcheck">
                                    </div>
                                    
                                    <div class="form-group">
                                      <input type="password" name="pw" class="form-control rounded-0" placeholder="PassWord" required="" />
                                    </div>
                                    <div class="form-group">
                                      <input type="date" name="age" class="form-control rounded-0" required="" />
                                    </div>
  
                                    <div class="form-group">
                                      <input type="text" name="nickname" class="form-control rounded-0" placeholder="NickName" required="" />
                                    </div>
  
                                    <div class="form-group">
                                      <!-- 성별 -->
                                      <div class="form-group">
                                          <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                                            <input type="radio" class="btn-check" name="gender" value="male" id="btnradio1" autocomplete="off" checked>
                                            <label class="btn btn-outline-primary" for="btnradio1">남</label>
                                                                              
                                            <input type="radio" class="btn-check" name="gender" value="female" id= "btnradio2 " autocomplete= "off ">
                                            <label class= "btn btn-outline-primary " for= "btnradio2 ">여</label>
                                          </div>
                                          <br>
                                  <div class="form-group mb-0">
                                    <br>
                                    <button type="submit" class="btn btn-primary rounded-0 d-block ml-auto mr-0 tm-btn-animate tm-btn-submit tm-icon-submit"><span>Submit</span></button>
                                  </div>
                                </form>    
                            </div>
                           
                        <!-- </div>   -->
                    </div>                                               
            </div>

            <div class="parallax-window parallax-window-2" data-parallax="scroll" data-image-src="img/contact-2.jpg"></div>

          
         </div>
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