package com.kooream.mapper;

import java.util.List;

import com.kooream.domain.OriginalVO;

public interface OriginalMapper {
	
	// 정품판별 게시글 리스트
	public List<OriginalVO> oriList();
	
	// 정품판별 게시글 작성
	public void oriInsert(OriginalVO vo);
	
	//등록된 게시글의 orino(글번호) 가져오기
	public int getOrino();
	
	// 정품판별 게시글 조회
	public OriginalVO oriGet (int orino);
	
	// 정품판별 게시글 삭제
	public int oriRemove (int orino);
}
