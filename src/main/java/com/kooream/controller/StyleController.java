package com.kooream.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
	
	@GetMapping(value = "/list/hot",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<StyleVO>> listHot() {
		List<StyleVO> list = service.getList();
		log.info("hot list....");
		return new ResponseEntity<List<StyleVO>>(list, HttpStatus.OK);
	}	
	
	@GetMapping(value = "/list/recent",
				produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<StyleVO>> listRecent() {
		List<StyleVO> list = service.getList();
		
		return new ResponseEntity<List<StyleVO>>(list, HttpStatus.OK);
	}
	
}
