package com.smhrd.model;

import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.db.SqlsessionManager;

public class BookDAO {
	
	SqlSessionFactory sqlSessionFactory = SqlsessionManager.getSqlSession();

}
