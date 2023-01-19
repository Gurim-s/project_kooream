package com.kooream.mapper;

import java.util.List;

import com.kooream.domain.Codi_TagVO;

public interface codi_TagMapper {

	// 해시 태그 추가 
	public void insert(Codi_TagVO vo);
	// 지우기
	public void delete(String tag_name);
	// 목록 보여주기 
	public List<Codi_TagVO> TagBycodi_no(int codi_no);
	
	
	
	
}
