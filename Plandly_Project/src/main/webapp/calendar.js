

/*
-----------------------------------------
[요약 설명]
-----------------------------------------
1. fullcalendar 는 HTML5 에서 사용할 수 있는 캘린더 라이브러리 입니다
-----------------------------------------
2. fullcalendar 는 데스크톱 및 모바일 장치에서 캘린더 일정 관리를 지원합니다
-----------------------------------------
3. fullcalendar 는 구글 API 와 연동하여, 개인 일정을 쉽게 관리할 수 있습니다
-----------------------------------------
4. window.onload : 브라우저 로드 완료 상태를 나타냅니다         
-----------------------------------------
5. 참고 사이트 : 

https://fullcalendar.io/
-----------------------------------------
*/


window.onload = async function() {

	var deleteEvent = null;


	console.log("");
	console.log("=========================================");
	console.log("[window onload] : [start]");
	console.log("=========================================");
	console.log("");


	// [현재 날짜 및 시간 확인]
	var korea_date = dayjs(new Date().toLocaleString("en-US", { timeZone: "Asia/Seoul" }));
	var format = "YYYY-MM-DDTHH:mm:ss"; // 포맷 타입
	var koreaNow = korea_date.format(format);


	// [calendar 객체 지정]
	var calendarElement = document.getElementById("calendar");


	// [full-calendar 생성]
	var calendar = new FullCalendar.Calendar(calendarElement, {

		expandRows: true, // 화면에 맞게 높이 재설정
		slotMinTime: '00:00', // 캘린더에서 일정 시작 시간
		slotMaxTime: '23:59', // 캘린더에서 일정 종료 시간

		// 해더에 표시할 툴바
		headerToolbar: {
			// 이전, 다음
			left: 'today',//left: 'prev,next,today', // 이전, 다음, 오늘
			center: 'title', // 중앙 타이틀
			right: 'prev, next' // 월, 일
			//right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek' // 월, 주, 일, 일정목록
		},

		initialView: 'dayGridMonth', // 초기 로드 될때 보이는 캘린더 화면 (기본 설정: 달)

		//initialDate: '2023-08-06', // 초기 날짜 설정 (설정하지 않으면 오늘 날짜가 보인다.)

		navLinks: true, // 날짜를 선택하면 Day 캘린더나 Week 캘린더로 링크

		editable: true, // 수정 가능 여부

		selectable: true, // 달력 일자 드래그 설정가능

		nowIndicator: true, // 현재 시간 마크

		dayMaxEvents: true, // 이벤트가 오버되면 높이 제한 (+ 몇 개식으로 표현)

		locale: 'ko', // 한국어 설정

		selectLongPressDelay: 300, // 선택 클릭 발동 시간 




		eventClick: function(info) { // 등록된 일정 클릭 이벤트
			console.log("");
			console.log("=========================================");
			console.log("[window onload] : [eventClick]");
			console.log("-----------------------------------------");
			console.log("[eventClick] : " + JSON.stringify(info));
			console.log("=========================================");
			console.log("");

			// 캘린더에서 해당 일정 삭제
			deleteEvent = confirm("정말로 이 일정을 삭제하시겠습니까?");

			if (deleteEvent) {
				// 선택된 이벤트의 정보 추출
				var eventTitle = info.event.title;
				var eventStart = info.event.start;
				var eventEnd = info.event.end;

				console.log(eventTitle);
				console.log(eventStart.toISOString());
				console.log(eventEnd.toISOString());

				// AJAX 요청으로 데이터 전송
				$.ajax({
					url: "DeleteCal", // 컨트롤러 URL 설정
					method: 'POST',
					data: {
						title: eventTitle,
						start: eventStart.toISOString(),
						end: eventEnd ? eventEnd.toISOString() : null
					},
					success: function(response) {
						// 성공적으로 처리된 후에 실행할 코드 작성
						console.log('일정이 성공적으로 삭제되었습니다.');

						info.event.remove();
					},
					error: function(xhr, status, error) {
						// 오류 발생 시 실행할 코드 작성
						alert("code:" + xhr.status + "\n" + "message:" + xhr.responseText + "\n" + "error:" + error);
					}

				});

			}




		},



		eventAdd: function(obj) { // 이벤트가 추가되면 발생하는 이벤트
			console.log("");
			console.log("=========================================");
			console.log("[window onload] : [eventAdd]");
			console.log("-----------------------------------------");
			console.log("[eventAdd] : " + JSON.stringify(obj));
			console.log("=========================================");
			console.log("");
		},

		eventChange: function(obj) { // 이벤트가 수정되면 발생하는 이벤트
			console.log("");
			console.log("=========================================");
			console.log("[window onload] : [eventChange]");
			console.log("-----------------------------------------");
			console.log("[eventChange] : " + JSON.stringify(obj));
			console.log("=========================================");
			console.log("");

			// 선택된 이벤트의 정보 추출
			var eventTitle = obj.event.title;
			var eventStart = obj.event.start;
			var eventEnd = obj.event.end;
			var oldTitle = obj.oldEvent.title;
			var oldStart = obj.oldEvent.start;
			var oldEnd = obj.oldEvent.end;

			console.log(eventTitle);
			console.log(eventStart.toISOString());
			console.log(eventEnd.toISOString());

			// AJAX 요청으로 데이터 전송
			$.ajax({
				url: "UpdateCal", // 컨트롤러 URL 설정
				method: 'POST',
				data: {
					title: eventTitle,
					start: eventStart.toISOString(),
					end: eventEnd ? eventEnd.toISOString() : null,
					oldTitle: oldTitle,
					oldStart: oldStart.toISOString(),
					oldEnd: oldEnd ? oldEnd.toISOString() : null
				},
				success: function(response) {
					// 성공적으로 처리된 후에 실행할 코드 작성
					console.log('일정 수정 성공.');
				},
				error: function(xhr, status, error) {
					// 오류 발생 시 실행할 코드 작성
					alert("code:" + xhr.status + "\n" + "message:" + xhr.responseText + "\n" + "error:" + error);
				}

			});
		},

		eventRemove: function(obj) { // 이벤트가 삭제되면 발생하는 이벤트
			console.log("");
			console.log("=========================================");
			console.log("[window onload] : [eventRemove]");
			console.log("-----------------------------------------");
			console.log("[eventRemove] : " + JSON.stringify(obj));
			console.log("=========================================");
			console.log("");




		},

		//*

		// */

		select: function(arg) { // 캘린더에서 특정 일자 선택 및 드래그로 일정 등록
			console.log("");
			console.log("=========================================");
			console.log("[window onload] : [select]");
			console.log("-----------------------------------------");
			console.log("[arg] : " + JSON.stringify(arg));
			console.log("=========================================");
			console.log("");

			var title = prompt('새로운 일정의 제목을 추가해주세요');

			if (title) {
				calendar.addEvent({
					title: title,
					start: arg.start,
					end: arg.end,
					displayEventTime: false
				})

			}
			// 여기서 서버에 데이터를 보냅니다.
			if (title) {

				fetch('UploadCal', {
					method: 'POST',
					headers: {
						'Content-Type': 'application/json'
						// 'Content-Type': 'application/x-www-form-urlencoded',
					},
					body: JSON.stringify({
						title: title,
						start: arg.start.toISOString(),
						end: arg.end ? arg.end.toISOString() : null,
					})
				})
					.then(response => response.text())  
					.then(text => console.log(text))  
					.catch((error) => {
						console.error('Error:', error);
					});
			}


			calendar.unselect()
		},

		// 이벤트 일정 등록
		// koreaNow(현재한국시간)
		// events 안의 값이 이벤트가 된다.
		/* events: [
			{title: '투케이 공부', start: koreaNow, end: koreaNow},
			{title: '투케이 공부', start: koreaNow, end: "2023-09-10"}
		] */

		events: "\GetEvents"
	});


	// [캘린더 랜더링]
	calendar.render();

}
