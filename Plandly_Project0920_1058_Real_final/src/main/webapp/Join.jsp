<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PLANDLY</title>
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.1/examples/floating-labels/">
<!-- Bootstrap core CSS -->
<link rel="stylesheet" href="css/all.min.css">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="//code.jquery.com/jquery-3.7.0.min.js"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script defer src="js/Join.js"></script>
<script defer src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="css/Join.css">
<style type="text/css">
@font-face {
	font-family: 'GmarketSansMedium';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/GmarketSansMedium.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

* {
	font-family: 'GmarketSansMedium' !important;
}
</style>
</head>
<body>
	<div class="wrapper">
		<div class="container">
			<div class="sign-up-container">
				<!--회원가입 -->
				<form class="login-form" action="MemberJoin" method="post">
					<h1>회원가입</h1>
					<div class="social-links">
						<div id="kakao" href="javascript:void(0)" onclick="kakaoLogin();">
						</div>
						<div id="naver" href="naver.com"></div>
						<div id="google" href="google.com"></div>
					</div>

					<span>간편로그인</span>
					<div class="join-box">
						<%-- email --%>
						<div>
							<input type="email" placeholder="Email" name="email" required
								autofocus>
						</div>
						<!-- 중복체크!! -->
						<div class="memcheck"
							style="display: flex; justify-content: center;">
							<button type="button"
								class="btn btn-outline-primary btnemailcheck">중복체크</button>
						</div>
						<div>
							<input type="password" placeholder="Password" name="pw" required
								autofocus>
						</div>

						<!--  <div><input type="text" placeholder="Name" name = "name"></div> -->
						<div>
							<input type="text" placeholder="Nick Name" name="nickName"
								required autofocus>
						</div>

						<div id="btn-group" role="group"
							aria-label="Basic radio toggle button group">
							<input class="btn btn-outline-primary btn-ms" name="gender"
								value="남"> <input class="btn btn-outline-primary btn-ms"
								name="gender" value="여">
						</div>
						<div>
							<input type="date" placeholder="생년월일" value="age" name="age">
						</div>

					</div>
					<input class="form_btn join" type="submit" value="회원가입"
						style="color: white;">
				</form>
			</div>




			<div class="sign-in-container">

				<!--로그인-->
				<form action="MemberJoin" method="post">
					<div id="error-message" style="color: red;">

						<%
						Map<String, Object> mySession = (Map<String, Object>) request.getSession().getAttribute("mySession");
						if (mySession != null) {
							String errorMessage = (String) mySession.get("errorMessage");

							if (errorMessage != null) {
								out.println(errorMessage);
								mySession.remove("errorMessage"); // 오류 메시지를 한 번만 표시하고 제거
							}
						} else {

						}
						%>
					</div>
					<h1>로그인</h1>
					<div class="social-links">
						<div id="kakao" href="javascript:void(0)" onclick="kakaoLogin();">
						</div>
						<div id="naver"></div>
						<div id="google" href="google.com"></div>
					</div>
					<span>간편로그인</span> <input type="email" placeholder="Email"
						name="email"> <input type="password"
						placeholder="Password" name="pw"> <input
						class="form_btn login" type="submit" value="로그인" onclick=""
						style="color: white;">
				</form>
			</div>
			<div class="overlay-container">
				<div class="overlay-left">
					<h1>오늘부터 PLANDLY !!</h1>
					<p>노력을 멈출 때까지 실패하는 법이란 없습니다.</p>
					<button id="signIn" class="overlay_btn">로그인</button>
				</div>
				<div class="overlay-right">
					<h1>오늘도 PLANDLY !!</h1>
					<p>어디로 가야할 지 모른다면, 어떤 길이든 상관없습니다.</p>
					<button id="signUp" class="overlay_btn">회원가입</button>
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
									nickName : response.properties.nickname,
								},
								success : function(result) {
									console.log(result);
									if (result.trim() === "SUCCESS") { // trim() 메소드를 사용하여 공백 제거 후 비교
										location.href = "Main.jsp"; // 회원 가입 성공 시 Main.jsp로 페이지 이동
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
			$('.btnemailcheck').on('click', function() {
				var email = $('input[name=email]').eq('0').val();
				console.log(email);

				$.ajax({
					url : "MemberCheck",
					data : {
						email : email
					},
					dataType : "text",
					success : function(data) {
						if (data === 'false') {
							alert('이미 사용중인 이메일입니다.');
							isEmailValid = false; // 이메일이 중복됨
						} else {
							alert('사용 가능한 아이디입니다.');
							isEmailValid = true; // 이메일이 중복되지 않음
						}
					},
					error : function(e) {
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