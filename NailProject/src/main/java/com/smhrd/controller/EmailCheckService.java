package com.smhrd.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberVO;


public class EmailCheckService implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// sign.jsp에서 이메일 전송 버튼을 클릭했을 때 발생하는 이벤트
		// 동일 출처 정책 CORS로 인하여 모든 포트의 데이터 요청 허용하는 구문
		response.addHeader("Access-Control-Allow-Origin", "*");

		// email : 이메일주소
		// html에서 입력한 이메일주소에서 첫 칸에 빈칸이 존재하여 빈칸을 삭제
		String email = request.getParameter("data");
		email = email.replace(" ", "");

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		// data
		MemberVO vo = new MemberVO();
		vo.setMemEmail(email);
	
		// DB 연동
		// input data (email)이 member_info table에 있는지 확인
		MemberDAO dao = new MemberDAO();
		MemberVO res = dao.emailCheck(vo);
		
		if (res != null) {
			// email이 member_info table에 있으면 id와 pw를 전송
		 	out.print("{\"mem_id\":\""+ res.getMemId()+ "\", \"mem_pw\":\""+res.getMemPw() +"\"}");
		}else {
			// email이 member_info table에 없으면 false를 전송
		 	out.print("{\"emailCheck\":\"false\"}");
		}
		
		// ajax
		return null;
	}
}
