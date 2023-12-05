package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class AppointmentDAO {

	// 1) SqlSession을 가져올 수 있는 SqlSessionFactory 생성
	private SqlSessionFactory factory = SqlSessionManager.getFactory();

	public int insertAppointment(AppointmentVO aptvo) {
		
		SqlSession sqlSession = factory.openSession(true);
		
		int row = sqlSession.insert("insert_appointment", aptvo);
		
		return row;
	}




























}
	
	