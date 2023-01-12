package com.kooream.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kooream.domain.ProductVO;
import com.kooream.domain.RntRsvtVO;
import com.kooream.service.RntRsvtService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/rsvt/*")
public class RntReservationController {
	@Setter(onMethod_= @Autowired)
	private RntRsvtService service;
	
	// 상품예약 페이지 이동
	@GetMapping("/rsvtPage")
	public String rsvtPage(RntRsvtVO vo, Model model) {
		// 대여금액 불러오기
		ProductVO pVO = service.getPrice(vo);
		
		model.addAttribute("pVO",pVO);
		model.addAttribute("p_no", vo.getP_no());
		return "/rental/rsvtPage";
	}
	
	
}
