package com.kooream.controller;

import lombok.AllArgsConstructor;

import lombok.extern.log4j.Log4j;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.kooream.domain.ProductVO;
import com.kooream.domain.SearchKeyword;
import com.kooream.service.SearchProductService;

@Log4j
@Controller
@AllArgsConstructor
public class SearchProductController {
	SearchProductService service;
	
	@PostMapping(value = "/search/product", produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public ResponseEntity<List<ProductVO>> getList(@RequestBody SearchKeyword keyword) {
		List<ProductVO> list = service.searchProductTag(keyword);
		
		return new ResponseEntity<List<ProductVO>>(list, HttpStatus.OK);
	}
}
