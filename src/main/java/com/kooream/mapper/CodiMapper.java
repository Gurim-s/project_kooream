package com.kooream.mapper;

import com.kooream.domain.CodiVO;

public interface CodiMapper {
	
	// 데이터 삽입 
	public void insert(CodiVO vo);
	
	// 수정 
	public int update(CodiVO vo);
	
	// 삭제 
	public int delete(int codi_no);
	
	// max(codi_no) 가져오기
	public int getcodi_no();
	
	
	
}
