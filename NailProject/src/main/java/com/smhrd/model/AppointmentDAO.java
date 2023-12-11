package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class AppointmentDAO {

	private SqlSessionFactory factory = SqlSessionManager.getFactory();

	public int insertAppointment(AppointmentVO aptvo) {
		// 예약 데이터를 테이블에 insert
		
		SqlSession sqlSession = factory.openSession(true);
		
		int row = sqlSession.insert("insert_appointment", aptvo);
		
		return row;
	}

	public List<AppointmentVO> getAppointmentBySVC_seqList(List<Double> SVC_seqList) {
		// 서비스 리스트를 select
		
		SqlSession sqlSession = factory.openSession(true);
		
		List<AppointmentVO> AppointmentList = sqlSession.selectList("getAppointmentBySVC_seqList", SVC_seqList);
		
		return AppointmentList;
	}

	public int deleteAppointment(AppointmentVO aptvo) {
		// 에약 정보를 delect
		SqlSession sqlSession = factory.openSession(true);
		
		int row = sqlSession.delete("deleteAppointment", aptvo);
		return row;
	}




























}
	
	