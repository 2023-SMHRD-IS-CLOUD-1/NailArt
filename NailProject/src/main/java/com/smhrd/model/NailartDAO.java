package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class NailartDAO {

	private SqlSessionFactory factory = SqlSessionManager.getFactory();

    public List<NailartVO> getNailInfoAll(StaffVO vo) {
        SqlSession sqlSession = factory.openSession(true);
        List<NailartVO> NailInfo = null;
        
        try {
        	// staff_seq와 일치하는 네일아트 정보를 모두 select
        	NailInfo = sqlSession.selectList("getNailInfoAll", vo);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
        
        if (NailInfo == null) {
            // System.out.println("네일아트 정보가 null입니다.");
        }

        return NailInfo;
    }


























}
	
	