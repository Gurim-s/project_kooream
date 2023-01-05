package com.kooream.service;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kooream.domain.CodiVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class codiServiceTests {

	@Setter(onMethod_ = @Autowired)
	private CodiService service;
	
//	@Test
//	public void testregister() {
//		
//		CodiVO vo = new CodiVO();
//		vo.setM_no(1);
//		vo.setCodimodel_name("유해진");
//		vo.setCodi_title("새로들어가는글");
//		vo.setCodi_content("삼시세끼 룩");
//		vo.setCodi_cm(177);
//		vo.setCodi_kg(72);
//		
//		service.register(vo);
//		
//		log.info("생성된 게시물 번호 : " + vo.getCodi_no());
//		
//		
//	}
	
//	@Test
//	public void testGetList() {
//		service.getList().forEach(board -> log.info(board));
//	}
	
//	@Test
//	public void testGet() {
//		log.info(service.get(3));
//		
//	}

//	@Test
//	public void testDelete() {
//		log.info("remove result : " + service.remove(123));
//	}
	
//	@Test
//	public void testUpdate() {
//		
//		CodiVO vo = service.get(120);
//		
//		if(vo == null) {
//			return;
//		}
//		vo.setCodi_title("수정된 제목");
//		
//		log.info("modify : " + service.modify(vo));
//	}
//	
	
	
}
