package com.smhrd.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.lang.reflect.Field;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberVO;

public class EmailCheckService implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("getStaffInfoAll에 요청이 들어옴");
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String email = request.getParameter("email");
		System.out.println("요청받은 데이터 >> " + email);

		MemberVO vo = new MemberVO();
		vo.setMemEmail(email);

		MemberDAO dao = new MemberDAO();

		MemberVO res = dao.emailCheck(vo);

		Object fieldObj = res;
		JSONObject obj = new JSONObject();
		for (Field field : fieldObj.getClass().getDeclaredFields()) {
			field.setAccessible(true);
			Object value = null;
			try {
				value = field.get(fieldObj);
			} catch (IllegalArgumentException | IllegalAccessException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("field : " + field.getName() + " | value : " + value);
			obj.put(field.getName(), value);
		}

		if (res != null) {
			out.print(obj);
		} else {
			out.print("fail");
		}
		return null;
	}
}
