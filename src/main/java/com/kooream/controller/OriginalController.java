package com.kooream.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kooream.service.OriginalService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/community/*")
@AllArgsConstructor
public class OriginalController {
	
	private OriginalService service;
	
	@GetMapping("/oriList")
	public String oriList() {
		return "/community/oriList";
	}
	
	// 정품판별 게시글 작성에서 보여줄 브랜드 셀렉트
//	@GetMapping("/oriRegister")
//	public List<OriginalBrandVO> oriBrandList(Model model){
//		log.info("oriBrand.....");
//		
//		model.addAttribute("list", service.getOriBrandList());
//		return service.getOriBrandList(); 
//	}
	
	@GetMapping("/oriRegister")
	public String oriRegister() {
		
		
		return "/community/oriRegister";
	}
	
	
}
