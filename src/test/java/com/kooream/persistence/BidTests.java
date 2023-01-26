package com.kooream.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.kooream.domain.BidShopVO;
import com.kooream.mapper.BidShopMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BidTests {
	@Setter(onMethod_ = @Autowired)
	private BidShopMapper mapper;

	@Test
	public void testInsert() {
		BidShopVO vo = new BidShopVO();
		vo.setM_NO(33);
		vo.setP_NO(33);
		vo.setBID_SELL(30000);
		vo.setBID_BUY(20000);
		
		/* mapper.insert(vo); */
		
		log.info(vo);
	}
}
