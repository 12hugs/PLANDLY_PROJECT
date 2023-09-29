package com.plandly.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.plandly.model.TaskDAO;


public class DeleteTask extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		int todo_num = Integer.parseInt(request.getParameter("todo_num"));

		TaskDAO dao = new TaskDAO();
		
		int cnt = dao.DeleteTask(todo_num);
		
		if (cnt > 0) {
			System.out.println("삭제 성공");

		} else {
			System.out.println("삭제 실패");

		}
		
		
		
		
	}

}
