package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class ShopDAO {

    private SqlSessionFactory factory = SqlSessionManager.getFactory();

    public ShopVO getShopInfo(ShopVO vo) {
        SqlSession sqlSession = factory.openSession(true);
        ShopVO shopInfo = null;

        try {
            shopInfo = sqlSession.selectOne("shop_select", vo);
            System.out.println("ShopInfo: " + shopInfo); // 로그 추가
            System.out.println("Executed SQL Query: " + sqlSession.getConfiguration().getMappedStatement("shop_select").getBoundSql(vo).getSql());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            sqlSession.close();
        }
        
        if (shopInfo == null) {
            System.out.println("가게 정보가 null입니다.");
        }

        return shopInfo;
    }
    
    public List<ShopVO> getShopInfoAll() {
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
            System.out.println("가게 정보가 null입니다.");
        }

        return shopInfo;
    }
}
