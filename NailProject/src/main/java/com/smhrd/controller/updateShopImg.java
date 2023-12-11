package com.smhrd.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemberVO;
import com.smhrd.model.ShopDAO;
import com.smhrd.model.ShopVO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.lang.reflect.Field;


public class updateShopImg implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// shopManagement.jsp에서 shopImg를 수정했을 때 발생하는 이벤트
		// CORS
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String mem_id = request.getParameter("mem_id");
		mem_id = mem_id.replaceAll(" ", "");
		
		String file_id = request.getParameter("data");
		
		ShopVO vo = new ShopVO();
		vo.setMemId(mem_id);
		vo.setShop_img(file_id);
		
        ShopDAO shopDAO = new ShopDAO();
        int res = shopDAO.updateShopImg(vo);
        
        if (res > 0) {
        	// System.out.println("이미지 저장 성공");
        	out.print("success");
		} else {
			// System.out.println("이미지 저장 실패");
		}
        
        // ajax
		return null;
	}
}
