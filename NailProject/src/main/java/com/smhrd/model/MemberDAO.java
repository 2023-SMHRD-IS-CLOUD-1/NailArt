package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class MemberDAO {

	// 1) SqlSession을 가져올 수 있는 SqlSessionFactory 생성
	private SqlSessionFactory factory = SqlSessionManager.getFactory();

	public int join(MemberVO vo) {
		// 회원가입. 멤버 정보를 테이블에 insert

		SqlSession sqlSession = factory.openSession(true); // true을 넣으면 자동으로 commit

		int row = sqlSession.insert("member_join", vo);

		sqlSession.close();

		return row;
	}

	public MemberVO getMemberInfo(MemberVO vo) {
		// 회원 정보를 가져온다.

		SqlSession sqlSession = factory.openSession(true); // true을 넣으면 자동으로 commit

		MemberVO mvo = sqlSession.selectOne("getMemberInfo", vo);

		sqlSession.close();

		return mvo;
	}

	public MemberVO selectId(MemberVO vo) {
		// id를 사용하여 회원정보 가져오기

		SqlSession sqlSession = factory.openSession(true); // true을 넣으면 자동으로 commit

		System.out.println(vo.getMemId());
		MemberVO mvo = sqlSession.selectOne("selectId", vo);
		sqlSession.close();

		return mvo;
	}

	public MemberVO login(MemberVO vo) {
		// 로그인. id, pw가 일치하는 것이 있으면 회원정보 가져오기
		
		SqlSession sqlSession = factory.openSession(true); // true을 넣으면 자동으로 commit

		MemberVO mvo = sqlSession.selectOne("member_login", vo);

		sqlSession.close();

		return mvo;
	}

	public List<Object> selectAll() {
		// 모든 회원 정보 가져오기

		SqlSession sqlSession = factory.openSession(true);

		List<Object> list = sqlSession.selectList("selectAll");

		sqlSession.close();

		return list;
	}

	public int member_update(MemberVO vo) {
		// 회원정보 수정. update

		SqlSession sqlSession = factory.openSession(true);

		int row = sqlSession.update("member_update", vo);

		sqlSession.close();

		return row;
	}

	public MemberVO emailCheck(MemberVO vo) {
		// 일치하는 email이 있을 경우 id, pw 반환
		
		SqlSession sqlSession = factory.openSession(true);

		MemberVO mvo = sqlSession.selectOne("emailCheck", vo);

		sqlSession.close();

		return mvo;
	}

	public int update_state(String mem_id) {
		// 가게 등록을 하면 member type을 update

		SqlSession sqlSession = factory.openSession(true);

		int row = sqlSession.update("update_state", mem_id);

		sqlSession.close();

		return row;
	}
}
