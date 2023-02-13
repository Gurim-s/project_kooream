package com.kooream.controller;

import java.io.IOException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.security.Provider.Service;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.BrandCartVO;
import com.kooream.domain.Criteria;
import com.kooream.domain.PaymentVO;
import com.kooream.domain.ProductVO;
import com.kooream.domain.RntRsvtVO;
import com.kooream.mapper.BrandCartMapper;
import com.kooream.service.BrandCartService;
import com.kooream.service.BrandProductService;
import com.kooream.service.BrandProductUploadService;
import com.kooream.service.PaymentService;
import com.kooream.service.RentalService;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/Payment/*")
public class PaymentController {
	
	@Setter(onMethod_ = @Autowired )
	private PaymentService payservice;
	
	@Setter(onMethod_= @Autowired)
	private RentalService Rntservice;
	

	// 주문페이지이동 페이지로 이동
	@GetMapping("/payment") public String view(Model model) { 
		  return "brandshop/shop_paymentPage";
	}
	 
	// 예약페이지에서 결제페이지로 이동
	@GetMapping
	public String goRnt_paymentPage(RntRsvtVO vo, Model model) {
		ProductVO pvo = new ProductVO();
		pvo.setP_no(vo.getP_no());
		// 상품정보 가져오기
		pvo = Rntservice.viewPrdt(pvo);
		// 이미지 리스트가져오기
		List<AttachFileVO> image_list = Rntservice.getViewImg(pvo);
		
		model.addAttribute("vo", vo);
		model.addAttribute("pvo", pvo);
		model.addAttribute("image_list", image_list);
		return "/rental/rnt_paymentPage";
	}
	
	  
	 
}
	
