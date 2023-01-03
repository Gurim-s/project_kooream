package com.kooream.service;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kooream.domain.StyleVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@Log4j
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class StyleServiceTests {
	@Setter(onMethod_ = @Autowired)
	private StyleService service;
	
	@Test
	public void testGetList() {
		List<StyleVO> list =  service.getList();
		for (StyleVO vo : list) {
			log.info(vo);			
		}
	}
}
