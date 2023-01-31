package com.kooream.mapper;

import java.util.List;

import com.kooream.domain.Codi_itemVO;

public interface Codi_itemMapper {
	
	public void insert(Codi_itemVO vo);
	public void delete(int codi_no);
	
//	public List<Codi_itemVO> getCodiAndPno(int codi_No, int p_No);
}
