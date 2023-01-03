package com.kooream.service;

import java.util.List;

import com.koorema.domain.CodiVO;

public interface CodiService {
	
	
	// 등록 Create
	public void register(CodiVO vo);	
	// 상세 페이지 Read  
	public CodiVO get(int codi_no);
	// 수정 Update
	public boolean modify(CodiVO vo);
	// 삭제 Delete
	public boolean remove(int codi_no);
	
	
	
	
	

}
