package com.kooream.service;

import java.util.List;
import java.util.Map;

import com.kooream.domain.CodiImageVO;
import com.kooream.domain.CodiVO;
import com.kooream.domain.Codi_TagVO;
import com.kooream.domain.Codi_itemVO;
import com.kooream.domain.Criteria;
import com.kooream.domain.ProductTagVO;
import com.kooream.domain.SearchCriteria;
import com.kooream.domain.StyleVO;

public interface CodiService {
	
	
	// 등록 Create
	public void register(CodiVO vo);	
	
	// 상세 페이지 Read  
	public CodiVO get(int codi_no);
	
	// 수정 Update
	public boolean modify(CodiVO vo);
	
	// 삭제 Delete
	public boolean remove(int codi_no);
	
	// 목록 조회 
	public List<CodiVO> getList(SearchCriteria cri);
	
	
	// 파일 리스트 
	public List<CodiImageVO> getCodiAttachList(int codi_no);
	
	// 해시태그 리스트 
	public List<Codi_TagVO> getTagList(int codi_no);

	//public List<CodiVO> getList();
	public List<CodiVO> getListWithPaging(Criteria cri);

	//검색
	public int getTotal(SearchCriteria cri);
	
	
	// 상품 태그 public List<Codi_itemVO> getCodiAndPno(int coid_no, int p_no);
	public List<ProductTagVO> getPNoListByCodiNo(int codi_no);
	
	
}


