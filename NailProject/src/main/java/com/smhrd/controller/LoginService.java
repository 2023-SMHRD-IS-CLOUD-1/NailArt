package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberVO;

public class LoginService implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// sign.jsp에서 로그인 버튼을 클릭했을 때 발생하는 이벤트
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");

		MemberVO vo = new MemberVO();
		vo.setMemId(mem_id);
		vo.setMemPw(mem_pw);

		// DB 연동
		MemberDAO dao = new MemberDAO();
		MemberVO mvo = dao.login(vo);
		
		// id와 pw가 일치하는 member가 member_info에 있을 경우 성공
		if (mvo != null) {
			// 로그인 성공시 세션에 사용자 데이터를 저장
			HttpSession session = request.getSession();
			session.setAttribute("result", mvo);
			
			// 로그인 성공시 메인 페이지로 이동
			return "redirect:/Gomain.do";
		} else {
			// 로그인 실패시 sign 페이지에 보류			
			return "redirect:/Gosign.do";
		}
	}
}