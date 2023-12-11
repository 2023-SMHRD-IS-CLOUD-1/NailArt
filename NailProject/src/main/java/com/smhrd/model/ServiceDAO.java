package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class ServiceDAO {

	private SqlSessionFactory factory = SqlSessionManager.getFactory();

	public Double getSVC_seq(ServiceVO servo) {
		// 서비스 시퀀스를 반환
		
		SqlSession sqlSession = factory.openSession(true);
		
		Double SVC_seq = sqlSession.selectOne("select_serviceSeq", servo);
		
		return SVC_seq;
	}

	public List<Double> getSVC_seq2(ServiceVO servo) {
		
		SqlSession sqlSession = factory.openSession(true);

		List<Double> SVC_seqList = sqlSession.selectList("select_serviceSeqList", servo);
		
		return SVC_seqList;
	}




























}
	
	