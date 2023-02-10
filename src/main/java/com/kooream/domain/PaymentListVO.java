package com.kooream.domain;

import java.sql.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PaymentListVO {
	private List<PaymentVO> paymentList;
	
}
