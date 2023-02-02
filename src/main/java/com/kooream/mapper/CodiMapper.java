package com.kooream.mapper;

import java.util.List;


import com.kooream.domain.CodiVO;
import com.kooream.domain.Criteria;
import com.kooream.domain.SearchCriteria;

public interface CodiMapper {
	
	// 목록 조회 
	//public List<CodiVO> getList();
	// 목록 조회 페이지 처리
	public List<CodiVO> getListWithPaging(Criteria cri);
	
	// read 
	public CodiVO read(int codi_no);
	
	
	// 데이터 삽입 
	public void insert(CodiVO vo);
	
	// 수정 
	public int update(CodiVO vo);
	
	// 삭제 
	public int delete(int codi_no);
	
	// max(codi_no) 가져오기
	public int getcodi_no();
	
	// 상품 검색
	public List<CodiVO> getList(SearchCriteria cri);
	
	//게시판 총 갯수
	public int getTotal(SearchCriteria cri);
	
}
