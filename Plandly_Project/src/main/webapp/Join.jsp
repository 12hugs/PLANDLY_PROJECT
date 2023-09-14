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
    <script defer src="js/Join.js"></script>
    <link rel="stylesheet" href="css/Join.css">
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
                  <!-- 중복체크!! -->
                  <div><button type="button" id="btn">중복체크</button></div>
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
        
        <!-- 중복체크 !! -->
    	<script type="text/javascript">
    	$(document).ready(function() {
    	    var isEmailValid = false; // 이메일 유효성 여부를 저장하는 변수

    	    // 중복체크 버튼 클릭 시 중복 여부 확인
    	    $('#btn').on('click', function() {
    	        var email = $('input[name=email]').eq('0').val();
    	        console.log(email);

    	        $.ajax({
    	            url: "MemberCheck",
    	            data: { email: email },
    	            dataType: "text",
    	            success: function(data) {
    	                if (data === 'false') {
    	                    alert('이미 사용중인 이메일입니다.');
    	                    isEmailValid = false; // 이메일이 중복됨
    	                } else {
    	                    alert('사용 가능한 아이디입니다.');
    	                    isEmailValid = true; // 이메일이 중복되지 않음
    	                }
    	            },
    	            error: function(e) {
    	                alert('중복 체크에 실패하였습니다.');
    	                isEmailValid = false; // 중복 체크 실패
    	            },
    	        });
    	    });

    	    // 회원가입 버튼 클릭 시 중복 여부를 확인한 후 회원 가입 수행
    	    $('.join').on('click', function(e) {
    	        if (!isEmailValid) {
    	            e.preventDefault(); // 이메일이 중복되면 회원 가입을 막음
    	            alert('이메일 중복 여부를 확인해주세요.');
    	        }
    	    });
    	});

			</script>
</body>
</html>