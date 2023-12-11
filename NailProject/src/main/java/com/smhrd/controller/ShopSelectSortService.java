package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.smhrd.model.ShopDAO;
import com.smhrd.model.ShopVO;
import com.smhrd.model.StaffVO;

public class ShopSelectSortService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// shop.jsp에서 정렬을 선택했을 때 발생하는 이벤트 
		
		ShopDAO dao = new ShopDAO();
		List<ShopVO> shopList =  dao.shopSelectSort();
		
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.print(new Gson().toJson(shopList));

		return null;
	}

}
