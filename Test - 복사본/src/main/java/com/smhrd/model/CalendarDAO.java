package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlSessionManager;

public class CalendarDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();

	public int calUpload(CalendarDTO dto) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int cnt = sqlSession.insert("com.smhrd.db.Mapper.UploadCal", dto);
		
		sqlSession.close();
		
		return cnt;
	}

	public List<CalendarDTO> getEvents() {

		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		List<CalendarDTO> events = sqlSession.selectList("com.smhrd.db.Mapper.GetAllEvents");
		
		sqlSession.close();
		
		return events;
	}
	
	
	

}
