package com.kooream.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.kooream.domain.BrandCartVO;
import com.kooream.domain.PaymentListVO;
import com.kooream.domain.PaymentVO;


@Mapper
public interface PaymentMapper{

	public int addPayment(PaymentVO vo);
	//public int addPayment(PaymentVO payment);

	public List<PaymentVO> paymentList(int m_no);
	
	public int paymentdelete(PaymentVO vo);


	

	
	
}

