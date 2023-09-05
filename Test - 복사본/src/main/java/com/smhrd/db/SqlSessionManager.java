package com.smhrd.db;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlSessionManager {
	
	// mybatis 에서 제공하는 기능. pom.xml파일에 라이브러리 추가해야 함.
	private static SqlSessionFactory sqlSessionFactory;
		
	// DAO에서 호출
	public static SqlSessionFactory getSqlSession() {
		return sqlSessionFactory;
	}
	
	static {

		try {
			String resource = "com/smhrd/db/mybatis-config.xml";
			InputStream inputStream;
			inputStream = Resources.getResourceAsStream(resource);
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
