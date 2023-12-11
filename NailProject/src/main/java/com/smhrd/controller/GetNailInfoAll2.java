package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.smhrd.model.NailartDAO;
import com.smhrd.model.NailartVO;
import com.smhrd.model.ShopVO;
import com.smhrd.model.StaffVO;

public class GetNailInfoAll2 implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// shopManagement.jsp를 실행하면 발생하는 이벤트
		// data : 스태프를 구분하는 staff_seq
		// getNailInfoAll 클래스와 다르게 staff_seq를 바로 입력으로 받는다.
		String data = request.getParameter("data");

		double staff_seq = Double.parseDouble(data);
		System.out.println(staff_seq);
		StaffVO vo = new StaffVO();
		vo.setStaffSeq(staff_seq);

		// DB 연동
		NailartDAO nailartDAO = new NailartDAO();
		List<NailartVO> NailInfo = nailartDAO.getNailInfoAll(vo);

		// 반환할 데이터를 Json으로 변환
		JSONArray jsonArray = new JSONArray();
		for (NailartVO nail : NailInfo) {
			JSONObject jsonNail = new JSONObject();
			jsonNail.put("nailart_img", nail.getNailartImg());
			jsonNail.put("nailart_seq", nail.getNailartSeq());
			// 필요한 다른 속성들도 추가 가능

			jsonArray.add(jsonNail);
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(jsonArray.toJSONString());
		
		// ajax
		return null;
	}

}
