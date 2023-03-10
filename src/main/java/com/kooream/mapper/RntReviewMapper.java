package com.kooream.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kooream.domain.ProductVO;
import com.kooream.domain.RntReviewVO;

@Mapper
public interface RntReviewMapper {
	public int rgstReview(RntReviewVO vo);
	public List<RntReviewVO> getReview(int p_no);
	public int removeReview(RntReviewVO vo);
}
