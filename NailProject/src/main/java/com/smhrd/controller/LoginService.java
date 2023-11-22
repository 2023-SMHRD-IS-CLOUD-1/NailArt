package com.smhrd.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginService implements Command{
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		
		// MemberVO vo = new MemberVO();
		// vo.setEmail(email);
		// vo.setPw(pw);

		// DAO dao = new DAO();

		// MemberVO mvo = dao.login(vo);

		// if (mvo != null) {
		// 	HttpSession session = request.getSession();
		// 	session.setAttribute("result", mvo);

		// }

		return "redirect:/Gomain.do";
	}
}
