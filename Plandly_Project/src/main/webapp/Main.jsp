<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.plandly.model.CalendarDAO"%>
<%@page import="com.plandly.model.CalendarDTO"%>
<%@page import="com.plandly.model.OpenTodoVO"%>
<%@page import="java.util.List"%>
<%@page import="com.plandly.model.Plandly_MemberDAO"%>
<%@page import="com.plandly.controller.Lifecount"%>
<%@page import="com.plandly.model.Plandly_MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-3.7.0.min.js"></script>
</head>

<body>
	<% // 인생카운트다운 시계 로직
	Plandly_MemberVO vo = (Plandly_MemberVO)session.getAttribute("vo");
	System.out.println(vo.getEmail()+vo.getPw()+vo.getAge()+vo.getGender()+vo.getNickName());
	String age = vo.getAge();
	System.out.println(age);
	Lifecount watch = new Lifecount();
	String lifeWatch = watch.counting(age);
	%>
	
	<!-- 인생카운트시계 텍스트 -->
    <span id="days"></span>일 
    <span id="hours"></span>시 
    <span id="minutes"></span>분 
    <span id="seconds"></span>초
	
	<% // 오픈 todo 로직
	
	String email = vo.getEmail();
	Plandly_MemberDAO dao = new Plandly_MemberDAO();
	List<OpenTodoVO> openTodoTask = dao.openTodoTask(); // 중복 제거 전
	List<OpenTodoVO> openTodo = dao.openTodo(); // 중복 제거 후
	
	System.out.print("중복제거 전"+openTodoTask.size());
	System.out.print("중복제거 후"+openTodo.size());
	%>

	<%for(int i = 0; i < openTodo.size(); i++){ %>
	<div>	
			<a><%=openTodo.get(i).getNickname()%></a><br>
		    <a><%=openTodo.get(i).getCate()%></a><br>
		    <a><%=openTodo.get(i).getStart()%></a><br>
		    <a><%=openTodo.get(i).getEnd()%></a><br>
		    <a><%=openTodo.get(i).getEmail()%></a><br>
		    
            <%for(int k = 0; k < openTodoTask.size(); k++){ %>
            
            	<%if (openTodoTask.get(k).getCal_num() == openTodo.get(i).getCal_num()){ %>
            		
            	<div class="form-check">
  					<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault" 
       				onclick="updateCheckbox(<%= openTodo.get(i).getCal_num() %>)">
  					<label class="form-check-label" for="flexCheckDefault"><%=openTodoTask.get(k).getTask()%></label>
				</div>
            		
            	<%} %>	
			<%} %>
			
    </div><br><br>
	    <%} %> 


	<script type="text/javascript">
		// 인생 카운트 시계 JS로직
		function startTimer(duration) {
			var timer = duration;
			var daysElement = document.querySelector('#days');
			var hoursElement = document.querySelector('#hours');
			var minutesElement = document.querySelector('#minutes');
			var secondsElement= document.querySelector('#seconds');
		
			setInterval(function () {
			    var days, hours, minutes, seconds;
			    days= Math.floor(timer / (24 * 60 * 60));
			    hours= Math.floor((timer / (60 * 60)) % 24);
			    minutes= Math.floor((timer / 60) % 60);
			    seconds= timer % 60;
		
			daysElement.textContent= days;
			hoursElement.textContent= hours;
			minutesElement.textContent= minutes;
			secondsElement.textContent= seconds;
		
			if (--timer < 0) {
			    timer = duration; // reset
			}
			}, 1000);
		}
		
		window.onload = function () {
			var lifeWatchStr = "<%=lifeWatch%>";
			var lifeWatchArr = lifeWatchStr.split("-");
			console.log(lifeWatchArr);
		
			var totalSeconds =
			    ((parseInt(lifeWatchArr[0]) * (24 * 60 * 60)) +
			        (parseInt(lifeWatchArr[1]) * (60 * 60)) +
			        (parseInt(lifeWatchArr[2]) * 60) +
			        parseInt(lifeWatchArr[3]));
		
			startTimer(totalSeconds);
		};
		
		function updateCheckbox(calendarNum) {
		    var isChecked = document.getElementById("flexCheckDefault").checked;

		    // 서버로 업데이트 요청을 보내는 코드 작성 (jQuery를 사용한 예시)
		    $.ajax({
		        type: "POST",
		        url: "Main.jsp", // MyBatis XML Mapper 파일의 경로로 수정
		        data: {
		            calendarNum: calendarNum,
		            isChecked: isChecked
		        },
		        success: function(response) {
		            if (response > 0) {
		                console.log("Checkbox updated successfully");
		            } else {
		                console.error("Failed to update checkbox");
		            }
		        },
		        error: function() {
		            console.error("Failed to send update request");
		        }
		    });
		}
	</script>
</body>

</html>