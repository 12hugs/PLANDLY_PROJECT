package com.plandly.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.plandly.db.SqlsessionManager;

public class CalendarDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlsessionManager.getSqlSession();

	public int calUpload(CalendarDTO dto) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int cnt = sqlSession.insert("com.plandly.db.CalMapper.UploadCal", dto);
		
		sqlSession.close();
		
		return cnt;
	}

	public List<CalendarDTO> getEvents() {

		SqlSession sqlSession = sqlSessionFactory.openSession();
		
		List<CalendarDTO> events = sqlSession.selectList("com.plandly.db.CalMapper.GetAllEvents");
		
		sqlSession.close();
		
		return events;
	}

	public int calDelete(CalendarDTO dto) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int cnt = sqlSession.delete("com.plandly.db.CalMapper.DeleteCal", dto);
		
		sqlSession.close();
		
		return cnt;
	}

	public int calUpdate(CalendarDTO dto) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int cnt = sqlSession.delete("com.plandly.db.CalMapper.UpdateCal", dto);
		
		sqlSession.close();
		
		return cnt;
	}
	
	
	

}
