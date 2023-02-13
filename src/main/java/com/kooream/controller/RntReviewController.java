package com.kooream.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kooream.domain.MemberVO;
import com.kooream.domain.RntReviewVO;
import com.kooream.security.CustomUser;
import com.kooream.security.UserSession;
import com.kooream.service.RntReviewService;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/rental/*")
public class RntReviewController {
	@Setter(onMethod_= @Autowired)
	private RntReviewService service;
	
	// 댓글 등록
	@PostMapping(value="/ajax/rgstReview", produces =  MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public int rgstReview(RntReviewVO vo) {
		int result = 0;
		MemberVO userSession = new UserSession().getSession();
		if(userSession != null) {
			vo.setM_no(userSession.getM_no());
			result = service.rgstReview(vo);
		}
		return result;
	}
	
	// 댓글 삭제
	@PostMapping(value="/ajax/removeReview", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public int removeReview(RntReviewVO vo) {
		int result = service.removeReview(vo);
		return result;
	}
	
	// 댓글 불러오기
	@PostMapping(value="/ajax/getReview", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public List<RntReviewVO> getReview(@RequestParam("p_no") int p_no) {
		// 리뷰 불러오는 쿼리
		List<RntReviewVO> reviewList = service.getReview(p_no);
		return reviewList;
	}
	
	
}
