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
	
	public boolean idCheck(String email) {
		SqlSession sqlsession = Factory.openSession(true);
		Plandly_MemberVO vo = sqlsession.selectOne("com.plandly.db.PlandlyMemberMapper.idCheck",email);
		sqlsession.close();
		
		if(vo != null) {// 중복임
			return false;
		}else { // 중복이 아님
			return true;
		}
	}
	
	public Plandly_MemberVO getMemberByEmail(String email) {
		
		SqlSession sqlSession = Factory.openSession(true);
		Plandly_MemberVO memInfo = sqlSession.selectOne("com.plandly.db.PlandlyMemberMapper.getMemberByEmail", email);
		sqlSession.close();
		return memInfo;
		
	}
	
	public int memberChange(Plandly_MemberVO vo) { // 회원정보변경
	    SqlSession sqlSession = Factory.openSession(true);
	    int cnt = sqlSession.update("com.plandly.db.PlandlyMemberMapper.memberChange", vo); // update로 변경
	    sqlSession.close();
	    return cnt;
	}
	
	public FamousVO famous(int ranInt) { // 명언
		SqlSession sqlSession = Factory.openSession(true);
		FamousVO vo = sqlSession.selectOne("com.plandly.db.PlandlyMemberMapper.famous",ranInt);
		sqlSession.close();
		return vo;
	}
	
	
	
	
	
	
}
