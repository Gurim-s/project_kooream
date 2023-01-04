package com.kooream.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kooream.domain.ProductVO;
import com.kooream.service.RentalService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/rental/*")
public class RantalController {
	
	@Setter(onMethod_= @Autowired)
	private RentalService service;
	
	
	// 렌탈 브랜드 목록 페이지 이동
	@GetMapping("/index")
	public String rentalPage(){
		return "/rental/index";
	}
	
	// 렌탈리스트 페이지 이동
	@GetMapping("/rentalList")
	public String rentalList(@RequestParam(value="brand", required=false) String brand) {	//required=false -> brand가 null값이어도 오류 안남
		ProductVO vo = new ProductVO();
		vo = service.getList(brand);
		
		return "/rental/rentalList";
	}
	
	// 렌탈 상품 등록 페이지로 이동
	@GetMapping("/addRntPrdtPage")
	public String addRntPrdtPage() {
		return "/rental/addRntPrdt";
	}
	
	// 렌탈 상품 등록 후 목록으로 이동
	@PostMapping("/addRntPrdt")
	public String addRntPrdt(ProductVO vo) {
		
		service.addRntPrdt(vo);
		
		return "redirect:/rental/rentalList";
	}
	
	
	
}
