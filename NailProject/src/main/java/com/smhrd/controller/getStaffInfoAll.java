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
import com.smhrd.model.StaffDAO;
import com.smhrd.model.StaffVO;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.lang.reflect.Field;


public class getStaffInfoAll implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// design.jsp에서 shop을 선택했을 때 발생하는 이벤트
		
		// CORS
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		// shop_select + shop_seq을 입력받음
		// data에서 shop_seq을 추출
		String data = request.getParameter("data");
		double shop_seq = Integer.parseInt(data.substring(11));

		// value object
		ShopVO vo = new ShopVO();
		vo.setShopSeq(shop_seq);
		
		// DB 연동
		// shop_seq를 포함하는 모든 staff의 정보를 가져와 List에 저장 
		StaffDAO staffDAO = new StaffDAO();
		List<StaffVO> staffInfo = staffDAO.getStaffInfoAll(vo);
  
		// 데이터를 Json으로 변환
        JSONArray req_array = new JSONArray();
        for(int i = 0; i < staffInfo.size(); i++) {
            Object fieldObj = staffInfo.get(i);
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
            req_array.add(obj);
        }

        if (staffInfo.size() != 0) {
//        	System.out.println("직원 정보 가져오기 성공");
//        	System.out.println(req_array);
        	
		} else {
//			System.out.println("직원 정보 가져오기 실패");
		}
        
        // ajax
		return null;
	}
}
