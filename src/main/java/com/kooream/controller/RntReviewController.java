package com.kooream.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kooream.domain.RntReviewVO;
import com.kooream.service.RntReviewService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/rental/*")
public class RntReviewController {
	@Setter(onMethod_= @Autowired)
	private RntReviewService service;
	
	// 댓글 등록
	@PostMapping("/rgstReview")
	public String rgstReview(RntReviewVO vo) {
		service.rgstReview(vo);
		
		return "redirect:/rental/viewRntPrdt?p_no="+vo.getP_no();
	}
	/*
	// 댓글 삭제
	@GetMapping("/removeReview")
	public String removeReview(RntReviewVO vo) {
		service.removeReview(vo);
		
		return "/rental/viewRntPrdt?p_no="+vo.getP_no();
	}
	*/
	
	
	
}
