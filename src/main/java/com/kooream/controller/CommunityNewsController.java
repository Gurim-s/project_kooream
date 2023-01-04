package com.kooream.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/community/*")
@AllArgsConstructor
public class CommunityNewsController {

	//뉴스 리스트로 이동
	@GetMapping("/index")
	public String newsList() {
		return "/community/newsList";
	}
	
	//뉴스 게시글 등록
}
