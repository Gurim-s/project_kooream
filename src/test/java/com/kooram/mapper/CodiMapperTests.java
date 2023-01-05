package com.kooram.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kooream.domain.CodiVO;
import com.kooream.mapper.CodiMapper;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class CodiMapperTests {

	@Autowired
	private CodiMapper mapper;

//	@Test
//	public void testinsert() {
//		CodiVO vo = new CodiVO();
//		
//		vo.setM_no(999);
//		vo.setCodimodel_name("박명수");
//		vo.setCodi_title("바보에게바보가");
//		vo.setCodi_content("바보라니...");
//		vo.setCodi_cm(190);
//		vo.setCodi_kg(89);
//		mapper.insert(vo);
//		log.info(vo);
//	}

	//	@Test
//	public void testgetList() {
//		mapper.getList().forEach(board -> log.info(board));
//
//	} 
	
//	@Test
//	public void testread() {
//		mapper.read(3);
//	}
	
//	@Test
//	public void testupdate() {
//		
//		CodiVO vo = new CodiVO();
//		
//		vo.setCodi_no(125);
//		vo.setCodi_title("봄준비!!!");
//		vo.setCodi_content("코트 시즌이 돌아왔다 !! ");
//		
//		int count = mapper.update(vo);
//		log.info("update count : " + count);
//		
//		
//	}
//	
	
	
	
}
