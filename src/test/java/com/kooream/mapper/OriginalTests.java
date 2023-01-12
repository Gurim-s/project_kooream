package com.kooream.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kooream.domain.OriginalBrandVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class OriginalTests {
	
	@Setter(onMethod_ = @Autowired)
	private OriginalBrandMapper mapper;
	
	// 정품판별 게시글 작성시 브랜드 리스트
	@Test
	public void testGetOriBrand() {
		List<OriginalBrandVO> oriBrandList = mapper.oriBrandList();
		for(OriginalBrandVO vo : oriBrandList) {
			log.info(vo);
		}
	}
	
	
}
