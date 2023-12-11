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
import com.smhrd.model.NailartDAO;
import com.smhrd.model.NailartVO;
import com.smhrd.model.ShopDAO;
import com.smhrd.model.ShopVO;
import com.smhrd.model.StaffDAO;
import com.smhrd.model.StaffVO;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.lang.reflect.Field;


public class getNailInfoAll implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// design.jsp에서 shop과 staff를 선택했을 때 실행하는 이벤트
		
		// CORS 정책
		// 인코딩
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// data : staff_select + staff_seq
		// data에서 staff_seq만 추출
		String data = request.getParameter("data");
		double staff_seq = Integer.parseInt(data.substring(12));

		// value object
		StaffVO vo = new StaffVO();
		vo.setStaffSeq(staff_seq);
		
		// DB
		// 모든 네일아트 정보를 List로 반환
		NailartDAO nailartDAO = new NailartDAO();
		List<NailartVO> NailInfo = nailartDAO.getNailInfoAll(vo);

		// Json Object 생성
		// array로 반환
        JSONArray req_array = new JSONArray();
        for(int i = 0; i < NailInfo.size(); i++) {
            Object fieldObj = NailInfo.get(i);
            JSONObject obj = new JSONObject();
            for (Field field : fieldObj.getClass().getDeclaredFields()) {
    			field.setAccessible(true);
    			Object value = null;
    			try {
    				value = field.get(fieldObj);
    			} catch (IllegalArgumentException | IllegalAccessException e) {
     				e.printStackTrace();
    			}
    			// System.out.println("field : " + field.getName() + " | value : " + value);
                obj.put(field.getName(), value);
            }
            req_array.add(obj);
        }

        if (NailInfo.size() != 0) {
        	// System.out.println("네일 정보 가져오기 성공");
        	out.print(req_array);
		} else {
			// System.out.println("네일 정보 가져오기 실패");
		}
        
        // ajax
		return null;
	}
}
