package com.kooream.mapper;

import java.util.List;

import com.kooream.domain.OriginalVO;

public interface OriginalMapper {
	
	// 정품 판별 게시글 리스트
	public List<OriginalVO> oriList();
	
	// 정품 판별 게시글 작성
	public void oriInsert(OriginalVO vo);
	
	//등록된 게시글의 orino(글번호) 가져오기
	public int getOrino();
}
