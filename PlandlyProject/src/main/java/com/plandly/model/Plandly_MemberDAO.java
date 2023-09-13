package com.plandly.model;

import java.util.List;
import java.util.Map;

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
	
	public int login(Plandly_MemberVO vo) { // 로그인
		SqlSession sqlSession = Factory.openSession(true);
		int cnt = sqlSession.selectOne("com.plandly.db.PlandlyMemberMapper.login",vo);
		sqlSession.close();
		return cnt;
	}
	
	public List<Plandly_MemberVO> memberSession(Plandly_MemberVO vo){ // 세션
	    SqlSession sqlSession = Factory.openSession(true);
	    List<Plandly_MemberVO> result = sqlSession.selectList("com.plandly.db.PlandlyMemberMapper.memberSession", vo);
	    sqlSession.close();
	    
	    return result;
	}
	
	
	public List<OpenTodoVO> openTodoTask() { // 중복제거 전
		SqlSession sqlSession = Factory.openSession(true);
	    List<OpenTodoVO> result = sqlSession.selectList("com.plandly.db.PlandlyMemberMapper.openTodoTask");
	    sqlSession.close();
	    
	    return result;
	}
	
	public List<OpenTodoVO> openTodo() { // 중복제거 후
		SqlSession sqlSession = Factory.openSession(true);
		List<OpenTodoVO> result = sqlSession.selectList("com.plandly.db.PlandlyMemberMapper.openTodo");
		sqlSession.close();
		
		return result;
	}
	
	public int updateCheckbox(Map<String, Object> params) {
	    SqlSession sqlSession = Factory.openSession(true);
	    int cnt = sqlSession.update("com.plandly.db.PlandlyMemberMapper.updateCheckbox", params);
	    sqlSession.close();
	    return cnt;
	}
	
}
