package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.ShopDAO;
import com.smhrd.model.ShopVO;
import com.smhrd.model.StaffVO;

public class ShopSelectAllService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// shop.jsp를 실행했을 때 발생하는 이벤트
		// 모든 Shop 데이터를 가져올 때 사용
		
		ShopDAO dao = new ShopDAO();
		List<ShopVO> shopList = dao.shopSelectAll();
		
		HttpSession session = request.getSession();
		session.setAttribute("shopList", shopList);

		return "redirect:/Goshop.do";
	}

}
