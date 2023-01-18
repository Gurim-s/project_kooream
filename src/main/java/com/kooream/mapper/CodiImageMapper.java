package com.kooream.mapper;

import java.util.List;

import com.kooream.domain.CodiImageVO;

public interface CodiImageMapper {
	
	// 파일 넣기
	public void insert(CodiImageVO vo);
	// 지우기
	public void delete(String uuid);
	// 목록 보여주기
	public List<CodiImageVO> findbycodi_no(int codi_no);

}
