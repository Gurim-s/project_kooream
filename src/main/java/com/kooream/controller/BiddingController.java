package com.kooream.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.BidShopVO;
import com.kooream.domain.ProductVO;
import com.kooream.service.BidShopService;
import com.kooream.service.BiddingService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/shop/*")
@AllArgsConstructor
public class BiddingController {
	private BiddingService service;
	
	@PostMapping("/shop_buypage")
    public String shop_register(BidShopVO vo) {
        log.info("shop_buypage...");

        service.insertBuyBid(vo);
        System.out.println(vo.getBid_sell());

        return "redirect:/shop/shop_allList";
    }

	@PostMapping("/shop_sellpage")
    public String shop_bidsell(BidShopVO vo) {
        log.info("shop_sellpage...");

        service.insertBuyBid(vo);
		/* System.out.println(vo.getBid_buy()); */

        return "redirect:/shop/shop_allList";
    }

	@PostMapping("/now_sell")
    public String shop_nowsell(BidShopVO vo) {
        log.info("now_sell..");

        service.now_sell(vo);
        System.out.println(vo.getBid_buy());
        System.out.println(vo.getP_no());

        return "redirect:/shop/shop_allList";
    }
}