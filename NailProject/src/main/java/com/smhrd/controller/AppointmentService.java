package com.smhrd.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.AppointmentDAO;
import com.smhrd.model.AppointmentVO;
import com.smhrd.model.ServiceDAO;
import com.smhrd.model.ServiceVO;

public class AppointmentService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// shop.jsp에서 고객이 예약버튼을 클릭했을 때 실행되는 이벤트
		// staff_seq : 어떤 스태프에게 예약을 했는지
		// nailart_seq : 어떤 네일아트를 골랐는지
		// selectedNailImg : 네일아트 사진 (구글드라이브의 file_id)
		// date : 예약 날짜
		// time : 예약 시간
		// mem_id : 예약자
		
        Double staff_seq = Double.parseDouble(request.getParameter("staff_seq"));
        Double nailart_seq = Double.parseDouble(request.getParameter("selectedNailSeq"));
        String selectedNailImg = request.getParameter("selectedNailImg");
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String mem_id = request.getParameter("mem_id");

        // data
        ServiceVO servo = new ServiceVO();
        servo.setStaffSeq(staff_seq);
        servo.setNailartSeq(nailart_seq);
        ServiceDAO serDao = new ServiceDAO();

        Double SVC_seq = serDao.getSVC_seq(servo);
        
        AppointmentVO aptvo = new AppointmentVO();
        aptvo.setMemId(mem_id);
        aptvo.setServiceSeq(SVC_seq);

        String combinedDateString = date + " " + time + ":00"; // 초까지 표시하는 형식
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Timestamp appointedAt = null;

        // 날짜 변환
        try {
            appointedAt = Timestamp.valueOf(combinedDateString);
        } catch (IllegalArgumentException e) {
        	// 예외 처리: 날짜 변환에 실패한 경우
            e.printStackTrace();
        }
        
        aptvo.setAppointedAt(appointedAt);

        aptvo.setApproved('L');
        
        // DB에 저장
        AppointmentDAO aptDao = new AppointmentDAO();
        int row = aptDao.insertAppointment(aptvo);
        
        // DB 저장 성공
        if (row > 0) {
            // 예약 성공 메시지를 JSON 형식으로 클라이언트에게 전송
            String successResponse = "{\"status\": \"success\", \"message\": \"예약 신청에 성공했습니다.\"}";
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(successResponse);
        } else {
            // 예약 실패 메시지를 JSON 형식으로 클라이언트에게 전송
            String failureResponse = "{\"status\": \"failure\", \"message\": \"예약 신청에 실패했습니다.\"}";
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(failureResponse);
        }     

        // ajax
        return null;
	}
}
