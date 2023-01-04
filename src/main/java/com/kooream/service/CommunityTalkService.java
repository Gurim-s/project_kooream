package com.kooream.service;

import java.util.List;

import com.kooream.domain.CommunityTalkVO;

public interface CommunityTalkService {
	
	// 구림톡 게시글 리스트
	public List<CommunityTalkVO> getTalkList();
	
	// 구림톡 게시글 등록
	public void talkRegister(CommunityTalkVO vo); 
}
