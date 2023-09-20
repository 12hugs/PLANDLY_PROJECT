package com.plandly.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.plandly.db.SqlsessionManager;

public class TaskDAO {

	SqlSessionFactory sqlSessionFactory = SqlsessionManager.getSqlSession();

	public int UploadTask(TaskDTO dto) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int cnt = sqlSession.insert("com.plandly.db.TodoMapper.UploadTask", dto);

		sqlSession.close();

		return cnt;
	}

	public List<TaskDTO> LoadTask(int calendar_Num) {

		SqlSession sqlSession = sqlSessionFactory.openSession();

		List<TaskDTO> tasks = sqlSession.selectList("com.plandly.db.TodoMapper.GetAllTasks", calendar_Num);

		sqlSession.close();

		return tasks;
	}

	public int UpdateTaskIsDone(TaskDTO dto) {

		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int cnt = sqlSession.update("com.plandly.db.TodoMapper.UpdateTaskIsDone", dto);

		sqlSession.close();

		return cnt;

	}

	public int DeleteTask(int todo_num) {
		SqlSession sqlSession = sqlSessionFactory.openSession(true);

		int cnt = sqlSession.delete("com.plandly.db.TodoMapper.DeleteTask", todo_num);

		sqlSession.close();

		return cnt;
	}

}
