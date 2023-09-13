package com.plandly.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.plandly.model.TaskDAO;
import com.plandly.model.TaskDTO;


public class UpdateTaskIsDone extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		Integer todo_Num = Integer.parseInt(request.getParameter("todo_num"));
		
		int calendar_Num = Integer.parseInt(request.getParameter("cal_num"));
		String isDoneStr = request.getParameter("is_done");
		char is_Done = 'F';
		if (isDoneStr != null) {
		    is_Done = isDoneStr.charAt(0);
		}
		
		TaskDAO dao = new TaskDAO();
		TaskDTO dto = new TaskDTO(todo_Num, is_Done);
		
		dao.UpdateTaskIsDone(dto);
		
	}
	
	

}
