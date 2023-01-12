package com.kooream.mapper;

import java.util.List;

import com.kooream.domain.CodiImageVO;

public interface CodiImageMapper {
	
	public void insert(CodiImageVO vo);
	
	public void delete(String uuid);
	
	public List<CodiImageVO> findbycodi_no(int codi_no);

}
