package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {

	// com.smhrd.controlloer 폴더에 저장되어 있는 모든 class의 부모가 되는 추상클래스
	// 자식 클랙스는 모두 execute()을 구현
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
