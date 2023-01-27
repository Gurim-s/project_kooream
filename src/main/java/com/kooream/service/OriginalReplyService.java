package com.kooream.service;

import java.util.List;

import com.kooream.domain.OriginalReplyVO;

public interface OriginalReplyService {
	
	// 댓글 작성
	public int register(OriginalReplyVO vo);
	
	// 댓글 목록
	public List<OriginalReplyVO> getList(int orino);
	
	// 가품 같아요 댓글 갯수
	public int countOriOk(int orino);
	
	// 진품 같아요 댓글 갯수
	public int countOriNo(int orino);
	
	// 진품 댓글 셀렉트
	public List<OriginalReplyVO> chOk(int orino);
	
	// 가품 댓글 셀렉트
	public List<OriginalReplyVO> chNo(int orino);
}
