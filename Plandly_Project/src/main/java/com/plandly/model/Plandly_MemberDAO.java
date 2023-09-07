package com.plandly.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.plandly.db.SqlsessionManager;

public class Plandly_MemberDAO {
	
	SqlSessionFactory Factory = SqlsessionManager.getSqlSession();
	
	public int join(Plandly_MemberVO vo) { // 회원가입
		SqlSession sqlSession = Factory.openSession(true);
		int cnt = sqlSession.insert("com.plandly.db.PlandlyMemberMapper.join",vo);
		sqlSession.close();
		return cnt;
	}
}
