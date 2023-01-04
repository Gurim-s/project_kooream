package com.kooream.mapper;

import java.util.List;

import com.kooream.domain.CommunityTalkVO;

public interface CommunityTalkMapper {
	public List<CommunityTalkVO> getTalkList();
	
	public void talkInsert(CommunityTalkVO vo);
}
