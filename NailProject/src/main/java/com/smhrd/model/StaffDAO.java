package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class StaffDAO {

	private SqlSessionFactory factory = SqlSessionManager.getFactory();

	public List<StaffVO> getStaffList(StaffVO stfvo) {
		
		SqlSession sqlSession = factory.openSession(true);
		
		List<StaffVO> staffList = sqlSession.selectList("getStaffList", stfvo); // method name과 동일한 태그 사용(권장)
		
		sqlSession.close();
		
		return staffList;
		
	}
	public List<StaffVO> getStaffList_shopPage(StaffVO stfvo) {
		SqlSession sqlSession = factory.openSession(true);
		List<StaffVO> staffList = sqlSession.selectList("getStaffList_shoPage", stfvo); // method name과 동일한 태그 사용(권장)
		sqlSession.close();
		return staffList;
	}

	public int addStaff(StaffVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		
		int row = sqlSession.insert("add_staff", vo);

		sqlSession.close();

		return row;
		
	}

	public int deleteStaff(StaffVO vo) {
		SqlSession sqlSession = factory.openSession(true);
		int row = sqlSession.delete("del_staff", vo);
		
		sqlSession.close();
		
		return row;
	}

    public List<StaffVO> getStaffInfoAll(ShopVO vo) {
        SqlSession sqlSession = factory.openSession(true);
        List<StaffVO> staffInfo = null;
        
        try {
        	staffInfo = sqlSession.selectList("getStaffInfoAll", vo);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
        
        if (staffInfo == null) {
            // System.out.println("직원 정보가 null입니다.");
        }

        return staffInfo;
    }

}
	
	