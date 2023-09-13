<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="//code.jquery.com/jquery-3.7.0.min.js"></script>
 <script src = "https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script defer  src="./Join.js"></script>
    <link rel="stylesheet" href="./Join.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<body>
    <div class="wrapper">
        <div class="container">
          <div class="sign-up-container">
          <!--회원가입 -->
            <form class = "login-form"action = "MemberJoin" method="post">
              <h1>Create Account</h1>
              <div class="social-links">
                <div id = "kakao" href="javascript:void(0)" onclick="kakaoLogin();" >
                </div>
                <div id="naver" href="naver.com">
                  
                </div>
                <div id = "google" href="google.com">
                  
                </div>
              </div>
        
              <span>or use your email for registration</span>
              <div class = "join-box">
              <%-- email --%>
                  <div><input type="email" placeholder="Email" name ="email"></div>
                  <div><input type="password" placeholder="Password" name="pw"></div>
                  
                 <!--  <div><input type="text" placeholder="Name" name = "name"></div> -->
                  <div><input type="text" placeholder="Nick Name" name = "nickName"></div>
                 
                  <div class="btn-group" role="group" aria-label="Basic radio toggle button group">
                  <input type="radio" class="btn-check" name="gender" value="male" id="btnradio1" autocomplete="off" checked = "true">
                  <label class="btn btn-outline-primary" for="btnradio1">남</label>
                
                  <input type="radio" class="btn-check" name="gender" value="female" id="btnradio2" autocomplete="off">
                  <label class="btn btn-outline-primary" for="btnradio2">여</label>
                </div>
                   <div><input type="date" placeholder="생년월일" value = "age" name ="age"></div>
                  
                </div>
              <input class = "form_btn join" type="submit" value="회원가입">
            </form>
          </div>
          <div class="sign-in-container">
          
          <!--로그인-->
            <form action = "MemberJoin" method ="post">
              <h1>Sign In</h1>
              <div class="social-links">
                <div id = "kakao" href="javascript:void(0)" onclick="kakaoLogin();" >
                </div>
                <div id="naver">
                  
                </div>
                <div id = "google" href="google.com">
                  
                </div>
              </div>
              <span>or use your account</span>
              
              <input type="email" placeholder="Email" name = "email">
              <input type="password" placeholder="Password" name = "pw">
              <input class = "form_btn login" type="submit" value="로그인" onclick = ""> 
            </form>
          </div>
          <div class="overlay-container">
            <div class="overlay-left">
              <h1>Welcome Back</h1>
              <p>To keep connected with us please login with your personal info</p>
              <button id="signIn" class="overlay_btn">Login</button>
            </div>
            <div class="overlay-right">
              <h1>Hello, Friend</h1>
              <p>Enter your personal details and start journey with us</p>
              <button id="signUp" class="overlay_btn">Create Account</button>
            </div>
          </div>
        </div>
      </div>
      <script>
    // 카카오 로그인
        Kakao.init('933b64ba38169aa59da21e60a71d4944'); 
        
        function kakaoLogin() {
            Kakao.Auth.login({
                scope : 'profile_nickname, account_email, gender, age_range',
                success : function(response) {
                    Kakao.API.request({
                        url : '/v2/user/me',
                        success : function(response) {
                            var responseData = JSON.stringify(response);

                            // Ajax를 이용해 post방식으로 값 넘기기
                            $.ajax({
                                type : 'POST',
                                url : 'JoinServlet', // Login이라는 매핑값에 값을 넘김
                                data : {
                                    userId : response.id, 
                                    email : response.kakao_account.email,
                                    age : response.kakao_account.age_range,
                                    gender : response.kakao_account.gender,
                                    nickName: response.properties.nickname,
                                },
                                success : function(result) {
                                    console.log(result);
                                    if (result.trim() === "SUCCESS") {  // trim() 메소드를 사용하여 공백 제거 후 비교
                                        location.href = "Main.jsp";  // 회원 가입 성공 시 Main.jsp로 페이지 이동
                                    } else {
                                        alert("회원 가입 실패");
                                        // 실패 시 처리할 로직 작성
                                    }
                                },
                                error : function(error) {
                                    console.log(error);
                                },
                            });
                        },
                        fail : function(error) {
                            console.log(error);
                        },
                    });
                },
                fail : function(error) {
                    console.log(error);
                },
            });
        }
        </script>
    <!--     <script type="text/javascript">
$(document).ready(function() {
  // 회원가입 버튼 클릭 시 중복 체크 함수 호출
  $(".join").click(function(e) {
      e.preventDefault(); // 폼의 기본 동작(새로고침) 방지
      
      var email = $("input[name='email']").val(); // 입력한 이메일 값 가져오기
      
      // AJAX 요청 보내기
      $.ajax({
          url: "check_duplicate_email.jsp", // 중복 체크를 수행하는 서버 페이지 경로 지정
          type: "POST",
          data: { email : email }, // 서버에 전달할 데이터 설정 (여기서는 이메일)
          success:function(response){
              if(response === "duplicate"){
                  alert("중복된 이메일입니다.");
              } else if(response === "available") {
                  alert("사용 가능한 이메일입니다.");
              } else {
                  alert("중복 체크 실패");
              }
          },
          error:function(){
              alert("중복 체크 요청 실패");
          }
      });
      
      // 회원가입 로직 추가...
  });

  // 로그인 버튼 클릭 시 메인 화면으로 이동
  $(".login").click(function(e) {
     e.preventDefault(); // 폼의 기본 동작(새로고침) 방지
     
     var email = $("input[name='email']").val(); // 입력한 이메일 값 가져오기
     var password = $("input[name='pw']").val(); // 입력한 비밀번호 값 가져오기
     
     $.ajax({
         url: "login_process.jsp", // 로그인 처리를 수행하는 서버 페이지 경로 지정
         type: "POST",
         data: { email : email, password : password }, 
         success:function(response){
             if(response === "success"){
                 location.href = "Main.jsp";  // 로그인 성공 시 Main.jsp로 페이지 이동
             } else if (response === "fail") {
                 alert("로그인 실패");
             } else {
                 alert("알 수 없는 오류 발생");
             }
         },
         error:function(){
             alert("로그인 요청 실패");
         }
     });
     
     // 로그인 처리 및 리다이렉션...
   });
});
</script> -->
        
</body>
</html>