package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogoutService implements Command{
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// main.jsp에서 logout 버튼을 클릭했을 때 발생하는 이벤트
		// 세션에 저장되어 있는 모든 데이터를 삭제
		
		HttpSession session = request.getSession();

		session.invalidate();

		// 메인페이지로 이동
		return "redirect:/Gomain.do";
	}
}
