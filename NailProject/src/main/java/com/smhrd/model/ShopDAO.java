package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class ShopDAO {

	private SqlSessionFactory factory = SqlSessionManager.getFactory();

	public ShopVO getShopInfo(ShopVO vo) {
		// mem_id와 일치하는 shop 데이터 반환
		
		SqlSession sqlSession = factory.openSession(true);
		ShopVO shopInfo = null;

		try {
			shopInfo = sqlSession.selectOne("shop_select", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		if (shopInfo == null) {
			// System.out.println("가게 정보가 null입니다.");
		}

		return shopInfo;
	}

	public int updateShopImg(ShopVO vo) {
		// mem_id와 일치하는 shop을 찾아서 ShopImg에 저장된 file_id를 변경
		
		SqlSession sqlSession = factory.openSession(true);
		List<ShopVO> shopInfo = null;
		int row = 0;
		try {
			row = sqlSession.update("updateShopImg", vo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		return row;
	}

	public List<ShopVO> getShopInfoAll() {
		// 모든 shop 데이터 반환
		
		SqlSession sqlSession = factory.openSession(true);
		List<ShopVO> shopInfo = null;
		try {
			shopInfo = sqlSession.selectList("getShopInfoAll");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}

		if (shopInfo == null) {
			// System.out.println("가게 정보가 null입니다.");
		}

		return shopInfo;
	}

	public List<ShopVO> shopSelectAll() {
		SqlSession sqlSession = factory.openSession(true);

		List<ShopVO> shopList = sqlSession.selectList("shopSelectAll"); // method name과 동일한 태그 사용(권장)

		sqlSession.close();

		return shopList;
	}

	public int shopReg(ShopVO vo) {
		SqlSession sqlSession = factory.openSession(true); // true을 넣으면 자동으로 commit

		int row = sqlSession.insert("shop_reg", vo);

		sqlSession.close();

		return row;
	}

	// 가게정보 평점 내림차순
	public List<ShopVO> shopSelectSort() {
		SqlSession sqlSession = factory.openSession(true);

		List<ShopVO> shopSortList = sqlSession.selectList("shopSelectSort"); // method name과 동일한 태그 사용(권장)

		sqlSession.close();

		return shopSortList;
	}


}
