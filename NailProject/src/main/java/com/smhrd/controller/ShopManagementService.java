package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.smhrd.model.AppointmentDAO;
import com.smhrd.model.AppointmentVO;
import com.smhrd.model.MemberVO;
import com.smhrd.model.ReviewDAO;
import com.smhrd.model.ReviewVO;
import com.smhrd.model.ServiceDAO;
import com.smhrd.model.ServiceVO;
import com.smhrd.model.ShopDAO;
import com.smhrd.model.ShopVO;
import com.smhrd.model.StaffDAO;
import com.smhrd.model.StaffVO;

public class ShopManagementService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// myPage.jsp에서 가게 관리 버튼을 클릭하면 발생
		// 가게와 관련된 데이터를 모두 세션에 저장
		
		// 세션에서 로그인한 사용자의 ID를 가져옴
        HttpSession session = request.getSession();
        String mem_id = ((MemberVO) session.getAttribute("result")).getMemId();

        // ShopDAO를 통해 가게 정보를 가져옴
        ShopVO vo = new ShopVO();
        vo.setMemId(mem_id);
        ShopDAO shopDAO = new ShopDAO();
        ShopVO shopInfo = shopDAO.getShopInfo(vo);

        if (shopInfo != null) {
        	session.setAttribute("shopInfo", shopInfo);
		} else {

		}
        
        // StaffDAO를 통해 스태프 정보를 가져옴
        Double shopSeq =  shopInfo.getShopSeq();
        StaffVO stfvo = new StaffVO();
        stfvo.setShopSeq(shopSeq);
        StaffDAO staffDAO = new StaffDAO();
        List<StaffVO> staffList = staffDAO.getStaffList(stfvo);
        session.setAttribute("staffList", staffList);
        
        ArrayList<Object> list1 = new ArrayList<Object>();
    	ArrayList<Object> list2 = new ArrayList<Object>();
    	List<JSONObject> jsonList2 = new ArrayList<>();
        for (StaffVO staff : staffList) {
        	ServiceVO servo = new ServiceVO();
            servo.setStaffSeq(staff.getStaffSeq());
            
            ServiceDAO serDao = new ServiceDAO();
            
            List<Double> SVC_seqList = serDao.getSVC_seq2(servo);
            
            for (Double SVC_seq : SVC_seqList) {
            	System.out.println(SVC_seq);
            }
            
            AppointmentDAO aptDao = new AppointmentDAO();
            List<AppointmentVO> AppointmentList = aptDao.getAppointmentBySVC_seqList(SVC_seqList);
            
            for (AppointmentVO Appointment : AppointmentList) {
            	list1 = new ArrayList<>();
            	list1.add(staff.getStaffSeq());
            	list1.add(Appointment.getMemId());
            	list1.add(Appointment.getAppointedAt());
            	list2.add(list1);
            	
            	JSONObject jsonItem = new JSONObject();
                jsonItem.put("staffSeq", staff.getStaffSeq());
                jsonItem.put("memId", Appointment.getMemId());
                jsonItem.put("appointedAt", Appointment.getAppointedAt());
                
                jsonList2.add(jsonItem);
            }
        }
        
        session.setAttribute("AppointmentList", list2);

        // 리뷰 리스트 가져오기
        ReviewVO revVo = new ReviewVO();
        Double shop_seq1 = shopInfo.getShopSeq();
        revVo.setShopSeq(shop_seq1);
        
        ReviewDAO revDao = new ReviewDAO();
        List<ReviewVO> reviewList = revDao.selectAllReview(revVo);
        if (reviewList != null) {
        	session.setAttribute("reviewList", reviewList);
        	for(ReviewVO review : reviewList) {
        		System.out.println(review.getReviewContent());
        	}
        }else {
        	
        }
        
        // shopmanagement.jsp로 이동
        return "redirect:/GoshopManagement.do";
	}

}