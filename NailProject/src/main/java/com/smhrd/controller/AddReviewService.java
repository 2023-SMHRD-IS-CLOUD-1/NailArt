package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.ReviewDAO;
import com.smhrd.model.ReviewVO;

public class AddReviewService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
			// 고객이 shop.jpg에서 리뷰등록 버튼을 클릭했을 때 발생하는 이벤트
			// input data
			// shop_seq : 어떤 가게에 등록되는 리뷰인이 판별
			// review_content : 리뷰 내용 (text)
			// mem_id : 작성자
			// review_rating : 별점 (0~5)
		
			String shop_seq = request.getParameter("shop_seq");
			String review_content = request.getParameter("review_content");
			String mem_id = request.getParameter("mem_id");
			String review_rating = request.getParameter("review_rating");
			
			// type conversion
			Double shop_seq1 = Double.parseDouble(shop_seq);
			Double review_rating1 = Double.parseDouble(review_rating);
			
			// data
			ReviewVO revVo = new ReviewVO();
			revVo.setShopSeq(shop_seq1);
			revVo.setReviewContent(review_content);
			revVo.setMemId(mem_id);
			revVo.setReviewRating(review_rating1);
			
			// DB
			ReviewDAO revDao = new ReviewDAO();
			int row = revDao.addReview(revVo);
			
			// 성공 여부를 출력
//			if(row>0) {
//				System.out.println("리뷰 등록 성공");
//			}else {
//				System.out.println("리뷰 등록 실패");
//			}
		
		// ajax
		return null;
	}

}
