package com.kooream.service;

import java.util.List;

import com.kooream.domain.CodiReplyVO;
import com.kooream.domain.Criteria;

public interface CodiReplyService {

	
	public int register(CodiReplyVO vo);
	
	public CodiReplyVO get(int codi_no);
	
	public int modify(CodiReplyVO vo);

	public int remove(int codi_no);
	
	public List<CodiReplyVO> getList( int codi_no);
	
}
