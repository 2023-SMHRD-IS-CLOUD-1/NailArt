package com.smhrd.controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberVO;

public class JoinService implements Command{
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// sign.jsp에서 회원가입 버튼을 클릭했을 때 발생하는 이벤트
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		String mem_name = request.getParameter("mem_name");
		String mem_phone = request.getParameter("mem_phone");
		String mem_email = request.getParameter("mem_email");
		String mem_addr1 = request.getParameter("mem_addr1");
		String mem_addr2 = request.getParameter("mem_addr2");
		
		// data
		MemberVO vo = new MemberVO();
		vo.setMemId(mem_id);
		vo.setMemPw(mem_pw);
		vo.setMemName(mem_name);
		vo.setMemPhone(mem_phone);
		vo.setMemEmail(mem_email);
		vo.setMemAddr1(mem_addr1);
		vo.setMemAddr2(mem_addr2);
		vo.setMemType("c");
		
		// DB 연결
		MemberDAO dao = new MemberDAO();
		
		// insert 성공
		int row = dao.join(vo);

		if(row > 0) {
			request.setAttribute("member", vo);
			// System.out.println("회원가입 성공");
		}else {
			// System.out.println("회원가입 실패");
		}
		
		// redirect 방식으로 Gomain으로 이동
		// url을 sign에서 main으로 변경하기 위해 redirect로 이동
		return "redirect:/Gomain.do";
	}
}
