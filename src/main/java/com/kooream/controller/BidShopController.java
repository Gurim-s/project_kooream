package com.kooream.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/shop/*")
@AllArgsConstructor
public class BidShopController {
	
	@GetMapping("/shop_allList")
	public String shop_List() {
		log.info("list...");
		
		return "shop/shop_allList";
	}
	
	@GetMapping("/shop_introduce")
	public String shop_introduce() {
		log.info("introduce...");
		
		return "shop/shop_introduce";
	}
	
	@GetMapping("/shop_bidpage")
	public String shop_bidpage() {
		log.info("bidpage...");
		
		return "shop/shop_bidpage";
	}
}
