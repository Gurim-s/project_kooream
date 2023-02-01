package com.kooream.service;

import java.util.List;

import com.kooream.domain.ProductVO;
import com.kooream.domain.RntReviewVO;

public interface RntReviewService {
	// 리뷰 등록
	public int rgstReview(RntReviewVO vo);
	// 리뷰 리스트 불러오기
	public List<RntReviewVO> getReview(ProductVO vo);
	
	// 리뷰 삭제
	public int removeReview(RntReviewVO vo);
}
