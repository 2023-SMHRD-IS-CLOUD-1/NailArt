package com.smhrd.frontcontroller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.controller.AddDesignerService;
import com.smhrd.controller.AddReviewService;
import com.smhrd.controller.AppointmentService;
import com.smhrd.controller.Command;
import com.smhrd.controller.DeleteAppointmentService;
import com.smhrd.controller.DeleteDesignerService;
import com.smhrd.controller.EmailCheckService;
import com.smhrd.controller.GetNailInfoAll2;
import com.smhrd.controller.JoinService;
import com.smhrd.controller.LoginService;
import com.smhrd.controller.LogoutService;
import com.smhrd.controller.SelectAllService;
import com.smhrd.controller.SelectReservService;
import com.smhrd.controller.ShopManagementService;
import com.smhrd.controller.ShopPageService;
import com.smhrd.controller.ShopRegService;
import com.smhrd.controller.ShopSelectAllService;
import com.smhrd.controller.ShopSelectSortService;
import com.smhrd.controller.UpdateService;
import com.smhrd.controller.getNailInfoAll;
import com.smhrd.controller.getShopInfo;
import com.smhrd.controller.getShopInfoAll;
import com.smhrd.controller.getStaffInfoAll;
import com.smhrd.controller.updateShopImg;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// 순서가 없고 key 값으로 value를 구분
	private HashMap<String, Command> map = null;
	
	public void init(ServletConfig config) throws ServletException{
		// Servlet 이 실행되는 순간 url- Command map에 추가
		map = new HashMap<String, Command>();
		map.put("Join.do", new JoinService());
		map.put("Login.do", new LoginService());
		map.put("Logout.do", new LogoutService());
		map.put("SelectAll.do", new SelectAllService());
		map.put("Update.do", new UpdateService());
		map.put("EmailCheck.do", new EmailCheckService());
		map.put("ShopManagement.do", new ShopManagementService());
		map.put("getShopInfoAll.do", new getShopInfoAll());
		map.put("getShopInfo.do", new getShopInfo());
		map.put("getStaffInfoAll.do", new getStaffInfoAll());
		map.put("getNailInfoAll.do", new getNailInfoAll());
		map.put("AddDesigner.do", new AddDesignerService());
		map.put("DeleteDesigner.do", new DeleteDesignerService());
		map.put("ShopPage.do", new ShopPageService());
		map.put("ShopSelectAll.do", new ShopSelectAllService());
		map.put("GetNailInfoAll2.do", new GetNailInfoAll2());
		map.put("Appointment.do", new AppointmentService());
		map.put("SelectReserv.do", new SelectReservService());
		map.put("ShopReg.do", new ShopRegService());
		map.put("updateShopImg.do", new updateShopImg());
		map.put("ShopSelectSort.do", new ShopSelectSortService());
	    map.put("DeleteAppointment.do", new DeleteAppointmentService());
	    map.put("AddReview.do", new AddReviewService());
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String uri = request.getRequestURI();
		String cp = request.getContextPath();
		String finaluri = uri.substring(cp.length()+1);
		String path = null;
		Command com = null;
		
		if(finaluri.contains("Go")) {
			// .jsp 파일에 바로 접근
			path = finaluri.substring(2).replaceAll(".do", "");
	
		}else {
			// map에 매핑되어 있는 service로 이동
			com = map.get(finaluri);
			path = com.execute(request, response);
		}

		// 페이지 이동
		if(path == null) {
			// ajax를 위한 비동기통신에서 페이지 이동을 하지 않기 위한 코드
		}
		else if(path.contains("redirect:/")) {
			// redirect로 페이지 이동
			response.sendRedirect(path.substring(10));
		}else {
			// forward로 페이지 이동
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/"+path + ".jsp");
			rd.forward(request, response);
		}
	}

}
