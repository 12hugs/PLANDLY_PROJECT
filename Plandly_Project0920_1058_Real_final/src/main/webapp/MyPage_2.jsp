<%@page import="com.plandly.controller.Lifecount"%>
<%@page import="com.plandly.model.Plandly_MemberVO"%>
<%@page import="com.plandly.model.FamousVO"%>
<%@page import="com.plandly.model.Plandly_MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>PLANDLY</title>
<!-- https://fontawesome.com/ -->
<link
   href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap"
   rel="stylesheet">
<!-- https://fonts.google.com/ -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/templatemo-video-catalog.css">
<link rel="stylesheet" href="css/MyPage.css">
<!--

TemplateMo 552 Video Catalog

https://templatemo.com/tm-552-video-catalog

-->
<script src="js/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/parallax.min.js"></script>
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
                        class="tm-bg-black text-center tm-logo-container"> <i
                        class="fas fa-video tm-site-logo mb-3"></i>
                        <h1 class="tm-site-name" style="color: #1a351f">PLANDLY</h1>
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
                                 <li class="nav-item"><a class="nav-link tm-nav-link"
                                    href="calendar.jsp">마이투두</a></li>
                                 <li class="nav-item active">
                                    <div class="dropdown">
                                       <a class="nav-link tm-nav-link">내 정보 <span
                                          class="sr-only">(current)</span></a>
                                       <div class="dropdown-content">
                                          <a href="MyPage_1.jsp">정보 수정</a> <a href="MyPage_2.jsp">댓글
                                             단 TODO</a> <a href="MyPage_3.jsp">좋아요 누른 TODO</a>
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
         <div class="tm-welcome-container tm-fixed-header tm-fixed-header-3">
            <div class="text-center">
               <div id="countdown" class="countdown text-black" style="color: #1a351f">
					
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
            <div class="text-center text-black" style="color: #1a351f">
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

      <!-- Page content -->
      <main>
         <div class="container-fluid px-0">
            <div class="mx-auto tm-content-container">
               <div class="row mt-3 mb-5 pb-3">
                  <div class="col-12">
                     <div class="mx-auto tm-about-text-container px-3">
                        <h2 class="tm-page-title mb-4 tm-text-primary">댓글 단 TODO</h2>
                        <p class="mb-4"></p>

                     </div>
                  </div>
               </div>
               <div class="mx-auto pb-3 tm-about-text-container px-3">
                  <!-- <div class="row"> -->
                  <!-- <div class="col-lg-6 mb-5"> -->
                  <!-- 테이블 목록 -->

                  <div class="comment-table">
                     <table class="table-fill">
                        <thead>
                           <tr>
                              <th class="text-left"></th>
                              <th class="text-left">댓글</th>
                              <th class="text-left">날짜</th>
                              <th class="text-left">달성률 </th>
                           </tr>
                        </thead>
                        <tbody class="table-hover">
                           <tr>
                              <td class="text-left">1</td>
                              <td class="text-left">오 ㅋㅋ</td>
                              <td class="text-left">23.08.25</td>
                              <td class="text-left">94.5%   </td>
                           </tr>
                           <tr>
                              <td class="text-left">2</td>
                              <td class="text-left">응원합니다!</td>
                              <td class="text-left">23.08.28</td>
                              <td class="text-left">95%   </td>
                           </tr>
                           <tr>
                              <td class="text-left">3</td>
                              <td class="text-left">저도 그거 하고 있는데 투퍼(투두리스트 퍼가)요~</td>
                              <td class="text-left">23.08.27</td>
                              <td class="text-left">87%   </td>
                           </tr>
                           <tr>
                              <td class="text-left">4</td>
                              <td class="text-left">오 오늘도 달성률 장난 아니시네요</td>
                              <td class="text-left">23.09.11</td>
                              <td class="text-left">99%   </td>
                           </tr>
                           <tr>
                              <td class="text-left">5</td>
                              <td class="text-left">자격증 결과 확인하는 날입니다!!</td>
                              <td class="text-left">23.10.08</td>
                              <td class="text-left">92.3%   </td>
                           </tr>
                        </tbody>
                     </table>
                  </div>


                  <!-- </div>   -->
               </div>
            </div>

            <div class="parallax-window parallax-window-2"
               data-parallax="scroll" data-image-src="img/contact-2.jpg"></div>


         </div>
      </main>

      <div class="row mt-5 pt-3">
         <div class="col-xl-6 col-lg-12 mb-4">
            <div class="tm-bg-gray p-5 h-100">
               <h3 class="tm-text-primary mb-3">문의사항</h3>
               <br>
               <p class="mb-5">
                  질문 혹은 문의사항이나 오류가 있으면 아래 mail을 눌러주세요.
               </p>
               <a href="mailto:1211dbals@gmail.com?body=문의사항을 작성해주세요."> mail </a>
            </div>
         </div>
         <div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-12 mb-4">
            <div class="p-5 tm-bg-gray h-100">
               <h3 class="tm-text-primary mb-4 ">CarryPort</h3>
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
               Copyright 2023 smhrd TEAM CARRYPORT - Designed by CarryPort
            </p>

         </div>
      </footer>
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