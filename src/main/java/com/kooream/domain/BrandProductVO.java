package com.kooream.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BrandProductVO {
	private int P_no, B_no,  P_RELEASE_PRICE, P_STOCK, R_PRICE;
	private String  P_NAME_KO,  P_NAME_EN, P_SIZE, P_BRAND, P_MODEL_NO, P_CATEGORY, P_CLASS,   R_CHECK ;
	private Date P_RELEASE_DATE;
	
	

}
