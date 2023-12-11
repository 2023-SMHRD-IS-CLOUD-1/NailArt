package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.StaffDAO;
import com.smhrd.model.StaffVO;

public class DeleteDesignerService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 가게 주인이 shopManagement.jps에서 디자이너 삭제 버튼을 클릭했을 때 발생하는 이벤트
		// staff_seq : 삭제할 스태프를 판별하는 시퀀스
		
		Double staff_seq = Double.parseDouble(request.getParameter("staff_seq"));

		// data
		StaffVO vo = new StaffVO();
		vo.setStaffSeq(staff_seq);
		
		// DB 연결
		StaffDAO stdao = new StaffDAO();
		int row = stdao.deleteStaff(vo);
		
		// DB 성공여부
//		if(row>0) {
//			System.out.println("디자이너 삭제 성공");
//		}else {
//			System.out.println("디자이너 삭제 실패");
//		}
		
		// ajax
		return null;
	}

}
