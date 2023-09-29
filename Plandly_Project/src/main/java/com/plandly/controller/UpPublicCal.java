package com.plandly.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.plandly.model.CalendarDAO;
import com.plandly.model.CalendarDTO;


public class UpPublicCal extends HttpServlet {
	
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		int cal_num = Integer.parseInt(request.getParameter("cal_num"));
		
		String is_public = request.getParameter("is_public");
		
		CalendarDAO dao = new CalendarDAO();
		CalendarDTO dto = new CalendarDTO(is_public, cal_num);
		
		dao.UpPublicCal(dto);
		
	}

}
