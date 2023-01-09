package com.kooream.mapper;

import java.util.List;
import java.util.stream.IntStream;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import com.kooream.domain.CodiReplyVO;
import com.kooream.domain.CodiVO;
import com.kooream.domain.Criteria;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CodiReplyMapperTests {

	@Setter(onMethod_ = @Autowired)
	private CodiReplyMapper mapper;
	
	
	
	
//	@Test
//	public void testMapper() {
//		
//		log.info(mapper);
//	}
	
	// 댓글 추가 테스트
//	@Test
//	public void testInsert() {
//		CodiReplyVO vo = new CodiReplyVO();
//		vo.setCodi_no(128);
//		vo.setReply("댓글 내용");
//		vo.setReplyer("작성자");
//		mapper.insert(vo);
//		log.info(vo);
//		
//	}
	
	
//	// 댓글 보기 테스트
//	@Test
//	public void testRead() {
//		int targetRno = 2;
//		
//		CodiReplyVO vo = mapper.read(targetRno);
//		
//		log.info(vo);
//	}
//	
//	
//	댓글 삭제 테스트
//	@Test
//	public void testDelete() {
//		int target = 1;
//		
//		mapper.delete(target);
//		
//	}

//	
//	@Test
//	public void testupdate() {
//		
//		
//		CodiReplyVO vo = new CodiReplyVO();
//		
//		vo.setCodi_c_no(2);
//		vo.setReply("업데이트 댓글");
//		
//		int count = mapper.update(vo);
//		
//		log.info("업데이트 카운터 ::::::::" + count);
//		
//		
//	}
//	
//	@Test
//	public void testList() {
//		Criteria cri = new Criteria();
//		
//		
//		
//	}
	
}
