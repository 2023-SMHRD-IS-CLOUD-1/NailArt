package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class ReviewDAO {

	private SqlSessionFactory factory = SqlSessionManager.getFactory();

	public int addReview(ReviewVO revVo) {
		// 리뷰 추가 insert
		
		SqlSession sqlSession = factory.openSession(true);
		
		int row = sqlSession.insert("addReview", revVo);
		
		return row;
	}

	public List<ReviewVO> selectAllReview(ReviewVO revVo) {
		// 모든 리뷰틑 select
		
		SqlSession sqlSession = factory.openSession(true);
		
		List<ReviewVO> reviewList = sqlSession.selectList("selectAllReview", revVo);
		
		return reviewList;
	}

}
	
	