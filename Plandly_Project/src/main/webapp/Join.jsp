<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script src="//code.jquery.com/jquery-3.7.0.min.js"></script>
</head>
<body>
	<ul>
        <li onclick="kakaoLogin();"><a href="javascript:void(0)"> <span>카카오 로그인</span> </a></li>
        <li onclick="kakaoLogout();"><a href="javascript:void(0)"> <span>카카오 로그아웃</span> </a></li>
    </ul>
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

	// 카카오 로그아웃
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