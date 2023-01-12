package com.kooream.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.kooream.domain.ProductVO;
import com.kooream.domain.RntRsvtVO;

@Mapper
public interface RntRsvtMapper {
	public ProductVO getPrice(RntRsvtVO vo);
}
