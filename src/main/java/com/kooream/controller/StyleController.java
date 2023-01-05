package com.kooream.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kooream.domain.Criteria;
import com.kooream.domain.StyleImageVO;
import com.kooream.domain.StyleVO;
import com.kooream.service.StyleService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/style/*")
@AllArgsConstructor
public class StyleController {
	private StyleService service;

	@GetMapping("/list")
	public String list() {
		return "style/list";
	}
	
	@PostMapping(value = "/list/hot",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE},
			consumes = "application/json")
	public ResponseEntity<List<StyleVO>> listHot(@RequestBody Criteria cri) {
		List<StyleVO> list = service.getList(cri);
		log.info(cri.getAmount() + "" + cri.getPageNum());
		return new ResponseEntity<List<StyleVO>>(list, HttpStatus.OK);
	}
	
//	@GetMapping(value = "/list/recent",
//				produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
//	public ResponseEntity<List<StyleVO>> listRecent() {
//		List<StyleVO> list = service.getList();
//		
//		return new ResponseEntity<List<StyleVO>>(list, HttpStatus.OK);
//	}
	
	@GetMapping("/register")
	public String register() {
		return "style/register";
	}
	
	@PostMapping("/register")
	public String register(StyleVO vo, RedirectAttributes rttr) {
		log.info("register....." + vo);
		service.register(vo);
		
		return "redirect:style/list";
	}
}
