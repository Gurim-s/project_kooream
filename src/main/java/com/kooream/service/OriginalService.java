package com.kooream.service;

import java.util.List;

import com.kooream.domain.OriginalAttachVO;
import com.kooream.domain.OriginalBrandVO;
import com.kooream.domain.OriginalVO;

public interface OriginalService {
	
	// 브랜드 셀렉트 리스트
	public List<OriginalBrandVO> getOriBrandList();
	
	
	// 정품판별 게시판 리스트
	public List<OriginalVO> oriList();
	
	// 정품판별 게시판 인서트
	public void oriRegister(OriginalVO vo);
	
	// 첨부파일
	public List<OriginalAttachVO> getAttList(int orino);
	
	// 정품판별 게시글 조회
	public OriginalVO oriGet (int orino);
	
	// 정품판별 게시글 삭제
	public boolean oriRemove(int orino);
	
	// 정품판별 게시글 수정
	public boolean oriUpdate(OriginalVO vo);
	
	// 정품판별 게시글 검색
	public List<OriginalVO> brandSearch(String brandname);
}
