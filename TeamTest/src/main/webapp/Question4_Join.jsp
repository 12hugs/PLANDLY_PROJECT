<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<fieldset>
		<legend align="center">회원가입</legend>

		<!-- Question4_Login.jsp 경로로 바꿔주기!! -->
		<form action="JoinCon" method="post">
			<table align="center">
				<tr>
					<td>ID</td>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<td>PW</td>
					<td><input type="text" name="pw"></td>
				</tr>
				<tr>
					<td>NICK</td>
					<td><input type="text" name="nick"></td>
				</tr>
				<tr>
					<td>EMAIL</td>
					<td><input type="text" name="email"></td>
				</tr>
				<tr>
					<td>TEL</td>
					<td><input type="text" name="tel"></td>
				</tr>
				<tr>
					<td><input type="submit" value="회원가입"></td>
				</tr>
			</table>
		</form>
	</fieldset>

</body>