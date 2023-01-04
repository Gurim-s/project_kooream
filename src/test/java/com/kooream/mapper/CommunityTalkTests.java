 package com.kooream.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kooream.domain.CommunityTalkVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CommunityTalkTests {

	@Setter(onMethod_ = @Autowired)
	private CommunityTalkMapper mapper;
	
	
	// 구림톡 게시판 리스트 출력 테스트
	@Test
	public void testGetTalkList() {
		
		List<CommunityTalkVO> talkList = mapper.getTalkList();
		for(CommunityTalkVO vo : talkList) {
			log.info(vo);
		}
	}
	
	@Test
	public void testTalkRegister() {
		CommunityTalkVO vo = new CommunityTalkVO();
		vo.setM_no(1);
		vo.setTalkcon("제가 세번째 글을 쓰게 되네요. 영광 입니다 하핫 ^^*");
		vo.setTalkname("구리머3");
		vo.setTalktitle("3등 당첨!!");
		
		mapper.talkInsert(vo);
		
		log.info(vo);
		
	}
	
}
