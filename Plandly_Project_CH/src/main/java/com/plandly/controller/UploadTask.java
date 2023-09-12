package com.plandly.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.plandly.model.CalendarDAO;
import com.plandly.model.CalendarDTO;
import com.plandly.model.TaskDAO;
import com.plandly.model.TaskDTO;

@WebServlet("/UploadTask")
public class UploadTask extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		int calendar_Num = Integer.parseInt(request.getParameter("cal_num"));

		CalendarDAO calDAO = new CalendarDAO();
		CalendarDTO calDTO = new CalendarDTO();

		CalendarDTO eventDTO = (CalendarDTO) calDAO.calNumToGet(calendar_Num);

		System.out.println(eventDTO.getStart()); // cal_num이 calendarNum인
		// 이벤트의 정보를 담은 eventDTO

		String task = request.getParameter("task_text");

		if (task != null) {

			TaskDAO dao = new TaskDAO();
			TaskDTO dto = new TaskDTO(calendar_Num, task);

			System.out.println(task);

			int cnt = dao.UploadTask(dto);

			if (cnt > 0) {
				
				System.out.println("Task 입력 완료");
				response.setContentType("application/json");
				response.setCharacterEncoding("UTF-8");

				Map<String, Integer> map = new HashMap<String, Integer>();
				
				System.out.println(dto.getTodo_Num());
				map.put("TODO_NUM", dto.getTodo_Num()); // getTodo_Num() 메소드가 TaskDto에 정의되어 있어야 합니다.

				Gson gson = new Gson();
				String data = gson.toJson(map);
				PrintWriter out = response.getWriter();
				out.println(data);
				
			} else {
				System.out.println("Task 입력 실패");
			}

		}

	}

}
