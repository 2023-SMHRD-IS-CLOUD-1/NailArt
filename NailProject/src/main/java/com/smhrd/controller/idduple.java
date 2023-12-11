package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberVO;

@WebServlet("/idduple")
public class idduple extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// sign.jsp에서 id를 입력하면 발생하는 이벤트
		
		// CORS
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// data
		String id = request.getParameter("id");		
		MemberVO vo = new MemberVO();
		vo.setMemId(id);
		
		// DB 연동
		// 중복되는 아이디가 있는지 확인
		MemberDAO dao = new MemberDAO();
		MemberVO mvo = dao.selectId(vo);
	
		if(mvo != null) {
			out.print("false");
		}else {
			out.print("true");
		}
	}
}
