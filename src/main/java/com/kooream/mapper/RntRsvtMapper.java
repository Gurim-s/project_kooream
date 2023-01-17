package com.kooream.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.kooream.domain.ProductVO;
import com.kooream.domain.RntRsvtVO;

@Mapper
public interface RntRsvtMapper {
	public ProductVO getPrice(RntRsvtVO vo);
	public int rgstRsvt(RntRsvtVO vo);
	public List<RntRsvtVO> getRsvt(RntRsvtVO vo);
}
