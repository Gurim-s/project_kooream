package com.kooream.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.kooream.domain.BrandCartVO;


@Mapper
public interface BrandCartMapper{

	public int addCart(BrandCartVO vo);

	public List<BrandCartVO> brandCartList(int m_no);

	public int Cartdelete(BrandCartVO vo);
	
	public int CartdeleteAll(int mno);
	

	
	
}

