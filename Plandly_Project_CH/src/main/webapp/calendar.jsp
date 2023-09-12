<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- 반응형 구조 만들기 -->
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>Insert title here</title>

<!-- 내부 CSS 스타일 지정 -->

<link rel="stylesheet" href="calendarStyles.css">
<link rel="stylesheet" href="todo.css">
<link rel="stylesheet" href="calContainer.css">
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
<script src="calendar.js"></script>
<script src="todo.js"></script>
</head>
<body>
	<!-- [컨테이너 생성] -->
	<div id="main-container">
		<div id="calendar-container">
			<!-- 캘린더 -->
			<div id="calendar"></div>
		</div>
		<div id="todo-container">
			<h2 id="event-title"></h2>
			<p id="event-date"></p>
			<input type="text" id="new-task" placeholder="새로운 할 일을 입력하세요"
				style="display: none;">
			<button id="add-task-button" style="display: none;">추가</button>
			<ul id="task-list"></ul>
		</div>
	</div>
</body>
</html>