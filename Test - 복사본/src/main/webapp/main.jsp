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
<style>
html, body {
	width: 100%;
	height: 100%;
	margin: 0 auto;
	padding: 0;
	border: none;
}

.fc-event-time {
    display: none;
}

/* [컨테이너 크기 설정] */
#calendar {
	width: 95%;
	height: 90%;
	margin: 0 auto;
	position: relative;
	top: 5%;
}

#calendar {
	font-family: 'Arial', sans-serif;
	background-color: #F3EFFF; /* Light purple */
	border-color: #DAB6FF; /* Medium purple */
	box-shadow: 0px 10px 15px -3px rgba(134, 94, 156, 0.1), 0px 4px 6px -2px
		rgba(134, 94, 156, 0.05);
}

/* 캘린더 헤더 */
.fc-toolbar {
	background-color: #9B51E0; /* Dark purple */
	border-color: #6D28D9; /* Darker purple */
	border-radius: 5px;
}

/* 캘린더 버튼 */
.fc-button {
	background-color: #A78BFA; /* Purple variant*/
	color: #fff;
	border: 1 px solid #8B5CF6; /* Another Purple variant*/
	border-radius: 3 px;
}

.fc-button:hover {
	background-color: #C4B5FD; /* Lighter Purple variant on hover*/
	border-color: #A78BFA;
}

/* 캘린더 이벤트 타이틀 and Event Background Color*/
.fc-event-title, .fc-event {
	font-weight: bold;
	color: #000000;
}

.fc-event:hover {
	border-color: #4C1D95; /* On Hover make the border darker purple */
}

/* Style the event's time text and day number in month view*/
.fc-time, .fc-day-number {
	font-size: 12 px;
	color: #000000;
}

/* Style the today's date highlight and weekend days background color */
.fc-day-today, .fc-sat, .fc-sun {
	background-color: #DDD6FE;
}
</style>

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
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/dayjs/1.10.7/dayjs.min.js"></script>
<!-- ===================================================================================================== -->


<!-- ===================================================================================================== -->
<!-- [자바스크립트 코드 지정] -->
<!-- ===================================================================================================== -->
<script>


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


        // [html 최초 로드 및 이벤트 상시 대기 실시] 
        window.onload = async function() {
            console.log("");
            console.log("=========================================");
            console.log("[window onload] : [start]");
            console.log("=========================================");
            console.log(""); 


            // [현재 날짜 및 시간 확인]
            var korea_date = dayjs(new Date().toLocaleString("en-US", {timeZone: "Asia/Seoul"}));
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
                    left: 'prev,next', // 이전, 다음
                    //left: 'prev,next,today', // 이전, 다음, 오늘
                    center: 'title', // 중앙 타이틀
                    right: 'dayGridMonth,timeGridDay' // 월, 일
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
        
                selectLongPressDelay:300, // 선택 클릭 발동 시간 
                
                
                
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
                },
                
                eventRemove: function(obj){ // 이벤트가 삭제되면 발생하는 이벤트
                    console.log("");
                    console.log("=========================================");
                    console.log("[window onload] : [eventRemove]");
                    console.log("-----------------------------------------");
                    console.log("[eventRemove] : " + JSON.stringify(obj));
                    console.log("=========================================");
                    console.log(""); 
                },

                //*
                eventClick : function(info) { // 등록된 일정 클릭 이벤트
                    console.log("");
                    console.log("=========================================");
                    console.log("[window onload] : [eventClick]");
                    console.log("-----------------------------------------");
                    console.log("[eventClick] : " + JSON.stringify(info));
                    console.log("=========================================");
                    console.log(""); 

                     // 캘린더에서 해당 일정 삭제
                        var deleteEvent = confirm("정말로 이 일정을 삭제하시겠습니까?");
					    
					    if (deleteEvent) {
					        info.event.remove();
					    }

                },
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
                     .then(response => response.json())
                     .then(data => console.log(data))
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

        };    
 
    </script>
</head>
<body>
	<!-- [컨테이너 생성] -->
	<div id="calendar"></div>

</body>
</html>