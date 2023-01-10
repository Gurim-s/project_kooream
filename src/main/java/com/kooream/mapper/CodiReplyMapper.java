package com.kooream.mapper;

import java.util.List;

import com.kooream.domain.CodiReplyVO;
import com.kooream.domain.Criteria;

public interface CodiReplyMapper {
	
	public int insert(CodiReplyVO vo);
	
	
	public CodiReplyVO read(int codi_no);
	
	
	public int delete(int codi_c_no);

	public int update(CodiReplyVO vo);
	
	public List<CodiReplyVO> getList(int codi_no);
	
}
