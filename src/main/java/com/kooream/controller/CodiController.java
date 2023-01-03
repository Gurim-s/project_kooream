package com.kooream.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kooream.service.CodiService;
import com.koorema.domain.CodiVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/codishop/*")
public class Codicontroller {
	
	
	@Setter(onMethod_ = @Autowired)
	private CodiService service;
	

	@GetMapping("/index")
	public String list() {
		log.info("index.... ");
		
		return "codishop/index";
		
	}
	
	
	public String register(CodiVO vo) {
		log.info("vo...."+ vo);
		service.register(vo);
		
		
		
		return "redirect:/codishop/index";
		
	}
	
	
	
	
	
	
	
	
	
	
}
