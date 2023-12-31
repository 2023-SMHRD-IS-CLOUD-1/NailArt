package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.ReviewDAO;
import com.smhrd.model.ReviewVO;
import com.smhrd.model.ShopDAO;
import com.smhrd.model.ShopVO;
import com.smhrd.model.StaffDAO;
import com.smhrd.model.StaffVO;

public class ShopPageService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// shop.jsp에 들어가기 전에 발생하는 이벤트
		HttpSession session = request.getSession();
		String mem_id = request.getParameter("mem_id");
		
        ShopVO vo = new ShopVO();
        vo.setMemId(mem_id);
        ShopDAO shopDAO = new ShopDAO();
        ShopVO shopInfo = shopDAO.getShopInfo(vo);

        if (shopInfo != null) {
        	session.setAttribute("shopInfo", shopInfo);
			// System.out.println("가게 정보 가져오기 성공");
		} else {
			// System.out.println("가게 정보 가져오기 실패");
		}
        
        // StaffDAO를 통해 스태프 정보를 가져옴
        Double shopSeq =  shopInfo.getShopSeq();
        StaffVO stfvo = new StaffVO();
        stfvo.setShopSeq(shopSeq);
        StaffDAO staffDAO = new StaffDAO();
        List<StaffVO> staffList = staffDAO.getStaffList(stfvo);
        session.setAttribute("staffList", staffList);
        
        // 리뷰 리스트 가져오기
        ReviewVO revVo = new ReviewVO();
        Double shop_seq1 = shopInfo.getShopSeq();
        revVo.setShopSeq(shop_seq1);
        
        ReviewDAO revDao = new ReviewDAO();
        List<ReviewVO> reviewList = revDao.selectAllReview(revVo);
        if (reviewList != null) {
        	session.setAttribute("reviewList", reviewList);
        }else {
        }
        
        // shopmanagement.jsp로 포워드
        return "redirect:/GoshopPage.do";
	}

}
