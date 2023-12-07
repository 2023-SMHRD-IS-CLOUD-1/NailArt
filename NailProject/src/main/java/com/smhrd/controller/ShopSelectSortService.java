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
		System.out.println("ShopSelectSortService 진입완료!!!!");
		ShopDAO dao = new ShopDAO();
		List<ShopVO> shopList =  dao.shopSelectSort();
		
		System.out.println("33333333" + shopList);
		System.out.println("44444444");
		
		for (ShopVO shop : shopList) {
		    if (shop != null && shop.getShopName() != null) {
		        System.out.println(shop.getShopName() + " " + shop.getReview_rating());
		    } else {
		        System.out.println("ShopVO or shopName is null.");
		    }
		}
		response.setContentType("text/html;charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		out.print(new Gson().toJson(shopList));

		return null;
	}

}
