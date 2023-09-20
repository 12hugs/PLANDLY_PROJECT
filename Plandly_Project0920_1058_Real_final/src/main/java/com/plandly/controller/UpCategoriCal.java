package com.plandly.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.plandly.model.CalendarDAO;
import com.plandly.model.CalendarDTO;


public class UpCategoriCal extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String cate = request.getParameter("cate");
		int cal_num = Integer.parseInt(request.getParameter("cal_num"));
		
		
		CalendarDTO dto = new CalendarDTO(cal_num, cate);
		CalendarDAO dao = new CalendarDAO();
		
		
		int cnt = dao.UpCategoriCal(dto);
		
		
	}

}
