package com.plandly.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.plandly.model.CalendarDAO;
import com.plandly.model.CalendarDTO;
import com.plandly.model.TaskDAO;
import com.plandly.model.TaskDTO;

public class LoadTask extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		int calendar_Num = Integer.parseInt(request.getParameter("cal_num"));

		TaskDAO dao = new TaskDAO();
		TaskDTO dto = new TaskDTO();

		CalendarDAO calendarDao = new CalendarDAO();
		CalendarDTO calendar = calendarDao.getCategori(calendar_Num);

		List<TaskDTO> tasks = dao.LoadTask(calendar_Num);

		if (tasks != null) {
			System.out.println("Task 로드 완료");

			Map<String, Object> responseMap = new HashMap<>();
			responseMap.put("tasks", tasks);
			responseMap.put("cate", calendar.getCate()); // 응답에 cate 값 추가

			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			new Gson().toJson(responseMap, response.getWriter()); // 변경된 응답 객체를 JSON으로 변환하여 클라이언트에게 전송
		} else {
			System.out.println("Task 로드 실패");
		}

	}

}
