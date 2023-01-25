package com.kooream.mapper;

import java.util.List;

import com.kooream.domain.OriginalReplyVO;

public interface OriginalReplyMapper {

	// 댓글 작성
	public int insert(OriginalReplyVO vo);
	
	// 댓글 목록
	public List<OriginalReplyVO> getList(int orino);
	
	// 가품 같아요 댓글 갯수
	public int countOriOk();
	
	// 진품 같아요 댓글 갯수
	public int countOriNo();
	
}
