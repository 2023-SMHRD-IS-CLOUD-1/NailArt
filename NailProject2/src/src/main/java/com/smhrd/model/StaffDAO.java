package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class StaffDAO {

	// 1) SqlSession을 가져올 수 있는 SqlSessionFactory 생성
	private SqlSessionFactory factory = SqlSessionManager.getFactory();


    public List<StaffVO> getStaffInfoAll(ShopVO vo) {
        SqlSession sqlSession = factory.openSession(true);
        List<StaffVO> staffInfo = null;
        
        System.out.println("StaffDAO.getStaffInfoAll 실행");
        System.out.println(vo.getShopSeq());
        try {
        	staffInfo = sqlSession.selectList("getStaffInfoAll", vo);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
        
        if (staffInfo == null) {
            System.out.println("직원 정보가 null입니다.");
        }

        return staffInfo;
    }

























}
	
	