package com.kooream.domain;

import java.sql.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class StyleVO {
	private long style_no;
	private int m_no;
	private Date style_regdate;
	private String style_content;
	private long count_like;
	private long count_reply;
	private double ratio; 
	
	private MemberVO writer;
	private ImageFileVO profile_image;
	private List<StyleImageVO> style_image;
	private List<List<StyleProductTagVO>> productTagList;
	private List<String> hashtags;
	private List<ProductVO> productList;
}
