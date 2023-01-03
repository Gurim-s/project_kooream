package com.kooream.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/style/*")
@AllArgsConstructor
public class StyleController {

	@GetMapping("/list")
	public String list() {
		log.info("list...");
		
		return "style/list";
	}
	
}
