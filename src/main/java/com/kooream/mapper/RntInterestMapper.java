package com.kooream.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.kooream.domain.ProductVO;
import com.kooream.domain.RntInterestVO;

@Mapper
public interface RntInterestMapper {
	public int interestRnt(ProductVO vo);
	public RntInterestVO countInterest(ProductVO vo);
	public int intrstRemove(ProductVO vo);
}
