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

<link rel="stylesheet" href="css/calendarStyles.css">
<link rel="stylesheet" href="css/todo.css">
<link rel="stylesheet" href="css/calContainer.css">
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
	<!-- [컨테이너 생성] -->
	<div id="main-container">
		<div id="calendar-container">
			<!-- 캘린더 -->
			<div id="calendar"></div>
		</div>
		<div id="todo-container">
			<h3 id="event-title"></h3>
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
		</div>
	</div>
</body>
</html>