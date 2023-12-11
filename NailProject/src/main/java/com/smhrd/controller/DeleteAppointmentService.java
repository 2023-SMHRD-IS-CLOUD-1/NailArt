package com.smhrd.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.AppointmentDAO;
import com.smhrd.model.AppointmentVO;

public class DeleteAppointmentService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 가게 주인이 shopManagement.jsp에서 예약취소 버튼을 클릭했을 때 발생하는 이벤트
		// mem_id : 예약자
		// appointed_at : 예약시간
		String mem_id = request.getParameter("mem_id");
		String appointed_at = request.getParameter("appointed_at");
		appointed_at = appointed_at.substring(0, appointed_at.length() - 1);

		// 날짜 변환
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS");
			Date parsedDate = dateFormat.parse(appointed_at);
			Timestamp timestamp = new java.sql.Timestamp(parsedDate.getTime());

			AppointmentVO aptvo = new AppointmentVO();
			aptvo.setMemId(mem_id);
			aptvo.setAppointedAt(timestamp);
			
			// DB 연동
			AppointmentDAO aptdao = new AppointmentDAO();
			int row = aptdao.deleteAppointment(aptvo);
			
			// DB 연동 성공 여부
//			if(row>0) {
//				System.out.println("예약 삭제 성공");
//			}else {
//				System.out.println("예약 삭제 실패");
//			}
		} catch (ParseException e) {
			// 날짜 변환 실패시
			e.printStackTrace();
		}
		return null;
	}

}
