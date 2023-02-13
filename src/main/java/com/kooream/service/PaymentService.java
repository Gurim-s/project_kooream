package com.kooream.service;

import java.util.List;

import com.kooream.domain.AttachFileVO;
import com.kooream.domain.BrandCartVO;
import com.kooream.domain.PaymentListVO;
import com.kooream.domain.PaymentVO;

public interface PaymentService {

	// 주문내역 추가
	public int addPayment(PaymentListVO list);
	
	// 주문내역 리스트 가지고오기
	public List<PaymentVO> paymentList(int m_no);
	
	// 주문내역 사진 리스트 가지고오기
	public List<AttachFileVO> paymentgetAttachList(int p_no);
	
	// 주문내역 삭제
	public int paymentdelete(PaymentVO vo);
	

		
}





