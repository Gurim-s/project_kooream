package com.kooream.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kooream.domain.BrandAdminVO;
//import com.kooream.service.BrandAdminService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/brandadmin/*")
@AllArgsConstructor
public class BrandAdminController {
	
//	private BrandAdminService service;
	
//	@GetMapping("/getList")
//	@ResponseBody
//	public ResponseEntity<List<BrandAdminVO>> brandgetList(){
//		return new ResponseEntity<List<BrandAdminVO>>(service.brandgetList(), HttpStatus.OK);
		
//	}
	
//	@GetMapping("/get")
//	public String get(BrandAdminVO vo, Model model) {
//		model.addAttribute("vo", service.get(vo));
		
//		return "/brandshop/get";
//	}

}
