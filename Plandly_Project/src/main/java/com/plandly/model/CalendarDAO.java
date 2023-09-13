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

	public int calDelete(int calNum) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int cnt = sqlSession.delete("com.plandly.db.CalMapper.DeleteCal", calNum);

		sqlSession.close();

		return cnt;
	}

	public int calUpdate(CalendarDTO dto) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int cnt = sqlSession.delete("com.plandly.db.CalMapper.UpdateCal", dto);

		sqlSession.close();

		return cnt;
	}

	public CalendarDTO calNumToGet(int calendarNum) {

		SqlSession sqlSession = sqlSessionFactory.openSession();

		CalendarDTO events = sqlSession.selectOne("com.plandly.db.CalMapper.calNumToGet", calendarNum);

		sqlSession.close();

		return events;

	}

	public int UpCategoriCal(CalendarDTO dto) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int cnt = sqlSession.insert("com.plandly.db.CalMapper.UpCategoriCal", dto);

		sqlSession.close();

		return cnt;
	}

	public CalendarDTO getCategori(int calendar_Num) {
		SqlSession sqlSession = sqlSessionFactory.openSession();

		CalendarDTO cate = sqlSession.selectOne("com.plandly.db.CalMapper.getCategori", calendar_Num);

		sqlSession.close();

		return cate;
	}

}
