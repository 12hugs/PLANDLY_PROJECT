package com.plandly.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.plandly.model.TaskDAO;
import com.plandly.model.TaskDTO;

public class LoadTask extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");

		int calendar_Num = Integer.parseInt(request.getParameter("cal_num"));

		TaskDAO dao = new TaskDAO();
		TaskDTO dto = new TaskDTO();

		List<TaskDTO> tasks = dao.LoadTask(calendar_Num);

		if (tasks != null) {
			System.out.println("Task 로드 완료");
			response.setContentType("application/json"); // Response 형태를 JSON으로 설정
			response.setCharacterEncoding("UTF-8"); // 인코딩을 UTF-8로 설정
			new Gson().toJson(tasks, response.getWriter()); // tasks 객체를 JSON으로 변환하여 클라이언트에게 전송
		} else {
			System.out.println("Task 로드 실패");
		}

	}

}
