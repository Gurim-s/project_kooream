package com.kooream.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class BrandCartVO {
	private int cart_no, m_no, p_no, p_release_price, b_no ;
	private String P_NAME_EN, b_name, pp_size, fileName, uuid, uploadPath;
	
	private List<AttachFileVO> attachList;
	//private ProductVO product;
		
}
	
	
		
	
	


