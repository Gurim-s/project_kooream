package com.kooream.mapper;

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
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class StyleMapperTests {

	@Setter(onMethod_ = @Autowired)
	private StyleMapper mapper;
	
	@Test
	public void testGetList() {
		List<StyleVO> list = mapper.getList();
		for (StyleVO vo : list) {
			log.info(vo);
		}
	}
}
