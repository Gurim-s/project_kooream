package com.kooream.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kooream.domain.OriginalBrandVO;
import com.kooream.domain.OriginalVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class OriginalTests {
	
	@Setter(onMethod_ = @Autowired)
	private OriginalMapper mapper;
	//private OriginalBrandMapper mapper;
	
	// 정품판별 게시글 작성시 브랜드 리스트
//	@Test
//	public void testGetOriBrand() {
//		List<OriginalBrandVO> oriBrandList = mapper.oriBrandList();
//		for(OriginalBrandVO vo : oriBrandList) {
//			log.info(vo);
//		}
//	}
	
	
	// 정품판별 게시글 작성 테스트
//	@Test
//	public void testOriRegister() {
//		OriginalVO vo = new OriginalVO();
//		
//		vo.setM_no(1);
//		vo.setBrandname("나이키");
//		vo.setOricon("정품 판별 부탁드립니다.");
//		vo.setOriname("구리머");
//		vo.setOrititle("나이키 판별");
//		
//		mapper.oriInsert(vo);
//		log.info(vo);
//	}
	
	// 정품판별 리스트
	@Test
	public void testOriList() {
		List<OriginalVO> oriList = mapper.oriList();
		for(OriginalVO vo : oriList) {
			log.info(vo);
		}
	}
	
	
}
