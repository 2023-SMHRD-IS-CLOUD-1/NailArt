package com.smhrd.controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// 일반 클래스로 만들어줌 --> POJO(Plain Old Java Object)
public class JoinService implements Command{
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String tel = request.getParameter("tel");
		String address = request.getParameter("address");
		
		// MemberVO vo = new MemberVO();
		// vo.setEmail(email);
		// vo.setPw(pw);
		// vo.setTel(tel);
		// vo.setAddress(address);
		
		// DAO dao = new DAO();
		
		// int row = dao.join(vo);

		// if(row > 0) {
		// 	request.setAttribute("member", vo);
		// 	return "join_success";
		// }else {
		//	// redirect:/ >> 약속 기호!!
			// redirect방식으로 이동해라!!를 FC에게 알려주는 역할
		return "redirect:/Gomain.do";
		
	}
}
