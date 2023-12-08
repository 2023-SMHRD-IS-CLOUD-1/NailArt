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
		
			String shop_seq = request.getParameter("shop_seq");
			String review_content = request.getParameter("review_content");
			String mem_id = request.getParameter("mem_id");
			String review_rating = request.getParameter("review_rating");
			
			System.out.println("리뷰추가 데이터 들어옴 >> " + shop_seq);
			System.out.println("리뷰추가 데이터 들어옴 >> " + review_content);
			System.out.println("리뷰추가 데이터 들어옴 >> " + mem_id);
			System.out.println("리뷰추가 데이터 들어옴 >> " + review_rating);
			Double shop_seq1 = Double.parseDouble(shop_seq);
			Double review_rating1 = Double.parseDouble(review_rating);
			
			ReviewVO revVo = new ReviewVO();
			revVo.setShopSeq(shop_seq1);
			revVo.setReviewContent(review_content);
			revVo.setMemId(mem_id);
			revVo.setReviewRating(review_rating1);
			ReviewDAO revDao = new ReviewDAO();
			int row = revDao.addReview(revVo);
			
			if(row>0) {
				System.out.println("리뷰 등록 성공");
			}else {
				System.out.println("리뷰 등록 실패");
			}
		
		return null;
	}

}
