package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemberVO;
import com.smhrd.model.ShopDAO;
import com.smhrd.model.ShopVO;

public class ShopManagementService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 세션에서 로그인한 사용자의 ID를 가져옴
        HttpSession session = request.getSession();
        String mem_id = ((MemberVO) session.getAttribute("result")).getMemId();
        
        System.out.println("로그인 세션 확인: " + mem_id);
        
        
        

        // ShopDAO를 통해 가게 정보를 가져옴
        ShopVO vo = new ShopVO();
        vo.setMemId(mem_id);
        ShopDAO shopDAO = new ShopDAO();
        ShopVO shopInfo = shopDAO.getShopInfo(vo);

        if (shopInfo != null) {
        	session.setAttribute("shopInfo", shopInfo);
			System.out.println("가게 정보 가져오기 성공");
			System.out.println(shopInfo.getShopName());
		} else {
			System.out.println("가게 정보 가져오기 실패");

		}

        // shopmanagement.jsp로 포워드
        return "redirect:/GoshopManagement.do";
	}

}