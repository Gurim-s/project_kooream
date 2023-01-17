package com.kooream.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kooream.domain.ProductVO;
import com.kooream.domain.RentalMenuVO;
import com.kooream.domain.RntRsvtVO;
import com.kooream.service.RntRsvtService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/rsvt/*")
public class RntReservationController {
	@Setter(onMethod_= @Autowired)
	private RntRsvtService service;
	
	// 상품예약 페이지 이동
	@GetMapping("/rsvtPage")
	public String rsvtPage(RntRsvtVO vo, Model model) {
		// 대여금액 불러오기
		ProductVO pVO = service.getPrice(vo);
		
		model.addAttribute("pVO",pVO);
		model.addAttribute("p_no", vo.getP_no());
		return "/rental/rsvtPage";
	}
	
	// 상품 예약 기능 & 예약 내역 확인 페이지 이동
	@GetMapping("/rgstRsvt")
	public String rgstRsvt(RntRsvtVO vo) {
		service.rgstRsvt(vo);
		
		
		return "/rental/RntConfirm";
	}
	
	// 상품 예약 내역 가져오는 ajax
	@PostMapping(value="/ajax/getRsvt", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<RntRsvtVO> rentalList(RntRsvtVO vo) {
		List<RntRsvtVO> rvo = service.getRsvt(vo);
		return rvo;
	}
	
}
