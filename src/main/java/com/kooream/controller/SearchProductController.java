package com.kooream.controller;

import lombok.AllArgsConstructor;

import lombok.extern.log4j.Log4j;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.kooream.domain.ProductVO;
import com.kooream.service.SearchProductService;

@Log4j
@Controller
@AllArgsConstructor
public class SearchProductController {
	SearchProductService service;
	
}
