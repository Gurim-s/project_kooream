package com.kooream.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kooream.domain.CommunityTalkReplyVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CommunityTalkReplyTests {
	
	@Setter(onMethod_ = @Autowired)
	private CommunityTalkReplyMapper mapper;
	
	// 구림톡 게시판 댓글 리스트
//	@Test
//	public void testGetList() {
//		
//		List<CommunityTalkReplyVO> getList = mapper.getList(31);
//		for(CommunityTalkReplyVO vo : getList) {
//			log.info(vo);
//		}
//		
//	}
	
	
	// 구림톡 게시판 댓글 달기
	@Test
	public void testRegister() {
		CommunityTalkReplyVO vo = new CommunityTalkReplyVO();
		vo.setTalkno(31);
		vo.setTalkreplycon("새해 복 많이 받으세요.");
		vo.setTalkreplyname("댓글러3");
		vo.setM_no(3);
		
		mapper.insert(vo);
		
		log.info(vo);
	}
	
	
	

}
