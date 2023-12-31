package com.smhrd.controller;

import java.io.IOException;


import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberVO;

public class UpdateService implements Command{
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// myPage.jsp에서 회원정보수정 버튼을 클릭했을 때 발생하는 이벤트
		
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("result");
		
		String mem_id = mvo.getMemId();
		String mem_email = request.getParameter("email");
		String mem_name = request.getParameter("name");
		String mem_pw = request.getParameter("password");
		String mem_tel = request.getParameter("phone");
		String mem_address1 = request.getParameter("address1");
		String mem_address2 = request.getParameter("address2");

		MemberVO vo = new MemberVO();
		vo.setMemEmail(mem_email);
		vo.setMemPw(mem_pw);
		vo.setMemPhone(mem_tel);
		vo.setMemAddr1(mem_address1);
		vo.setMemAddr2(mem_address2);
		vo.setMemName(mem_name);
		vo.setMemId(mem_id);
		vo.setMemType(mvo.getMemType());
		
		// 수정된 회원정보를 DB에 저장
		MemberDAO dao = new MemberDAO();
		int row = dao.member_update(vo);
		
		// 수정된 회원정보를 세션에 저장
		if(row > 0) {
			session.setAttribute("result", vo);
		}
		return "redirect:/Gomypage.do";
	}
}
