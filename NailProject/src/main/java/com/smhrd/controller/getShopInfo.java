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


public class getShopInfo implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// shopManagement.jsp를 실행하면 발생하는 이벤트

		// CORS정책
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		// 가게 주인의 mem_id를 받아옴
		// 첫 칸에 빈칸이 발생하여 빈칸을 제거하는 코드 추가
		String mem_id = request.getParameter("mem_id");
		mem_id = mem_id.replace(" ", "");
		ShopVO vo = new ShopVO();
		vo.setMemId(mem_id);
		
		// DB 연동
		// 가게 주인의 mem_id를 포함하는 shopVO 데이터를 모두 가져온다.
        ShopDAO shopDAO = new ShopDAO();
        ShopVO svo = shopDAO.getShopInfo(vo);
        
        // 결과를 Json으로 반환
        Object fieldObj = svo;
        JSONObject obj = new JSONObject();
        for (Field field : fieldObj.getClass().getDeclaredFields()) {
			field.setAccessible(true);
			Object value = null;
			try {
				value = field.get(fieldObj);
			} catch (IllegalArgumentException | IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			// System.out.println("field : " + field.getName() + " | value : " + value);
            obj.put(field.getName(), value);
        }

        if (svo != null) {
        	// System.out.println("가게 정보 가져오기 성공");
        	out.print(obj);
		} else {
			// System.out.println("가게 정보 가져오기 실패");
		}
        
        // ajax
		return null;
	}
}
