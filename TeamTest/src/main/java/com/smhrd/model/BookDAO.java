package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlsessionManager;

public class BookDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlsessionManager.getSqlSession();

	public int insert_member(BookDTO dto) {
	
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		int cnt = sqlSession.insert("com.smhrd.db.Mapper.join", dto);
		
		sqlSession.close();
		
		return cnt;
	}

	public BookDTO login_member(BookDTO dto) {
		
		SqlSession sqlSession = sqlSessionFactory.openSession(true);
		
		BookDTO member_info = sqlSession.selectOne("com.smhrd.db.Mapper.login", dto);
		
		sqlSession.close();
		
		return member_info;
	}

}
